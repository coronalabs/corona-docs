# object:getSpeedScale()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, timeline, interpolation, getSpeedScale
> __See also__          [object:setSpeedScale()][plugin.animation.type.Timeline.setSpeedScale]
>						[animation.setSpeedScale()][plugin.animation.setSpeedScale]
>						[Timeline][plugin.animation.type.Timeline]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `object:getSpeedScale()` method returns the speed scale of the [Timeline][plugin.animation.type.Timeline] as set via [object:setSpeedScale()][plugin.animation.type.Timeline.setSpeedScale] or [animation.setSpeedScale()][plugin.animation.setSpeedScale].


## Syntax

	object:getSpeedScale()


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

-- Set the timeline speed scale
newTimeline:setSpeedScale( 2.5 )

-- Set the timeline playing
newTimeline:resume()

-- Get the speed scale
local currentSpeedScale = newTimeline:getSpeedScale()
print( currentSpeedScale )  --> 2.5
``````
