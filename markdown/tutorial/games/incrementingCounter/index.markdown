# Building an Incrementing Counter

When you complete a level in a game, it sometimes shows your score in an animated fashion. Sometimes this involves the numbers "spinning" such that they count up from the <nobr>right-most</nobr> column to the next column over and so on, like an odometer of a car but much faster.

<div style="max-width: 400px; margin-top: 12px; margin-bottom: 12px;">

![][images.docs.score-counter]

</div>

Achieving this effect in Corona involves some simple math. Let's start with some initial setup:

``````{ brush="lua" gutter="true" first-line="1" }
local scoreText = display.newText( "000000", display.contentCenterX, 60, native.systemFont, 48 )
``````

This code is very straightforward &mdash; we just create a text object, `scoreText`, with an initial display of __000000__, positioned in the <nobr>top-center</nobr> area of the screen.


## Controlling the Rate

The first thing to understand is that Corona is a <nobr>frame-based</nobr> system. This means that the screen updates essentially at a fixed pace, usually referred to as __frames&nbsp;per&nbsp;second__. At 60 frames per second, the screen can only update every 1/60th of a second (16.6667 milliseconds), so trying to force a faster update rate is an exercise in futility.

Obviously, game scores can vary greatly&nbsp;&mdash; one game may have a maximum score of 100 while another will have a maximum score in the millions. Thus, we don't want the counter to count up by a fixed amount like +1 on each frame update. If so, a score of 1,000,000 would take too far long to update&nbsp;&mdash; approximately 16667&nbsp;seconds at 60 frames per second&nbsp;&mdash; while a score like 100 would finish far too quickly <nobr>(about 1.67 seconds)</nobr>.

A better solution is to determine __how long the animation should run__ and then calculate the amount that it should increment on each frame update.

<!---
In this example, the score will be given 4 seconds to spin up from 0 up to the final value.
-->

## Determining the Increment

<!---
First we need to figure out how many “passes” are required. This value is simply the time in milliseconds (duration) divided by the frame rate of the app (fps).
-->

Determining the amount by which to increment the score can be done via a method called __linear&nbsp;interpolation__. This basically allows you to compute intermediate points between two values based on some criteria. Let's add a function for this to our existing code:

``````{ brush="lua" gutter="true" first-line="1" highlight="[3,4,5]" }
local scoreText = display.newText( "000000", display.contentCenterX, 60, native.systemFont, 48 )

local function lerp( v0, v1, t )
	return v0 + t * (v1 - v0)
end
``````

This `lerp()` function is straightforward enough. We take the difference between the start and stop values <nobr>(`v1 - v0`)</nobr> and multiply it by the fraction of the time (`t`) which we want to know the increment for <nobr>(more on this below)</nobr>. Then we add that to the start value (`v0`).


## Incrementing the Score

Now let's add a `incrementScore()` function which will do most of the actual work:

``````{ brush="lua" gutter="true" first-line="1" highlight="[7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]" }
local scoreText = display.newText( "000000", display.contentCenterX, 60, native.systemFont, 48 )

local function lerp( v0, v1, t )
	return v0 + t * (v1 - v0)
end

local function incrementScore( target, amount, duration, startValue )

	local newScore = startValue or 0
	local passes = (duration/1000) * display.fps
	local increment = lerp( 0, amount, 1/passes )

	local count = 0
	local function updateText()
		if ( count <= passes ) then
			newScore = newScore + increment
			target.text = string.format( "%06d", newScore )
			count = count + 1
		else
			Runtime:removeEventListener( "enterFrame", updateText )
			target.text = string.format( "%06d", amount + (startValue or 0) )
		end
	end

	Runtime:addEventListener( "enterFrame", updateText )
end
``````

As you can see, this function accepts four parameters:

* `target` &mdash; The text object which should be updated (required).
* `amount` &mdash; The amount by which to increment the score counter (required).
* `duration` &mdash; The duration of the <nobr>count-up</nobr> routine in milliseconds (required).
* `startValue` &mdash; An optional starting value for the score counter. This can be specified if you want to begin counting up from a value greater than&nbsp;0, for instance if you're adding to an existing score.

__Inside__ the function, we essentially take these steps:

1. We set a temporary value, `newScore`, with a value of the `startValue` parameter <nobr>(or `0` if `startValue` is</nobr> not&nbsp;supplied).

2. Next, we calculate the number of "passes" necessary to reach the final score value. This is determined by the specified duration, converted from milliseconds to seconds, multiplied by the app's <nobr>frames-per-second</nobr> setting. For example, if we specify a duration of `4000` (4&nbsp;seconds) and the app runs at 60 frames per second, that results in <nobr>`4 * 60`</nobr> or `240` passes.

3. Following this, we run the `lerp()` function using the calculated values. This returns the amount by which to increment the counter on each pass, and we store that as the `increment` variable.

4. In the next block, we utilize a basic counter variable (`count`) and a nested `updateText()` function. This function will run once per frame <nobr>(as commanded in step #5)</nobr> for the total number of passes, adding the `increment` value to the score each time. That updated value is then set as the `text` property of the target display object (`scoreText`) but not before it's __formatted__ using [string.format()][api.library.string.format] to appear as 6 total digits with leading zeros.

<div class="code-indent">

When the counting duration is complete, we stop the <nobr>per-frame</nobr> execution of the `updateText()` function and then set the score counter to the final value, once again formatted to appear as 6 total digits with leading zeros.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The proper format (`string.format()`) of the score counter value will depend on your particular scenario. If you're only counting up to a maximum score of 100, you probably shouldn't format it as 6 digits with <nobr>leading zeros &mdash;</nobr> in that case, a format specification of `"%03d"` (3&nbsp;digits) would be better than `"%06d"`. Also note that formatting is entirely optional and you don't need to apply __any__ formatting if it's not desired.

* For further exploration of string formatting, please see the [Formatting String Values][tutorial.data.formattingStrings] tutorial.

</div>
</div>

5. On the final line inside the function (line&nbsp;25), we simply start the `updateText()` function executing on each runtime frame (as&nbsp;noted&nbsp;above, this process is stopped on line&nbsp;20 when the <nobr>count-up is complete)</nobr>.


## Running the Process

Running the counting process is simple&nbsp;&mdash; just call the `incrementScore()` function with the required parameters, for example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1]" }
incrementScore( scoreText, 750800, 4000 )
``````

This will make the `scoreText` text object count from __000000__ up to __750800__ over the total timespan of 4&nbsp;seconds.


## Conclusion

Hopefully this tutorial gets you started with a classic "spinning&nbsp;score&nbsp;counter" feature for your game. With a little creativity, you can adjust this to fit nearly any scenario and any maximum score threshold!
