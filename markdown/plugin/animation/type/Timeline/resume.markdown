# object:resume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, timeline, interpolation, resume
> __See also__          [object:pause()][plugin.animation.type.Timeline.pause]
>						[animation.pause()][plugin.animation.pause]
>						[animation.resume()][plugin.animation.resume]
>						[Timeline][plugin.animation.type.Timeline]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Resumes a paused [Timeline][plugin.animation.type.Timeline] created with [animation.newTimeline()][plugin.animation.newTimeline], including all child tweens within it.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

This method can also be used to start a new [Timeline][plugin.animation.type.Timeline] playing since timelines do not begin playing automatically upon creation.

</div>
</div>


## Syntax

	object:resume()


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

-- After 2 seconds, pause the timeline
timer.performWithDelay( 2000, function() newTimeline:pause(); end )

-- Sometime later, resume the timeline
newTimeline:resume()
``````
