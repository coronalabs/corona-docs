# Performance and Optimization

As you develop your application, you should always consider how your design choices affect performance. Despite ongoing core improvements, mobile devices still face fundamental constraints in processing power, memory usage, and battery life. Therefore, performance and optimization is crucial to achieving faster response time, minimizing memory usage, and maximizing battery life.

<div class="guides-toc">

* [Using Memory Efficiently](#memory)
* [Reducing Power Consumption](#power)
* [Transitions and Animations](#transitions)
* [Conserving Texture Memory](#texturemem)
* [Draw Calls / Batching](#draw)
* [Lua Optimizations](#lua)
* [Managing Audio](#audio)

</div>



<a id="memory"></a>

## Using Memory Efficiently

Memory is a critical resource on mobile devices. Some devices may even terminate your application if you consume too much memory.

* __Eliminate memory leaks__ &mdash; your application should __not__ have memory leaks. Although Lua handles memory management and cleanup automatically, memory leaks can still occur. For example, global variables are never considered garbage; it's up to you to tell Lua that these variables are garbage by setting them to `nil`.

<div class="code-indent">
<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Global variables are __not__ recommended in general, but if you must use them for convenience, ensure that you remove them from memory when they're no longer needed <nobr>(set them to `nil`)</nobr>.

</div>
</div>
</div>

* __Keep resource files as small as possible__ &mdash; resource files used by your application typically reside on the disk. They must be loaded into memory before they can be used. Images and audio files should be as small as possible. You should also reuse the same image assets whenever it's feasible. For example, if you design a <nobr>flip-style</nobr> menu with the same background image for each page, you should use that image on all pages and layer the necessary foreground images over it. For more details, please see [Conserving Texture Memory](#texturemem) below.

* __Load resources lazily__ &mdash; avoid loading resource files until they're actually needed. While <nobr>pre-loading</nobr> resource files might seem like good practice, this can actually backfire because of how devices respond to low memory situations. One notable exception is audio files. In general, you should load sound effects for a particular scene or level before it begins, because loading them on demand can cause a slight skip during <nobr>time-critical</nobr> code. For more information, see [Managing Audio](#audio) below.

* __Remove objects from the display hierarchy__ &mdash; when a display object is created, it is implicitly added to the display hierarchy. When you no longer need a display object, you should remove it from the display hierarchy and set its reference to `nil`. This makes the object eligible for garbage collection. However, this is no guarantee that the object will be removed from memory. If other variables in memory reference the display object, Lua will __not__ consider it garbage. See the [Display&nbsp;Objects][guide.media.displayObjects] guide for more information on removing objects.




<a id="power"></a>

## Reducing Power Consumption

Battery life is inherently limited on mobile devices because of their small form factor. You can improve battery life by adhering to the following practices.

* __Network access__ consumes a considerable amount of power. You can minimize the impact of network traffic by following these guidelines:

	* Do not "poll" but rather connect to external network servers only when necessary.
	* Optimize the data that you transmit so it's as small as possible.
	* Transmit in bursts. More power is consumed the longer the network is actively transmitting data. It's better to transmit data in bursts rather than spreading it out into smaller transmission packets over time.

* __GPS__ and __accelerometer__ hardware also consumes power. If you access location data via GPS, stop collecting it when you have the data you need. If you use the accelerometer, try to limit it to scenes where it's essential for the desired functionality.

* __Disk access__ &mdash; reading and writing files to the device's local disk&nbsp;&mdash; should be handled similarly to network access. It's better to transmit larger packets of data to/from the disk rather than spreading it out over numerous smaller transactions.




<a id="transitions"></a>

## Transitions and Animations

If you need to set or transition/tween a specific property of several display objects to the same value&nbsp;&mdash; for example, fade an entire overlay menu <nobr>to `alpha=0` &mdash;</nobr> it's better to add the objects to a display group and modify the property of the entire group. It's easier to code and it optimizes memory and speed. See the [Group&nbsp;Programming][guide.graphics.group] guide for more information.

If you're using sprite animations, a common oversight is allowing offscreen or invisible sprites to continue animating. While these sprites may not be visible to the user, they'll continue to use processor power while animating. We suggest that you pause all animations that move off the screen or otherwise become inactive.




<a id="texturemem"></a>

## Conserving Texture Memory

Texture memory is often ignored until it reaches "critical mass," at which point it's <nobr>time-consuming</nobr> to make the required changes to art assets.

<!---

Note that 8-bit or 24-bit `.png` images all unpack into <nobr>32-bit</nobr> images. They are rectangular arrays of pixels and there are effectively 4 color arrays (channels) per image: red, green, blue, and alpha <nobr>(RGB+A)</nobr>.

-->

As general practice, remember these tips in respect to managing texture memory:

1. Always unload textures (remove them from the display hierarchy) when they're no longer needed.

2. If you're using image sheets, consider using a tool like [TexturePacker](https://www.codeandweb.com/texturepacker) to pack your images into the smallest configuration possible.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

There is a limit on the maximum texture size that a device will support. If you exceed this limit, the texture will automatically downscale to fit within the maximum. You can use the <nobr>`system.getInfo( "maxTextureSize" )`</nobr> command to determine the maximum texture size for a particular device. See [system.getInfo()][api.library.system.getInfo] for more information.

</div>




<a id="draw"></a>

## Draw Calls / Batching

On devices, OpenGL performs best when you are able to minimize state changes. This is because multiple objects can be batched into a single draw call if there are no state changes required between consecutive display objects.

Solar2D's rendering engine attempts to identify situations where multiple display objects can be submitted in a single draw call. Whenever possible, you should try to arrange the display object hierarchy such that __consecutive__ display objects&nbsp;&mdash; meaning, the order in which they are rendered&nbsp;&mdash; can be batched into a single draw call.

There are certain situations where this can occur. The general rule is that consecutive display objects which use the same texture can be batched. This includes display objects that use different frames from the same [image sheet][api.library.graphics.newImageSheet], since the underlying texture is the same. In these situations, you can vary the position, tint, and alpha of each object without breaking the batch, but remember that some actions may prevent batching, for example adding a [shader effect][guide.graphics.effects] to an object.




<a id="lua"></a>

## Lua Optimizations

At the code level, you should adhere to as many Lua optimizations as possible. Most of the performance tricks below pertain primarily to <nobr>time-critical</nobr> routines&nbsp;&mdash; that is, points in your app where there is a lot happening or where the user experience could be adversely affected by sluggish performance. However, every bit helps and we suggest that you follow these as a habit.

### Localize, Localize

In contrast to global variables, which should be avoided whenever possible, access to __local__ variables and functions is simply faster, especially in <nobr>time-critical</nobr> routines.

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3,4,5,6,7]" }
-- Local (recommended)
local CCX = display.contentCenterX  -- Local variable

for i = 1,100 do
	local image = display.newImage( "myImage.png" )
	image.x = CCX
end
``````

``````lua
-- Non-local (discouraged)
CCX = display.contentCenterX  -- Global variable

for i = 1,100 do
	local image = display.newImage( "myImage.png" )
	image.x = CCX
end
``````

This also applies to core Lua libraries like the `math` library. In <nobr>time-critical</nobr> routines, you should always localize library functions.

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3,4,5,6,7,8,9]" }
-- Local (recommended)
local sin = math.sin  -- Local reference to "math.sin"

local function foo(x)
	for i = 1,100 do
		x = x + sin(i)
	end
	return x
end
``````

``````lua
-- Non-local (discouraged)
local function foo( x )
	for i = 1,100 do
		x = x + math.sin(i)
	end
	return x
end
``````

Finally, remember that functions should be localized whenever possible. Of course, this will require proper scoping!

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3,4,5,6,7,8,9,10]" }
-- Local (recommended)
local function func2( y )  -- "func2()" properly scoped above "func1()"
	print( y )
end

local function func1()
	func2( "myValue" )
end

func1()
``````

``````lua
-- Non-local (discouraged)
function func1()
	func2( "myValue" )
end

function func2( y )
	print( y )
end

func1()
``````

### Avoid "table.insert()"

Let's compare four methods that all achieve the same thing: the common act of inserting values into a table. Of the four, the Lua `table.insert()` function is a mediocre performer and should be avoided.

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3,4,5,6]" }
-- Loop index method (recommended)
local a = {}

for i = 1,100 do
	a[i] = i
end
``````

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3,4,5,6,7,8]" }
-- Counter method (recommended)
local a = {}
local index = 1

for i = 1,100 do
	a[index] = i
	index = index+1
end
``````

``````lua
-- Table size method (acceptable)
local a = {}

for i = 1,100 do
	a[#a+1] = i
end
``````

``````lua
-- "table.insert()" (discouraged)
local a = {}

for i = 1,100 do
	table.insert( a, i )
end
``````

### Avoid "unpack()"

The Lua `unpack()` function is not a great performer. Fortunately, a simple loop can be written to accomplish the same thing:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3,4,5,6]" }
-- Loop method (recommended)
local a = { 100, 200, 300, 400 }

for i = 1,100 do
	print( a[1],a[2],a[3],a[4] )
end
``````

``````lua
-- "unpack()" (discouraged)
local a = { 100, 200, 300, 400 }

for i = 1,100 do
	print( unpack(a) )
end
``````

The caveat is that you must know the length of the table to retrieve all of its values in the loop method. Thus, `unpack()` still has its uses&nbsp;&mdash; in a table of unknown length, <nobr>for example &mdash;</nobr> but it should be avoided in <nobr>time-critical</nobr> routines.

### Avoid "ipairs()"

When iterating through a table, the overhead of the Lua `ipairs()` function does not justify its use, especially when you can accomplish the same thing using a Lua construct.

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3,4,5,6,7,8,9,10]" }
-- Lua construct (recommended)
local t1 = {}
local t2 = {}
local t3 = {}
local t4 = {}
local a = { t1, t2, t3, t4 }

for i = 1,#a do
	print( a[i] )
end
``````

``````lua
-- "ipairs()" (discouraged)
local t1 = {}
local t2 = {}
local t3 = {}
local t4 = {}
local a = { t1, t2, t3, t4 }

for i,v in ipairs( a ) do
	print( i,v )
end
``````

### Math Performance

Certain mathematical functions and processes are faster than others. For example, multiplication is faster than division and you should usually multiply by a decimal instead of dividing.

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3]" }
-- Multiplication by decimal (recommended)
x * 0.5
y * 0.125
``````

