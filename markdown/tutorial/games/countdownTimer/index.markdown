# Creating a Countdown Timer

One challenge which new Corona developers may encounter is how to work with __time__. There are different ways of tracking time&nbsp;&mdash; you can read the number of seconds since <nobr>January 1, 1970</nobr> ([os.time()][api.library.os.time]), you can use a microsecond timer from when the app started ([system.getTimer()][api.library.system.getTimer]), or you can brave your own path and keep track of app "ticks" using an [enterFrame][api.event.enterFrame] listener. Of course there are also the [timer][api.library.timer] APIs which allow you to fire events at a specific time in the future.

These topics are discussed in detail within the [Utilizing Time and Dates][tutorial.data.timeDates] tutorial, so we won't go further in depth here&nbsp;&mdash; instead, this tutorial will illustrate how to create a visual __countdown&nbsp;timer__ which can be used for several types of games.

<!---

For this tutorial, we'll use [timer.performWithDelay()][api.library.timer.performWithDelay] to update an <nobr>on-screen</nobr> "clock," using whole seconds to track the time. While we briefly mentioned other <nobr>time-based</nobr> calls like [os.time()][api.library.os.time] which would work well for a <nobr>count-__up__</nobr> timer, we simply won't need them for a countdown timer. Instead, we are going to track the total number of seconds for which the timer is going to count down, and also use math to track the time. 

-->

## Initial Setup

Let's begin with some basic setup code:

``````{ brush="lua" gutter="true" first-line="1" }
local secondsLeft = 600  -- 10 minutes * 60 seconds

local clockText = display.newText( "10:00", display.contentCenterX, 80, native.systemFont, 72 )
clockText:setFillColor( 0.7, 0.7, 1 )
``````

Basically, we perform two simple tasks:

1. We start by defining a variable, `secondsLeft`, which will hold the number of seconds left in the countdown. To determine the number of seconds, simply multiply the number of minutes by `60` and then, optionally, add an additional number of seconds. For instance, a timer of 5&nbsp;minutes and 45&nbsp;seconds would require a `secondsLeft` value of <nobr>`5*60 + 45`</nobr>, or `345`.

2. Next, we create a [display.newText()][api.library.display.newText] object (`clockText`) to draw the time remaining on the screen. For each instance when we change the time, we'll update the `text` property of this object to visually change its readout.


## Time Update Function

If you run the code above, you'll see a large display of __10:00__ on the screen. That's a good start, but it doesn't actually do anything! Let's fix that by first writing a function which updates the visual time display:

``````{ brush="lua" gutter="true" first-line="6" highlight="[9,12,13,16,19]" }
local function updateTime( event )

	-- Decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- Time is tracked in seconds; convert it to minutes and seconds
	local minutes = math.floor( secondsLeft / 60 )
	local seconds = secondsLeft % 60

	-- Make it a formatted string
	local timeDisplay = string.format( "%02d:%02d", minutes, seconds )
	
	-- Update the text object
	clockText.text = timeDisplay
end
``````

Let's explore this function in greater detail:

1. The first step in this function is critical&nbsp;&mdash; subtract `1` from `secondsLeft`. If we didn't do this, the timer wouldn't count down! Optionally, we could add a conditional test after this line to see if `secondsLeft` equals `0` and, if&nbsp;so, trigger some event indicating that the clock has reached zero.

2. To compute the minutes, we need to reverse the time calculation that we used to convert the time into seconds, so we simply divide the number of remaining seconds by `60`. This will present us with a fractional value, but we don't need the fractional part for the "minutes" aspect of the display. Thus, we use [math.floor()][api.library.math.floor] to generate a whole number and then we store the value as the `minutes` variable. For the `seconds` variable, we __do__ need the fractional part because that will be the visual "seconds" in the display. This is easy to accomplish using the __modulus__ <nobr>operator (`%`) &mdash;</nobr> essentially <nobr>`secondsLeft % 60`</nobr> will give us the number of seconds without the minutes.

