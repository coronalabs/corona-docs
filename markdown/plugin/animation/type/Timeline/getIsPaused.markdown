# object:getIsPaused()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, timeline, interpolation, getIsPaused
> __See also__          [object:pause()][plugin.animation.type.Timeline.pause]
>						[Timeline][plugin.animation.type.Timeline]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a boolean `true` if the [Timeline][plugin.animation.type.Timeline] is paused, otherwise `false`.


## Syntax

	object:getIsPaused()


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

-- Check if timeline is paused
local isPaused = newTimeline:getIsPaused()
print( isPaused )  --> true
``````