``````lua
-- Division (acceptable)
x / 2
y / 8
``````

Multiplication is also faster than exponentiation:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2]" }
-- Multiplication (recommended)
x * x * x
``````

``````lua
-- Exponentiation (acceptable)
x^3
``````

Finally, avoid `math.fmod()` for positive numbers and use the modulus operator instead:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3,4,5,6]" }
-- Modulus operator (recommended)
for i = 1,100 do
	if ( ( i%30 ) < 1 ) then
		local x = 1
	end
end
``````

``````lua
-- "math.fmod()" (discouraged)
local fmod = math.fmod
for i = 1,100 do
	if ( fmod( i,30 ) < 1 ) then
		local x = 1
	end
end
``````




<a id="audio"></a>

## Managing Audio

When using audio, you should compress/sample sounds to the smallest acceptable quality in most cases. Also, using simple, <nobr>cross-platform</nobr> formats like `.wav` do not tax the CPU heavily.

### Preloading Audio

Sound effects for an app should almost always be preloaded in <nobr>__non__-time-critical</nobr> code, for example, before a scene or level begins. 

If desired, sound effects can be organized in a table as follows, for easy reference and eventual disposal.

``````lua
local soundTable = {
   mySound1 = audio.loadSound( "a.wav" ),
   mySound2 = audio.loadSound( "b.wav" ),
   mySound3 = audio.loadSound( "c.wav" ),
   mySound4 = audio.loadSound( "d.wav" ),
   mySound5 = audio.loadSound( "e.wav" ),
   mySound6 = audio.loadSound( "f.wav" ),
   mySound7 = audio.loadSound( "g.wav" ),
   mySound8 = audio.loadSound( "h.wav" ),
}
``````

With this structure, playback is as simple as:

``````lua
local mySound = audio.play( soundTable["mySound1"] )
``````

### Disposing Audio

Remember, you __must__ dispose of audio files when they're no longer needed __and__ clear any references to them. Assuming the table structure above is used to organize and preload sounds, the following loop will dispose of the audio handles:

``````lua
for s = #soundTable,1,-1 do
	audio.dispose( soundTable[s] ) ; soundTable[s] = nil
end
``````
