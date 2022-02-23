# object:setPosition()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, timeline, interpolation, setPosition
> __See also__          [object:getPosition()][plugin.animation.type.Timeline.getPosition]
>						[animation.setPosition()][plugin.animation.setPosition]
>						[Timeline][plugin.animation.type.Timeline]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Moves/sets the playback position of a [Timeline][plugin.animation.type.Timeline] created with [animation.newTimeline()][plugin.animation.newTimeline].


## Syntax

	object:setPosition( position )

##### position ~^(required)^~
_[Number][api.type.Number] or [String][api.type.String]._ The position (time&nbsp;or&nbsp;marker) to move/set the playback to, as follows:

* A [number][api.type.Number] indicating the time to move the playback to, in milliseconds.
* The [string][api.type.String] name of a time marker associated with the timeline.


## Examples

##### Time Position

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

-- Set the timeline position
newTimeline:setPosition( 2000 )

-- Set the timeline playing
newTimeline:resume()
``````

##### Marker Position

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Create a timeline object
local timelineParams = {
	tweens = {
		{ startTime=0, tween={ object1, { x=400 }, { time=4000, iterations=5 } } },
		{ startTime=1000, tween={ object1, { y=400 }, { time=4000, easing=easing.outQuad } } }
	},
	markers = {
		{ name="marker_start", time=0 },
		{ name="marker_2000", time=2000 },
		{ name="marker_3000", time=3000 }
	}
}
local newTimeline = animation.newTimeline( timelineParams )

-- Set the timeline position
newTimeline:setPosition( "marker_2000" )

-- Set the timeline playing
newTimeline:resume()
``````
