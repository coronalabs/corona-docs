# display.newSprite()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.function]
> __Library__           [display.*][api.library.display]
> __Return value__      [SpriteObject][api.type.SpriteObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sprite, animation
> __See also__          [Sprite Animation][guide.media.spriteAnimation] _(guide)_
>						[Image Sheets][guide.media.imageSheets] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a sprite object. Sprites allow for animated sequences of frames that reside on __image&nbsp;sheets__. Please see the [Sprite Animation][guide.media.spriteAnimation] and [Image Sheets][guide.media.imageSheets] guides for more information.

The local origin is at the center of the sprite and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.

By default, sprites use frames that reside on a single image sheet. This corresponds to the image sheet you pass to the `display.newSprite()` constructor.

For each sequence, you can specify a different image sheet instead of using the default image sheet. You do this by using the optional `sheet` parameter in a `sequenceData` table. For details, see [Sequence&nbsp;Data](#sequencedata)&nbsp;below.

## Syntax

	display.newSprite( [parent,] imageSheet, sequenceData )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the sprite.

##### imageSheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ Specifies the default image sheet.

##### sequenceData ~^(required)^~
_[Table][api.type.Table]._ A table which holds data for a specific sequence. Or, if you have more than one animation sequence for a single object, `sequenceData` is then an array of tables that hold data for each sequence. For instance, you might have a character object with several different animation sequences such as `"walking"`, `"jumping"`, and `"swimming"`. Frames in a given sequence may be consecutive (`1,2,3,4,...`) or non-consecutive (`1,3,4,6,9,...`) within the image sheet. See [Sequence&nbsp;Data](#sequencedata) below.

<a id="sequencedata"></a>

## Sequence Data

This is a table which holds data for one of more sequences. Sequences may be shared between multiple sprite objects.

##### name ~^(required)^~
_[String][api.type.String]._ The unique sequence name, used to load the sequence when it's time to play it.

##### start ~^(optional)^~
_[Number][api.type.Number]._ For consecutive-frame sequences, `start` represents the starting frame.

##### count ~^(optional)^~
_[Number][api.type.Number]._ For consecutive-frame sequences, `count` represents how many frames from the start that the sequence should end.

##### frames ~^(optional)^~
_[Array][api.type.Array]._ For non-consecutive-frame sequences, this is an array that holds the frameIndex in the exact order animation should be played.

##### sheet ~^(optional)^~
_[ImageSheet][api.type.ImageSheet]._ You can specify a per-sequence image sheet. Typically you would do this if you wanted to use a different image sheet. If none is provided, it defaults to the image sheet you provided to `display.newSprite()`. A single sprite can also pull frames/sequences from different image sheets &mdash; see the [Multiple&nbsp;Image&nbsp;Sheets](#multiple) example below.

##### time ~^(optional)^~
_[Number][api.type.Number]._ This is the time (in milliseconds) for the entire sequence to animate. If not specified, then the <nobr>per-frame</nobr> animation rate will be based on the frame rate of your app.

##### loopCount ~^(optional)^~
_[Number][api.type.Number]._ This is a number that represents how many times you want the sequence to loop when it is played. Setting this to `1` will play the sequence once and then stop. The default is `0`, which will loop the sequence indefinitely.

##### loopDirection ~^(optional)^~ 
_[String][api.type.String]._ This can either be `"forward"` or `"bounce"`, with `"forward"` being the default. The `"bounce"` option will play forward then backwards through the sequence of frames.


## Examples

##### Single Sequence (Consecutive Frames)

`````lua
-- Example assumes 'imageSheet' is already created from graphics.newImageSheet()

-- consecutive frames
local sequenceData =
{
    name="walking",
    start=3,
    count=6,
    time=100,
    loopCount = 0,   -- Optional ; default is 0 (loop indefinitely)
    loopDirection = "bounce"    -- Optional ; values include "forward" or "bounce"
}

local character = display.newSprite( imageSheet, sequenceData )
``````

##### Single Sequence (Non-Consecutive Frames)

`````lua
-- Example assumes 'imageSheet' is already created using graphics.newImageSheet()

-- non-consecutive frames
local sequenceData =
{
    name="walking",
    frames= { 3, 4, 5, 6, 7, 8 }, -- frame indexes of animation, in image sheet
    time = 240,
    loopCount = 0        -- Optional ; default is 0
}

local character = display.newSprite( imageSheet, sequenceData )
``````

##### Multiple Sequences

`````lua
-- Example assumes 'imageSheet' already created using graphics.newImageSheet()

local sequenceData =
{
    { name="walking", start=1, count=3 },
    { name="running", frames={ 3, 4, 5, 6, 7, 8 }, time=120, loopCount=4 },
    { name="jumping", start=9, count=13, time=300 }
}

local character = display.newSprite( imageSheet, sequenceData )
``````

<a id="multiple"></a>

##### Multiple Image Sheets

``````lua
-- 1st image sheet
local sheetData1 = { width=64, height=64, numFrames=6, sheetContentWidth=384, sheetContentHeight=64 }
local sheet1 = graphics.newImageSheet( "mySheet1.png", sheetData1 )

-- 2nd image sheet
local sheetData2 = { width=64, height=64, numFrames=6, sheetContentWidth=384, sheetContentHeight=64 }
local sheet2 = graphics.newImageSheet( "mySheet2.png", sheetData2 )

-- In your sequences, add the parameter 'sheet=', referencing which image sheet the sequence should use
local sequenceData = {
                { name="seq1", sheet=sheet1, start=1, count=6, time=220, loopCount=0 },
                { name="seq2", sheet=sheet2, start=1, count=6, time=220, loopCount=0 }
                }

local myAnimation = display.newSprite( sheet1, sequenceData )
myAnimation.x = display.contentWidth/2 ; myAnimation.y = display.contentHeight/2
myAnimation:play()

-- After a short time, swap the sequence to 'seq2' which uses the second image sheet
local function swapSheet()
        myAnimation:setSequence( "seq2" )
        myAnimation:play()
end
timer.performWithDelay( 2000, swapSheet )
``````

