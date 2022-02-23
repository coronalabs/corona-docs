# object:setSpeedScale()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, timeline, interpolation, setSpeedScale
> __See also__          [object:getSpeedScale()][plugin.animation.type.Timeline.getSpeedScale]
>						[animation.setSpeedScale()][plugin.animation.setSpeedScale]
>						[Timeline][plugin.animation.type.Timeline]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets the playback speed scale of a [Timeline][plugin.animation.type.Timeline] created with [animation.newTimeline()][plugin.animation.newTimeline].

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Changing the speed scale does __not__ affect any delay set for starting the timeline playback. In other words, only the actual playing portion of the timeline will be modified by this method.

</div>


## Syntax

	object:setSpeedScale( scale )

##### scale ~^(required)^~
_[Number][api.type.Number]._ The relative speed scale. This must be a positive number greater than `0`. By default, the speed scale is `1` (normal&nbsp;speed). Values greater than `1` will increase the speed while values lower than `1` will decrease it.

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
``````
