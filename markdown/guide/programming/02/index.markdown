# Chapter 2 &mdash; Upward &amp; Onward


<div class="walkthrough-nav">
<div class="walkthrough-nav-upper-right">

__&lang;__ [Previous][guide.programming.01] _|_ [Next][guide.programming.03] __&rang;__

</div>
</div>


Now that we have some experience developing a game, let's develop something a little more complex!

<div class="guides-toc">

* [Design Document](#planning)
* [Settings and Configuration](#settings)
* [Game Foundation](#gamesetup)
* [Chapter Concepts](#concepts)

</div>


<a id="planning"></a>

## Design Document

<div class="float-right" style="max-width: 240px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-0]

</div>

Before we jump into designing and programming our next game, we need to think about the features and other aspects. This usually begins with a __design&nbsp;document__([GDD](https://en.wikipedia.org/wiki/Game_design_document)) for any major project. In the interest of moving along quickly, here's a simple example:

<div class="inner-table" style="margin-top: -22px;">

&nbsp;					&nbsp;
----------------------	------------------------------------------------------
__Game Title__			Star Explorer &mdash; a space shooter game.
__Description__			Maneuver your starship through an asteroid field, destroying asteroids as you progress.
__Controls__			Tap on the ship to fire; drag the ship to move left and right.
__Sounds__				Shooting sound and explosion sound when the ship collides with an asteroid.
----------------------	------------------------------------------------------

</div>

Now we have a very basic outline for our game. Once the design document is created, you'll be surprised at how quickly it grows!

### Project Setup

With these basic design goals in mind, start a new project just like you did in the previous chapter:

1. From the __Simulator__, select __New&nbsp;Project...__ from the __File__ menu.

2. For the project/application name, type `StarExplorer` and ensure that the __Blank__ template option is selected.

3. This time, under the section where you can select a screen size, choose __Tablet&nbsp;Preset__. Notice that the width and height values change to `768` and `1024` respectively.

4. Leave the other settings at default and click __OK__ / __Next__.

5. Locate and open the project folder.




<a id="settings"></a>

## Settings and Configuration

In addition to `main.lua`, there are two important files which configure your app to work correctly on multiple types of devices: `build.settings` and `config.lua`.

### Build Settings

The `build.settings` file provides real devices <nobr>(phones, tablets, etc.)</nobr> with details they need regarding your app. This includes the supported orientations for the app, names of icon files, plugins to include, special information required by devices, and more.

Using your text editor, locate and open the `build.settings` file within your project folder. It will contain a lot of information, but let's focus on the highlighted block of code:

``````{ brush="lua" gutter="true" first-line="6" highlight="[8,9,10,11,12,13,14,15]" }
settings =
{
	orientation =
	{
		-- Supported values for orientation:
		-- portrait, portraitUpsideDown, landscapeLeft, landscapeRight

		default = "portrait",
		supported = { "portrait", },
	},
``````

Our `StarExplorer` app will only be available to play in __portrait__ mode, so we set this on the following two lines:

* <nobr>`default = "portrait",`</nobr> &mdash; This line specifies that the game should __begin__ in portrait orientation when the user first loads the app.

* <nobr>`supported = { "portrait", },`</nobr> &mdash; This line specifies that the only __supported__ orientation is also portrait. That means that even if the user turns (orients) the physical device around in their hands, your app will remain locked in portrait orientation.

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

As you learned in the previous chapter, curly brackets indicate a __table__ in the Lua programming language, and tables can contain multiple items. We could include up to four supported orientations inside this table, but since this app will support just one orientation, `"portrait"` is all that we need to include.

</div>
</div>
</div>

There are several additional things which can be included inside the `build.settings` file, but in the interest of keeping this guide as straightforward as possible, let's move on.

### Configuration Options

The `config.lua` file contains app configuration settings. This is where we specify what content resolution the app will run at, the content scale mode, how <nobr>high-resolution</nobr> devices should be handled, etc.

Using your text editor, locate and open the `config.lua` file within your project folder and inspect the following highlighted lines:

``````{ brush="lua" gutter="true" first-line="6" highlight="[8,9,10,11,12]" }
application =
{
	content =
	{
		width = 768,
		height = 1024, 
		scale = "letterbox",
``````

Notice that this `content` table contains a series of configuration settings, including:

* `width` and `height` &mdash; These values specify the __content&nbsp;area__ size for the app. Your base content area can be whatever you wish, but often it's based around a common screen width/height aspect ratio like 3:4, set here by `768` and `1024`.

<div class="code-indent">
<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

It's important to understand that these values do __not__ indicate an exact number of pixels, but rather a relative number of content "units" for the app. The content area will be scaled to fit any device's screen, with subtle differences dictated by the `scale` definition <nobr>(see the next point)</nobr>.

</div>
</div>
</div>

* `scale` &mdash; This important setting specifies how to handle the content area for screens which do not match the aspect ratio defined by the `width` and `height` settings, for example 3:4 in this case. The two most common options are `"letterbox"` and `"zoomEven"`.

<div class="code-indent">

`"letterbox"` scales the content area to fill the screen while preserving the same aspect ratio. The entire content area will reside on the screen, but this might result in "black&nbsp;bars" on devices with aspect ratios that differ from your content aspect ratio. Note, however, that you can still utilize this "blank" area and fill it with visual elements by positioning them or extending them outside the content area bounds. Essentially, `"letterbox"` is an ideal scale mode if you want to ensure that everything in your content area appears within the screen bounds on all devices.

`"zoomEven"` scales the content area to fill the screen while preserving the same aspect ratio. Some content may "bleed" off the screen edges on devices with aspect ratios that differ from your content aspect ratio. Basically, `"zoomEven"` is a good option to ensure that the entire screen is filled by the content area on all devices (and&nbsp;content clipping near the outer edges is&nbsp;acceptable).

</div>
<div class="code-indent" style="max-width: 70%;">
<div class="inner-table">

    letterbox								    zoomEven
------------------------------------------	------------------------------------------
![][images.simulator.content-letterbox]		![][images.simulator.content-zoomeven]
------------------------------------------	------------------------------------------

</div>
</div>

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

For this game, let's use `"zoomEven"` scale mode. Change <nobr>`scale = "letterbox",`</nobr> to the following and remember to save your `config.lua` file afterward!

``````{ brush="lua" gutter="true" first-line="6" highlight="[12]" }
application =
{
	content =
	{
		width = 768,
		height = 1024, 
		scale = "zoomEven",
``````

</div>
</div>
</div>




<a id="gamesetup"></a>

## Game Foundation

Now that you understand basic settings and configuration, let's continue with creating the game.

### Physics Setup

Like the `BalloonTap` project, this game will use the physics engine, so let's configure it right from the beginning. If you're using physics, it's often best to include your basic physics setup code early in the program.

Using your chosen text editor, open the `main.lua` file within your project folder and type these commands:

``````{ brush="lua" gutter="true" first-line="7" highlight="[7,8,9]" }
local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )
``````

As you can see, after loading and starting the physics engine, we set __gravity__ values. By default, the physics engine simulates standard Earth gravity which causes objects to fall toward the bottom of the screen. To change this, we use the `physics.setGravity()` command which can simulate gravity in both the horizontal (__x__) or vertical (__y__) directions. Since this game takes place in outer space, we are going to assume that gravity does not apply. Thus, we set both values to `0`.

### Random Seed

Our game will randomly spawn asteroids outside of the screen edges, so we'll be implementing random number generation further along in this project. First, though, we need to set the "seed" for the <nobr>pseudo-random</nobr> number generator. On some operating systems, this generator begins with the same initial value which causes random numbers to repeat in a predictable pattern. The following addition to our code ensures that the generator always starts with a different seed.

``````{ brush="lua" gutter="true" first-line="7" highlight="[11,12]" }
local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )

-- Seed the random number generator
math.randomseed( os.time() )
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

On the first of these two lines, observe the double minus signs (`--`). These are used to tell Lua that it should ignore everything else on the line. This is so that you can leave yourself __comments__ (notes) in the code. While it might not seem important when you are initially writing the program, the more complex the app gets, or the more time that goes by before you return to work on the app again, the more important it is to include comments for reference.

</div>
</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

When you intend to generate random numbers in an app, seed the <nobr>pseudo-random</nobr> number generator just once, typically within `main.lua`. Doing so multiple times is redundant and unnecessary.

</div>
</div>

### Including Images

Initially we'll need just two visual assets for this project. As&nbsp;before, they should be placed within your `StarExplorer` project folder.

<div class="inner-table">

File					Size (w&times;h)	Usage
----------------------	------------------	--------------------------------------------------
`background.png`		800 &times; 1400	The background image (stars).
`gameObjects.png`		112 &times; 334		The image sheet containing our game objects.
----------------------	------------------	--------------------------------------------------

</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

You can use our images as a starting point, available along with this chapter's [source files](https://github.com/coronalabs/GettingStarted02/archive/master.zip).

</div>
</div>

### Loading Image Sheets

If you've used another game development platform, you may be familiar with the term "sprite&nbsp;sheet" or "texture&nbsp;atlas." In CORONA_CORE_PRODUCT, it is called an __image&nbsp;sheet__ and it allows you to load multiple images/frames from a single larger image file. Image sheets are also used for animated sprites, where frames for the sprite are pulled from the sheet and assembled into an animated sequence.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Image sheets are most easily created using a tool such as [TexturePacker](https://www.codeandweb.com/texturepacker) which collects, organizes, and packs multiple images into a compatible image sheet. While this software isn't a requirement, it does save you time and energy.

</div>

Following your existing code, create a `sheetOptions` table as shown below. Note that it should contain a child table, `frames`, which will contain an array of Lua tables defining each frame in the sheet.

``````{ brush="lua" gutter="true" first-line="11" highlight="[14,15,16,17,18,19,20,21]" }
-- Seed the random number generator
math.randomseed( os.time() )

-- Configure image sheet
local sheetOptions =
{
	frames =
	{

	},
}
``````

<div class="float-right" style="max-width: 262px; margin-top: 20px; margin-bottom: 12px; clear: both;">

![][images.docs.sbs-starexplorer-11]

</div>

When configuring an image sheet, you must specify where the images are located within the sheet. For this game, every image is different in size, so we must provide four specific properties which define the theoretical "bounding&nbsp;box" for the portion of the image sheet to utilize:

1. `x` &mdash; the <nobr>upper-left</nobr> corner point of the image in __x__ coordinates, relative to the overall sheet width.
2. `y` &mdash; the <nobr>upper-left</nobr> corner point of the image in __y__ coordinates, relative to the overall sheet height.
3. `width` &mdash; the total width of the image.
4. `height` &mdash; the total height of the image.

With this concept in mind, add five Lua tables inside the `frames` table to declare the position and size of each image within the sheet:

<div class="float-right" style="max-width: 113px; margin-top: 14px; margin-left: 10px; clear: both;">

![][images.docs.sbs-starexplorer-1]

</div>

``````{ brush="lua" gutter="true" first-line="14" highlight="[19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48]" }
-- Configure image sheet
local sheetOptions =
{
	frames =
	{
		{	-- 1) asteroid 1
			x = 0,
			y = 0,
			width = 102,
			height = 85
		},
		{	-- 2) asteroid 2
			x = 0,
			y = 85,
			width = 90,
			height = 83
		},
		{	-- 3) asteroid 3
			x = 0,
			y = 168,
			width = 100,
			height = 97
		},
		{	-- 4) ship
			x = 0,
			y = 265,
			width = 98,
			height = 79
		},
		{	-- 5) laser
			x = 98,
			y = 265,
			width = 14,
			height = 40
		},
	},
}
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

The __order__ in which you declare each image within a sheet is very important&nbsp;&mdash; later, when you load an image from a sheet using a command such as `display.newImageRect()`, you'll need to specify the __number__ of the frame based on the order in which it was declared in the sheet configuration.

</div>
</div>

With this table of information, we can now load the image sheet into memory with the `graphics.newImageSheet()` command. This accepts the name of the image file for the image sheet (`gameObjects.png`) and a reference to the `sheetOptions` table which we just created:

``````{ brush="lua" gutter="true" first-line="49" highlight="[51]" }
	},
}
local objectSheet = graphics.newImageSheet( "gameObjects.png", sheetOptions )
``````

### Initializing Variables

In larger programs, it's a good idea to declare all of the variables that are used throughout the file near the beginning. This helps us stay organized and provides a quick reference if we forget what the name of a variable was and/or if the variable had an initial value.

Following the image sheet options and setup, add these lines:

``````{ brush="lua" gutter="true" first-line="53" }
-- Initialize variables
local lives = 3
local score = 0
local died = false

local asteroidsTable = {}

local ship
local gameLoopTimer
local livesText
local scoreText
``````
Let's examine each set of additions in detail:

* First we declare variables to keep track of the number of lives remaining <nobr>(initial value of `3`)</nobr>, the current score <nobr>(initial value of `0`)</nobr>, and whether the player has died <nobr>(initially `false`)</nobr>.

* Next we declare the variable `asteroidsTable` which will be used for a very specific purpose throughout the game. As you recall from the previous chapter, the curly brackets (`{}`) indicate a Lua [table][api.type.Table] (array). Among other things, tables are used to keep track of similar types of information.  Since there will be many asteroids on the screen in this game, it's impractical to declare each as a unique variable such as `asteroid1`, `asteroid2`, `asteroid15`, etc. We&nbsp;need a more efficient method and that's where tables can help&nbsp;&mdash; essentially, tables can contain a large amount of object references and other data, growing and shrinking as needed throughout the game's life.

* On the next few lines, we declare a variable placeholder for the ship object (`ship`), a placeholder for a timer we'll implement later, and two variables for the text objects which will display the player's remaining lives and score.

<div class="code-indent">
<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Notice that these last four declarations do not begin with any initial value or type. In Lua, this is a perfectly valid way of making a __forward&nbsp;declaration__, sometimes referred to as an __upvalue__. Effectively, we are telling Lua about a variable's existence, even if we don't intend to use it until later in the program.

</div>
</div>
</div>

Great! With our initial variables set, we can begin loading objects onto the screen.

### Using Display Groups

In the previous chapter, we simply placed objects on the __stage__&nbsp;&mdash; this is essentially the core layer/group in which all display objects exist. In this game, we'll insert objects into distinct __display&nbsp;groups__ for more controlled layering and organization. Basically, a display group is a special kind of display object which can contain other display objects and even other display groups. Imagine it as a blank sheet of paper on which you "draw" images, text, shapes, and animated sprites.

With this in mind, let's create three initial display groups. Following the lines you've already entered, add these commands:

``````{ brush="lua" gutter="true" first-line="65" }
-- Set up display groups
local backGroup = display.newGroup()  -- Display group for the background image
local mainGroup = display.newGroup()  -- Display group for the ship, asteroids, lasers, etc.
local uiGroup = display.newGroup()    -- Display group for UI objects like the score
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The most important aspect here is the __order__ in which the groups are created. In the previous chapter, you learned that images loaded in succession will stack from back to front in terms of visual layering. This same principle applies to display groups&nbsp;&mdash; not only will display objects inserted into a display group stack/layer in this <nobr>back-to-front</nobr> manner, but you can also layer display groups one atop the other by creating them in similar succession.

</div>

### Loading the Background

As in the previous project, we'll load the background image first:

<div class="float-right" style="max-width: 240px; margin-top: 14px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-12]

</div>

``````{ brush="lua" gutter="true" first-line="70" }
-- Load the background
local background = display.newImageRect( backGroup, "background.png", 800, 1400 )
background.x = display.contentCenterX
background.y = display.contentCenterY
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

These commands should appear straightforward at this point, but there is one very important difference! Inspect the first parameter to [display.newImageRect()][api.library.display.newImageRect]&nbsp;&mdash; before the image file name (now&nbsp;the second&nbsp;parameter), we indicate the __display&nbsp;group__ (`backGroup`) in which to place the object. This is a convenient inline shortcut to specify the display group to insert the background image once it's loaded.

</div>
</div>

### Loading the Ship

As mentioned earlier, image sheets can be used as a source for an animated sequence of images (sprite) __or__ they can be used to organize a collection of static images that will be used within your app. For this project, we'll use the second method.

Loading an individual image from an image sheet is similar to loading it from a file. Instead of supplying an image name, however, we specify a reference to the image sheet along with a frame number. Add the following highlighted line to your project code:

``````{ brush="lua" gutter="true" first-line="71" highlight="[75]" }
local background = display.newImageRect( backGroup, "background.png", 800, 1400 )
background.x = display.contentCenterX
background.y = display.contentCenterY

ship = display.newImageRect( mainGroup, objectSheet, 4, 98, 79 )
``````

Let's inspect this command in more detail:

* The first parameter specifies the display group that the object will be placed (`mainGroup`). (not&nbsp;simply on the&nbsp;stage).

* The second parameter is the reference to the image sheet we loaded earlier (`objectSheet`).

* Since the ship is the 4th frame in our image sheet configuration, we specify `4` as the frame number (third&nbsp;parameter).

* Finally, as usual, we set the width and height to `98` and `79`, matching the frame's `width` and `height` values in the image sheet configuration.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Remember that we declared a __forward&nbsp;reference__ for the ship object earlier in the program:

<div style="margin-bottom: 14px;">

``````{ brush="lua" gutter="true" first-line="60" highlight="[60]" }
local ship
local gameLoopTimer
local livesText
``````

</div>

Because of this, we don't need to preface the new <nobr>`ship = display.newImageRect()`</nobr> command with `local`. Essentially, we are now just setting the `ship` variable declared earlier to an actual value <nobr>(an image object)</nobr>.

</div>
</div>

Let's continue configuring the ship with the following highlighted commands:

<div class="float-right" style="max-width: 240px; margin-top: 14px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-13]

</div>

``````{ brush="lua" gutter="true" first-line="75" highlight="[76,77,78,79]" }
ship = display.newImageRect( mainGroup, objectSheet, 4, 98, 79 )
ship.x = display.contentCenterX
ship.y = display.contentHeight - 100
physics.addBody( ship, { radius=30, isSensor=true } )
ship.myName = "ship"
``````

With the first two commands, we position the ship at the <nobr>bottom-center</nobr> of the screen. You'll recognize `display.contentCenterX` from the previous chapter, but this time we utilize a new command, `display.contentHeight`. This convenient property indicates the maximum __y__ coordinate of the content area (bottom&nbsp;edge of&nbsp;the&nbsp;screen). Since the ship should be positioned slightly above this point, however, we subtract `100` from this value.

Next, we add the ship to the physics engine with a `radius` property of `30`. In addition, we specify an important <nobr>property: `isSensor=true`.</nobr> This specifies that the object should be a __sensor__ object. Essentially, sensor objects detect collisions with other physical objects but they do __not__ produce a physical response. For example, if a normal body collides with a sensor body, the two bodies will not bounce off each other or cause any other physical reaction. This is ideal for our ship object, because we only want it to detect collisions with asteroids, not bounce off them.

Lastly, we give the ship object a `myName` property of `"ship"`. This property will be used later to help determine what types of collisions are happening in the game.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Although the ship image clearly isn't circular, we added a circular physics body (`radius=30`) to the ship object. For this game, we're just being somewhat "lazy" by using this approximate body shape&nbsp;&mdash; once you get more comfortable with CORONA_CORE_PRODUCT, you'll learn how to add a perfect <nobr>shape-based</nobr> physics body to the ship which accurately matches the ship image's outline.

</div>

### Lives and Score

Now let's place UI labels for the player's lives and score on the screen:

``````{ brush="lua" gutter="true" first-line="81" }
-- Display lives and score
livesText = display.newText( uiGroup, "Lives: " .. lives, 200, 80, native.systemFont, 36 )
scoreText = display.newText( uiGroup, "Score: " .. score, 400, 80, native.systemFont, 36 )
``````

To keep things simple, we use a special Lua method with the labels to show our lives and score. Placing two periods together in Lua (`..`) is called __concatenation__. Concatenation joins two strings into one. Thus, in the <nobr>`livesText = display.newText()`</nobr> command above, we are joining the string `Lives:` and the variable `lives` for a result of <nobr>`Lives: 3`</nobr> being displayed on the screen (remember&nbsp;that we set the initial value of `lives`&nbsp;to&nbsp;`3` earlier). Similarly, for `scoreText`, we join the string `Score:` and the variable `score` for a result of <nobr>`Score: 0`</nobr>.

<div class="float-right" style="max-width: 240px; margin-top: 16px; margin-bottom: 16px; clear: both;">

![][images.docs.sbs-starexplorer-2]

</div>

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

Let's check the result of our code so far. Save your modified `main.lua` file and relaunch the Simulator. If all went well, the background, ship, and text labels should now be showing on the screen.

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Everything looks good so far except for the slightly distracting __status&nbsp;bar__ at the top of the screen. On mobile devices, this <nobr>system-generated</nobr> element usually displays various information like the strength of the cellular/WiFi connection, the time, the remaining battery life, etc. While this information is valuable for general usage of the device, it can be distracting when the user is playing a game. To&nbsp;hide the status bar, add the following:

``````{ brush="lua" gutter="true" first-line="85" highlight="[86]" }
-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )
``````

</div>
</div>

Finally, let's write a function to update the `text` property of both `livesText` and `scoreText`. This will be similar to the function we wrote in the previous chapter. As you recall, any time you create a new label or object with [display.newText()][api.library.display.newText], the text's label/value is stored in the `text` property of the object, so we update that property with the __concatenated__ string value of the label and its associated variable.

``````{ brush="lua" gutter="true" first-line="89" }
local function updateText()
	livesText.text = "Lives: " .. lives
	scoreText.text = "Score: " .. score
end
``````

Now that we have the basic visual objects in place, can load images from the image sheet, and update the UI labels for both lives and score, we're ready to get started on the game logic and events!

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

For reference purposes, the program up to this point is available [here](https://github.com/coronalabs/GettingStarted02/archive/master.zip). If your project doesn't behave as expected, please compare this source code with your own.

</div>
</div>




<a id="concepts"></a>

## Chapter Concepts

We've covered several more concepts in this chapter. Here's a quick overview:

<div class="inner-table">

Command/Property															Description
--------------------------------------------------------------------------	-----------------------------------------
[physics.setGravity()][api.library.physics.setGravity]						Sets the __x__ and __y__ components of the global gravity vector in units of m/s&sup2;.
[math.randomseed()][api.library.math.randomseed]							Sets the "seed" for the <nobr>pseudo-random</nobr> number generator.
[graphics.newImageSheet()][api.library.graphics.newImageSheet]				Creates an [ImageSheet][api.type.ImageSheet] object for loading multiple images/frames from a single larger image file.
[display.newGroup()][api.library.display.newGroup]							Creates a display group for organizing/layering display objects.
[display.contentHeight][api.library.display.contentHeight]					Shortcut for the height of the content area.
[display.setStatusBar()][api.library.display.setStatusBar]					Hides or changes the appearance of the status bar on most devices.
--------------------------------------------------------------------------	-----------------------------------------

</div>


##

<div class="walkthrough-nav">

__&lang;__ [Chapter 1 &mdash; Creating a project][guide.programming.01] _|_ [Chapter 3 &mdash; Bringing it to Life][guide.programming.03] __&rang;__

</div>