3. To make the time display in a typical time format (`MM:SS`), we need to format a string. We could use `os.date()` for this, but [string.format()][api.library.string.format] will do the job more easily. Using it, we can specify placeholders that have a certain format and then pass in values to fill those placeholders. The string format for our purposes is `"%02d:%02d"` which might look cryptic, but it's actually pretty basic. The `%` sign defines the beginning of a placeholder and the `02d` says that we want a whole number <nobr>(`d` for __decimal__)</nobr> and use two (`2`) character spaces to display it. The leading `0` says that if the number is too small to fit in the two character spaces, prefix it with enough zeros to match the requested format&nbsp;&mdash; in other words, if we have a `seconds` value of `7`, it will be formatted and displayed as `07`. Finally, `string.format()` takes one variable per placeholder, filling in the values from left to right. By passing in `minutes` first, then `seconds`, we get the traditional `MM:SS` type display.

<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The `:` is not part of the formatting&nbsp;&mdash; it's simply used to place a colon between the minutes and seconds.

* For further exploration of string formatting, please see the [Formatting String Values][tutorial.data.formattingStrings] tutorial.

</div>
</div>

4. Finally, we take the `timeDisplay` value associated with the `string.format()` command and pass it to the display object's `text` property to visually update its readout.


## Running the Timer

Now that we have an update function, let's call [timer.performWithDelay()][api.library.timer.performWithDelay] to start it running:

``````{ brush="lua" gutter="true" first-line="22" highlight="[23]" }
-- Run the timer
local countDownTimer = timer.performWithDelay( 1000, updateTime, secondsLeft )
``````

For this command, the first parameter is the amount of time to delay before the timer executes for the first time. In this case, we want to fire it every second, but we need to specify that time in milliseconds (`1000`). Next, upon each execution, we call the `updateTime` function above. Finally, since we obviously want the timer to execute once every second for the lifespan of the countdown timer, we specify the `secondsLeft` value calculated earlier.


## Fixing the Visual Alignment

If you run the entire code example above, you'll notice that the time display works properly, but there are problems with the __visual&nbsp;alignment__ as it counts down. This is because the default __font__ we're using for the text object (`native.systemFont`) contains numeric characters of varying widths. For instance, the __1__ is narrower than the __0__ or __8__ and this causes the entire text string to shift awkwardly to the left or right as the timer counts down.

While it might seem that simply setting the [anchor point][guide.graphics.transform-anchor#anchors] on the text object would solve the problem, <nobr>it won't &mdash;</nobr> because either the <nobr>left-most</nobr> or <nobr>right-most</nobr> character in the `MM:SS` format will change as the timer counts down, the display will always shift around regardless of how you anchor it.

Fortunately, there are two ways to solve this, each reasonably straightforward.

### Monospace Font

The easiest solution is to use a __monospace&nbsp;font__ for the text object. Essentially, all characters (including&nbsp;numbers) in a monospace font occupy the exact same "width" regardless of their visual appearance. This will prevent the timer display from shifting to the left or right because, as far as Corona is concerned, a&nbsp;__1__ in a monospace font occupies the same amount of screen space as a __0__, __8__, or anything else.

Numerous monospace fonts are available from various resources, including [Google Fonts](https://fonts.google.com/?category=Monospace). Once you obtain a monospace font that suits your visual game design, you can utilize it within your Corona project by following the simple steps in the [Using Custom Fonts][guide.system.customFont] guide.

### Sprite-Based Display

One potential problem with monospace fonts is that, depending on the font design, some characters will appear to have more surrounding horizontal space than other characters. For example, the digit __1__ will appear to have too much space between surrounding digits in comparison to a "wider" digit <nobr>like __0__ or __8__</nobr>, making the timer display look a bit strange.

This matter can be solved by using __sprites__ for each element in the timer display. This allows you to create a more attractive visual readout __and__ it lets you dynamically control the position of each digit relative to surrounding digits, effectively making the readout more consistently spaced.

To implement sprites, the first thing we'll need is an image similar to the following, containing all 10 digits along with a colon to separate the minutes from the seconds:

<div style="max-width: 360px; margin-top: 12px; margin-bottom: 12px;">

![][images.docs.timer-digits]

</div>

With our image created, let's modify the code example from above:

1. First, __remove__ the `clockText` text object and set up an image sheet instead:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="1" }
local secondsLeft = 10 * 60  -- 10 minutes * 60 seconds

local sheetOptions = {
	frames = {
		{ x=0, y=0, width=24, height=48 },    -- 1
		{ x=24, y=0, width=34, height=48 },   -- 2
		{ x=58, y=0, width=28, height=48 },   -- 3
		{ x=86, y=0, width=36, height=48 },   -- 4
		{ x=122, y=0, width=30, height=48 },  -- 5
		{ x=152, y=0, width=38, height=48 },  -- 6
		{ x=190, y=0, width=34, height=48 },  -- 7
		{ x=224, y=0, width=36, height=48 },  -- 8
		{ x=260, y=0, width=38, height=48 },  -- 9
		{ x=298, y=0, width=40, height=48 },  -- 0
		{ x=338, y=0, width=22, height=48 }   -- :
	},
	sheetContentWidth = 360,
	sheetContentHeight = 48
}
local sheet = graphics.newImageSheet( "timer-digits.png", sheetOptions )
``````

This tutorial won't explain the above configuration <nobr>in detail &mdash;</nobr> if you need further understanding on the topic, please see the [Image Sheets][guide.media.imageSheets] guide. Essentially, this new code defines the __frames__ of the image sheet <nobr>(11 in total)</nobr> and creates an image sheet (`sheet`).

</div>

2. Next, define a basic sprite __sequence__ and create/position the colon object on screen:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="22" }
local digitSequence = { name="digits", start=1, count=11 }

