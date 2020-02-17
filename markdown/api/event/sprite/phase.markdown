
# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [sprite][api.event.sprite]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sprite, phase
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string indicating the phase which the [SpriteObject][api.type.SpriteObject] animation is currently in.

* `"began"` &mdash; The animation began playing.
* `"ended"` &mdash; The animation showed its final frame.
* `"bounce"` &mdash; The animation bounced from forward to backward while playing.
* `"loop"` &mdash; The animation looped from the beginning of the sequence.
* `"next"` &mdash; The animation played a subsequent frame that's __not__ one of the above phases.

In a theoretical example of a sprite animation of 4 frames, here are the possible <nobr>phase-frame</nobr> scenarios:

``````lua
-- Loop twice
"began"   1
"next"    2
"next"    3
"next"    4
"loop"    1
"next"    2
"next"    3
"ended"   4

-- Loop indefinitely, no bounce (like above but no "ended" phase occurs)
"began"   1
"next"    2
"next"    3
"next"    4
"loop"    1
"next"    2
"next"    3
"next"    4
--etc.

-- Loop indefinitely, with bounce
"began"   1
"next"    2
"next"    3
"bounce"  4
"next"    3
"next"    2
"loop"    1
"next"    2
"next"    3
--etc.

-- Loop twice, with bounce
"began"   1
"next"    2
"next"    3
"bounce"  4
"next"    3
"next"    2
"loop"    1
"next"    2
"next"    3
"bounce"  4
"next"    3
"next"    2
"ended"   1
``````


## Example
 
``````lua
-- Assumes "imageSheet" is already created via "graphics.newImageSheet()"

local sequenceData =
{
	name = "walking",
	start  =3,
	count = 6,
	time = 100,
	loopCount = 0,            -- Optional; default is 0 (loop indefinitely)
	loopDirection = "bounce"  -- Optional; values include "forward" or "bounce"
}

local character = display.newSprite( imageSheet, sequenceData )

local function spriteListener( event )
    print( event.name, event.target, event.phase, event.target.sequence )
end

-- Add sprite listener
character:addEventListener( "sprite", spriteListener )
``````
