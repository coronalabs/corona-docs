# object:pause()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, timeline, interpolation, pause
> __See also__          [object:resume()][plugin.animation.type.Timeline.resume]
>						[animation.resume()][plugin.animation.resume]
>						[animation.pause()][plugin.animation.pause]
>						[Timeline][plugin.animation.type.Timeline]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pauses a [Timeline][plugin.animation.type.Timeline] created with [animation.newTimeline()][plugin.animation.newTimeline], including all child tweens within it.


## Syntax

	object:pause()


## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Create a timeline object
local timelineParams = {
	tweens = {
		{ startTime=0, tween={ object1, { x=400 }, { time=4000, iterations=5 } } },
		{ startTime=1000, tween={ object1, { y=400 }, { time=4000, easing=easing.outQuad } } }
	}
}
local newTimeline = animation.newTimeline( timelineParams )

-- Set the timeline playing
newTimeline:resume()

-- Sometime later, pause the timeline
newTimeline:pause()
``````