local colon = display.newSprite( sheet, digitSequence )
colon.x, colon.y = display.contentCenterX, 80
colon:setFrame( 11 )
``````

Again, this tutorial will not cover sprite setup, all of which is outlined in the [Sprite Animation][guide.media.spriteAnimation] guide. Basically, we define a simple <nobr>11-frame</nobr> sequence (`digitSequence`), create our first sprite (`colon`), position it on screen, and then set its __frame__ to `11` (note&nbsp;that the colon is the 11th frame in the image&nbsp;sheet).

</div>

3. In this example, the colon object will remain "locked" in place and all other digits will be positioned around it. We'll need 4 additional digits, so let's create them now:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="28" }
local minutesSingle = display.newSprite( sheet, digitSequence )
minutesSingle.x, minutesSingle.y = 0, 80
minutesSingle.anchorX = 1

local minutesDouble = display.newSprite( sheet, digitSequence )
minutesDouble.x, minutesDouble.y = 0, 80
minutesDouble.anchorX = 1

local secondsDouble = display.newSprite( sheet, digitSequence )
secondsDouble.x, secondsDouble.y = 0, 80
secondsDouble.anchorX = 0

local secondsSingle = display.newSprite( sheet, digitSequence )
secondsSingle.x, secondsSingle.y = 0, 80
secondsSingle.anchorX = 0
``````

The first two objects represent the __minutes__ digits and the second two objects are for the __seconds__. Don't worry about the initial __x__ position of `0` for each object&nbsp;&mdash; in this enhanced version, we'll actually use modifications within the existing `updateTime()` function to set both the frame __and__ position of every digit. Note, however, that we do specify __anchors__ for these four objects, an important aspect which ensures that each digit remains properly spaced in relation to its surrounding elements.

</div>

4. Now let's begin modifying the `updateTime()` function to take advantage of our changes so far. First, surround the `secondsLeft` calculation with a simple conditional statement&nbsp;&mdash; this will prevent `secondsLeft` from decrementing on the first "initialization" of the timer display performed in step&nbsp;#5.

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="44" highlight="[46,49]" }
local function updateTime( event )

	if ( event ~= "init" ) then
		-- Decrement the number of seconds
		secondsLeft = secondsLeft - 1
	end
``````

Next, a bit lower down in the function, __remove__ the <nobr>`clockText.text = timeDisplay`</nobr> command, since that object no longer exists. In its place, add the following highlighted blocks of code:

