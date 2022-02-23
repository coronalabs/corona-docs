# object:getDuration()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, timeline, interpolation, getDuration
> __See also__          [Timeline][plugin.animation.type.Timeline]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `object:getDuration()` method returns the duration of the [Timeline][plugin.animation.type.Timeline] in milliseconds.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* This value will be affected by the timeline's [speed scale][plugin.animation.type.Timeline.setSpeedScale].

* In the instance of an endless timeline (infinite&nbsp;iterations on a child&nbsp;tween), this value will be `nil` because there is effectively no <nobr>pre-determined</nobr> duration.

</div>


## Syntax

	object:getDuration()


## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Create a timeline object
local timelineParams = {
	tweens = {
		{ startTime=1000, tween={ object1, { x=400 }, { time=4000, iterations=5 } } },
		{ startTime=2000, tween={ object1, { y=400 }, { time=4000, easing=easing.outQuad } } }
	},
	delay = 1000
}
local newTimeline = animation.newTimeline( timelineParams )

-- Set the timeline playing
newTimeline:resume()

-- Get the timeline's playing duration
local duration = newTimeline:getDuration()
print( duration )  --> 21000
``````
