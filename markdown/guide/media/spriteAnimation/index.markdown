# Sprite Animation

This guide discusses how to implement animated sprites and use the related APIs.

<div class="guides-toc">

* [Image Sheets](#sheet)
* [Animation Sequences](#sequences)
* [Sprite Objects](#spriteobjects)
* [Sprite Control Methods](#controlmethods)
* [Sprite Properties](#spriteproperties)
* [Sprite Events](#spriteevents)

</div>


<a id="sheet"></a>

## Image Sheets

The foundation of all animated sprites in Corona is the __image&nbsp;sheet__. This can be compared to a sheet of paper on which you draw the individual frames for animated object(s). Depending on the framework, this may also be known as a sprite sheet, texture atlas, or image map. Corona uses the __image&nbsp;sheet__ terminology — and objects created via [graphics.newImageSheet()][api.library.graphics.newImageSheet] — because their usage is not limited to animated sprites. In fact, you can also use image sheets (and&nbsp;usually should) for static images picked from a portion of an image sheet. For more information on image sheets, see the [Image Sheets][guide.media.imageSheets] guide.

Pictured below is a sample image sheet for a running cat, titled `sprites-cat-running.png`. This sheet consists of eight "frames" in a specifically ordered  sequence. Conceptually, the animation begins at the <nobr>top-left</nobr> frame, proceeds to the next frame (to&nbsp;its&nbsp;right), wraps to the next row when it reaches the end of the current row, and finally stops (or&nbsp;repeats) when the entire sequence is complete.

<div class="float-right" style="float: none; margin: 10px 0px 22px 0px; color: #666; vertical-align: middle;">

-----------------------------------------------	-----------------------------------------------	
												<span style="line-height:30px;">2048</span>
<span style="margin-right:8px;">512</span>		![][images.simulator.sprites-cat-running]
-----------------------------------------------	-----------------------------------------------

</div>

To configure this image sheet in Corona, first set up an indexed table with various properties. The following example uses <nobr>uniform-sized</nobr> frames, although sprites can also use image sheets with frames packed in a tight, optimized arrangement (see&nbsp;the documentation for [graphics.newImageSheet()][api.library.graphics.newImageSheet]).

``````lua
local sheetOptions =
{
	width = 512,
	height = 256,
	numFrames = 8
}
``````

In this table, `width` and `height` specify the pixel dimensions of each individual frame. Since there are 4 frames across and the image sheet is `2048` pixels in overall width, each frame is `512` pixels wide. Similarly, since there are 2 rows and the sheet is `512` pixels in overall height, each frame is `256` pixels tall.

The next parameter, `numFrames`, specifies how many total frames exist on the image sheet. Since there are clearly 8 frames of animation for the running cat, this value should be set to `8`.

Once this table of options is declared, creating the image sheet is accomplished via the [graphics.newImageSheet()][api.library.graphics.newImageSheet] API. The image sheet file name should be passed as the first parameter and the `options` table as the second parameter:

``````lua
local sheet_runningCat = graphics.newImageSheet( "sprites-cat-running.png", sheetOptions )
``````




<a id="sequences"></a>

## Animation Sequences

All animated sprites require at least one named __sequence__ declared as either consecutive frames or <nobr>non-consecutive</nobr> frames.

### Consecutive Frames

The most basic sequence is consecutive frames. This accepts a sequence name, the starting frame index, the frame count, an optional time duration for the animation, and two optional looping parameters.

``````lua
-- sequences table
local sequences_runningCat = {
	-- consecutive frames sequence
	{
		name = "normalRun",
		start = 1,
		count = 8,
		time = 800,
		loopCount = 0,
		loopDirection = "forward"
	}
}
``````

The `name` parameter is required and can be used to set the sprite to this sequence. The `start` and `count` parameters are also required &mdash; since the running cat has 8 total frames, the start frame can be set to `1` and the count to `8`. This tells the sequence to begin at the first frame and animate consecutively through all frames until the end.

Following this, the optional `time` parameter defines the total duration of the sequence in milliseconds. This parameter can be omitted, in which case the animation will animate at the frame rate of the application (one&nbsp;frame for each time&nbsp;step).

The `loopCount` parameter defines how many times the sequence should loop (repeat). Set this to any positive integer to loop the sequence that number of times. Alternatively, to loop the sequence indefinitely, set `loopCount` to `0`. If looping is set, you can also include the `loopDirection` parameter. A&nbsp;setting of `"forward"` will loop the sequence from start to end, while a setting of `"bounce"` will animate the sequence from start to end, then animate back to the starting frame in reverse.

### Non-Consecutive Frames

Sequences can also be defined with <nobr>non-consecutive</nobr> frames. This model accepts most of the same parameters as above, but instead of a starting frame and frame count, it requires a `frames` table. This table is a <nobr>comma-delimited</nobr> list of frame indices representing frames from the image sheet.

``````lua
-- sequences table
local sequences_runningCat = {
	-- non-consecutive frames sequence
	{
		name = "fastRun",
		frames = { 1,3,5,7 },
		time = 400,
		loopCount = 0,
		loopDirection = "forward"
	}
}
``````

### Multiple Sequences

A sequences data table can (and often will) contain multiple sequences. This allows you to define all of the sequences for a sprite in one place, and later, set or change the sequence for the sprite based on the sequence `name` parameter.

To declare multiple sequences, just include multiple sequence tables separated by commas:

``````lua
-- sequences table
local sequences_runningCat = {
	-- first sequence (consecutive frames)
	{
		name = "normalRun",
		start = 1,
		count = 8,
		time = 800,
		loopCount = 0
	},
	-- next sequence (non-consecutive frames)
	{
		name = "fastRun",
		frames = { 1,3,5,7 },
		time = 400,
		loopCount = 0
	},
}
``````

<div class="guide-notebox">
<div class="notebox-title title-nomargin">Notes</div>

* The first sequence in a multi-sequence setup is considered the default. When you create a sprite object, the default sequence will be used unless you change the sequence explicitly (see&nbsp;the [sprite control methods](#controlmethods) section below).

* For a multi-sequence setup, you are not limited to using frames from one image sheet &mdash; each sequence can, in&nbsp;fact, access a unique image sheet. To&nbsp;accomplish this, simply add the `sheet` parameter to any sequence and set its value to any <nobr>pre-declared</nobr> [image sheet][api.library.graphics.newImageSheet]. For&nbsp;a complete example, please refer to [display.newSprite()][api.library.display.newSprite].

</div>




<a id="spriteobject"></a>

## Sprite Objects

Once the image sheet(s) and sequences are set up, a new [sprite object][api.type.SpriteObject] can be created with the [display.newSprite()][api.library.display.newSprite] API:

	display.newSprite( [parent,] imageSheet, sequenceData )

For this API, the `parent` parameter is optional and represents the display group in which to insert the sprite. The `imageSheet` parameter defines the default image sheet for the sprite, and `sequenceData` is the table that contains all of the sequences for the sprite.

In context of this guide, the sprite declaration would look like this:

``````lua
local runningCat = display.newSprite( sheet_runningCat, sequences_runningCat )
``````

This line will create a [display object][api.type.DisplayObject] named `runningCat` which can be moved, rotated, [transitioned][api.library.transition], linked to a [physics][api.library.physics.addBody] body, etc. &mdash; and because it's also a [sprite object][api.type.SpriteObject], it gains all of the sprite [control methods](#controlmethods) and [sprite properties](#spriteproperties) outlined below.




<a id="controlmethods"></a>

## Sprite Control Methods

The sprite library provides four primary control methods which can be used to control the playback of sprites:

* [object:play()][api.type.SpriteObject.play] &mdash; Starts the animation using the default or set sequence. Sprites do not automatically begin playing when you create them, so you must start them with this command.

* [object:pause()][api.type.SpriteObject.pause] &mdash; Pauses the animation. There is no "stop" control method, so this method serves both purposes.

* [object:setFrame()][api.type.SpriteObject.setFrame] &mdash; Immediately set or skip to an indicated frame index within the current sequence. If you want to "stop&nbsp;and&nbsp;reset" an animation after it has started playing, use the [pause()][api.type.SpriteObject.pause] and [setFrame()][api.type.SpriteObject.setFrame] commands consecutively, setting the frame back to the beginning of the sequence.

* [object:setSequence()][api.type.SpriteObject.setSequence] &mdash; Set the sprite to a specific sequence. For example, to change the `runningCat` sprite animation from `normalRun` to `fastRun` (assuming both sequences are declared in the `sequences_runningCat` table), call `runningCat:setSequence( "fastRun" )`. Then, call `runningCat:play()` to begin playing the animation, since sprites do not automatically begin playing after a sequence is set/changed.




<a id="spriteproperties"></a>

## Sprite Properties

All sprite objects have various properties. You can even modify the relative animation speed of a particular sprite. These properties are as follows:

* [object.frame][api.type.SpriteObject.frame] &mdash; Read-only integer that represents the currently shown index of the loaded sequence. This property does not set the frame; use the [setFrame()][api.type.SpriteObject.setFrame] function to explicitly set an animation frame.

* [object.isPlaying][api.type.SpriteObject.isPlaying] &mdash; This property is `true` if the animation is playing, `false` if not.

* [object.numFrames][api.type.SpriteObject.numFrames] &mdash; Read-only property that represents the number of frames in the current animation sequence.

* [object.sequence][api.type.SpriteObject.sequence] &mdash; Read-only property indicating the name of the current animation sequence.

* [object.timeScale][api.type.SpriteObject.timeScale] &mdash; Gets or sets the scale (ratio) applied to the animation time, allowing you to adjust the animation speed of a sprite dynamically.




<a id="spriteevents"></a>

## Sprite Events

The sprite system can check for [sprite events][api.event.sprite] via the implementation of a sprite listener function. This allows you to detect when an animation begins playing, when the animation ends, when it loops, etc.

To add a sprite event listener to a particular sprite, use the standard [object:addEventListener()][api.type.EventDispatcher.addEventListener] method with the `eventName` property of `"sprite"` and a reference to the listener function:

``````lua
object:addEventListener( "sprite", spriteListener )
``````

Once the event listener is added, the `spriteListener` function will be called at specific [phases][api.event.sprite.phase] during the animation:

* `began` &mdash; The animation began playing.
* `ended` &mdash; The animation showed its final frame.
* `bounce` &mdash; The animation bounced from forward to backward while playing.
* `loop` &mdash; The animation looped from the beginning of the sequence.
* `next` &mdash; The animation played a subsequent frame that's __not__ one of the above phases.

Using these phases, assume that you want the `runningCat` sprite to loop through 4 cycles of the `normalRun` sequence, then change to the `fastRun` sequence and loop indefinitely. First, the `normalRun` sequence must be modified by changing the `loopCount` to `4`. This allows you to detect an `ended` phase when all 4 loops are complete.

``````lua
local sequences_runningCat = {
	{
		name = "normalRun",
		start = 1,
		count = 8,
		time = 800,
		loopCount = 4
	},
	{
		name = "fastRun",
		frames = { 1,3,5,7 },
		time = 400,
		loopCount = 0
	},
}
``````

Next, write the listener function and add the event listener to the `runningCat` object. You can include this code after the sprite object is created, since the event listener is added via a separate command instead of being declared during the sprite instantiation.

``````lua
-- sprite listener function
local function spriteListener( event )

	local thisSprite = event.target  -- "event.target" references the sprite

	if ( event.phase == "ended" ) then	
		thisSprite:setSequence( "fastRun" )  -- switch to "fastRun" sequence
		thisSprite:play()  -- play the new sequence
	end
end

-- add the event listener to the sprite
runningCat:addEventListener( "sprite", spriteListener )
``````

Notice that the sprite listener transmits __all__ phases to the listener function, so it's your responsibility to use conditional clauses and perform an appropriate action when a specific phase occurs in the animation sequence. In the above example, only the `ended` phase is detected, which occurs after 4 complete loops of the `normalRun` sequence. When that sequence ends, the `fastRun` sequence is set and played, and because it loops indefinitely, no additional `ended` phase will ever occur.