``````{ brush="lua" gutter="true" first-line="51" highlight="[58,59,60,61,62,63,64,65,66,68,69,70,71,72]" }
	-- Time is tracked in seconds; convert it to minutes and seconds
	local minutes = math.floor( secondsLeft / 60 )
	local seconds = secondsLeft % 60

	-- Make it a formatted string
	local timeDisplay = string.format( "%02d:%02d", minutes, seconds )
	
	-- Get the individual new value of each element in time display
	local md = tonumber( string.sub( timeDisplay, 1, 1 ) )
	local ms = tonumber( string.sub( timeDisplay, 2, 2 ) )
	local sd = tonumber( string.sub( timeDisplay, 4, 4 ) )
	local ss = tonumber( string.sub( timeDisplay, 5, 5 ) )
	if ( md == 0 ) then minutesDouble:setFrame( 10 ) else minutesDouble:setFrame( md ) end
	if ( ms == 0 ) then minutesSingle:setFrame( 10 ) else minutesSingle:setFrame( ms ) end
	if ( sd == 0 ) then secondsDouble:setFrame( 10 ) else secondsDouble:setFrame( sd ) end
	if ( ss == 0 ) then secondsSingle:setFrame( 10 ) else secondsSingle:setFrame( ss ) end

	-- Reposition digits around central colon
	minutesSingle.x = colon.contentBounds.xMin
	minutesDouble.x = minutesSingle.contentBounds.xMin
	secondsDouble.x = colon.contentBounds.xMax
	secondsSingle.x = secondsDouble.contentBounds.xMax
end
``````

Essentially, the first block determines the value of each digit in the time readout, setting them to four variables accordingly <nobr>(`md`, `ms`, `sd`, and `ss`)</nobr>. For example, if the formatted `timeDisplay` string is `05:36`, these variables will be <nobr>`0`, `5`, `3`, and `6`</nobr> respectively.

Using those four values, the __frame__ of each sprite is then set to the proper value. Note that for each, if the variable is equal to `0`, we set the frame to `10` which is actually the __0__ digit in the image sheet. Otherwise, we set the frame to the value of the variable which meshes with the image sheet representation accordingly.

In the second block, we reposition all four digits, working outward from the central colon. Basically, `minutesSingle` represents the digit directly to the __left__ of the colon. That digit is pushed directly against the left side of the colon, then `minutesDouble` is pushed against the left side of `minutesSingle`. Similarly, `secondsDouble` represents the digit directly to the __right__ of the colon, so it is pushed against the right side of the colon. Finally, `secondsSingle` is pushed against the right side of `secondsDouble`. All of this might seem complicated, but the usage of `contentBounds` properties and anchors makes it perform nicely, eliminating excess spacing between digits as the timer counts down.

</div>

5. The final modification is to "initialize" the timer display. While we could have done this in step&nbsp;#3, it would have resulted in duplicate frame setting and positioning code that we just added to the `updateTime()` function. Thus, we'll use a little trick where we explicity run the `updateTime()` before the timer begins&nbsp;&mdash; however, since we don't want this initialization to subtract `1` from the `secondsLeft` variable, we'll pass a string value of `"init"` to the function:

<div class="code-indent">

``````{ brush="lua" gutter="true" first-line="75" highlight="[76]" }
-- Initialize timer to set/position the digit sprites
updateTime( "init" )

-- Run the timer
local countDownTimer = timer.performWithDelay( 1000, updateTime, secondsLeft )
``````

As you recall, we added a conditional blocker for this in step&nbsp;#4 (line&nbsp;46). This `"init"` parameter will __only__ exist when we call the `updateTime()` function on line&nbsp;76, not when that function is called by the `countDownTimer` timer on line&nbsp;79. Thus, we make effective use of the `updateTime()` function for __two__ purposes: initializing the timer display to the value set way up on line&nbsp;1 __and__ setting the frame/position of each digit as the timer counts down.

</div>

<div class="docs-tip-outer docs-tip-color-action">
<div class="docs-tip-inner-left">
<div class="fa fa-video-camera" style="font-size: 29px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

That's it! The final line remains the same and the timer will begin counting down after 1&nbsp;second. With these modifications, we now have a colorful <nobr>sprite-rendered</nobr> timer display, and better yet, the issues of alignment and inconsistent spacing are both resolved!

</div>
</div>

## Conclusion

While working with time may seem difficult at first, in many cases it's a simple matter of integer math and usage of basic <nobr>time-based</nobr> APIs. Hopefully this tutorial has given you a foundation to get started!
