# object:getPosition()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, timeline, interpolation, getPosition
> __See also__          [object:setPosition()][plugin.animation.type.Timeline.setPosition]
>						[animation.setPosition()][plugin.animation.setPosition]
>						[Timeline][plugin.animation.type.Timeline]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `object:getPosition()` method returns the position of the [Timeline][plugin.animation.type.Timeline] in milliseconds.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This value may be greater than the duration of the timeline, essentially indicating that all child tweens have completed. If necessary, the returned value can be constrained to a range between `0` and the timeline's duration by passing `true` to the method call&nbsp;&mdash; see&nbsp;below for details.

</div>


## Syntax

	object:getPosition( [getClipped] )

##### getClipped ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the returned value will be between `0` and the timeline duration. Default is `false`.


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

-- Check the timeline position
local currentPosition = newTimeline:getPosition()
print( currentPosition )
``````
