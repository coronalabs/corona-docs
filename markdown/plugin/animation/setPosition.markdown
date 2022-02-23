# animation.setPosition()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, timeline, interpolation, setPosition
> __See also__			[Animation &mdash; Tweens and Timelines][guide.media.animationLibrary] _(guide)_
>						[Tween][plugin.animation.type.Tween]
>						[Timeline][plugin.animation.type.Timeline]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `animation.setPosition()` method will move/set the playback position, depending on the passed parameter:

* All tweens/timelines, unless called with one of the following references.
* A specific tween, when called with a [Tween][plugin.animation.type.Tween] reference.
* All tweens on a specific display object, when called with a display object reference.
* All tweens/timelines with a specific tag, when called with a string parameter representing a tag.
* A timeline, when called with a [Timeline][plugin.animation.type.Timeline] reference.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Calls to this method on specific child tweens within a [Timeline][plugin.animation.type.Timeline] are ignored. Timeline tweens are controlled/owned by the parent timeline, so you should set the position of the timeline itself via this method or [object:setPosition()][plugin.animation.type.Timeline.setPosition].

</div>


## Syntax

	animation.setPosition( position )
	animation.setPosition( tweenObject, position )
	animation.setPosition( displayObject, position )
	animation.setPosition( tagName, position )
	animation.setPosition( timelineObject, position )

##### position ~^(required)^~
_[Number][api.type.Number] or [String][api.type.String]._ The position (time&nbsp;or&nbsp;marker) to move/set the playback to, as follows:

* For either normal tweens or timelines, this can be a [number][api.type.Number] indicating the time to move the playback to, in milliseconds.
* For timelines specifically, this can be a [string][api.type.String] name of a time marker associated with the timeline.

##### tweenObject ~^(optional)^~
_[Tween][plugin.animation.type.Tween]._ The specific [Tween][plugin.animation.type.Tween] upon which to move/set the position.

##### displayObject ~^(optional)^~
_[DisplayObject][api.type.DisplayObject]._ The display object upon which to move/set all tween positions. If the specified position is outside the time range of any tween, that tween will be set to either its initial or final state.

##### tagName ~^(optional)^~
_[String][api.type.String]._ The tag name; all tweens/timelines with this tag will be affected.

##### timelineObject ~^(optional)^~
_[Timeline][plugin.animation.type.Timeline]._ The specific [Timeline][plugin.animation.type.Timeline] upon which to move/set the position.


## Examples

##### All Tweens/Timelines

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=4000 } )
local tween2 = animation.to( object2, { y=400 }, { time=2000 } )

-- Set the position of all tweens to 1 second in
animation.setPosition( 1000 )
``````

##### Specific Tween

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=4000 } )
local tween2 = animation.to( object2, { y=400 }, { time=2000 } )

-- Set the position of a specific tween
animation.setPosition( tween1, 1000 )
``````

##### Display Object Tweens

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=4000 } )
local tween2 = animation.to( object1, { rotation=90 }, { time=2000, delay=2000 } )

-- Set the position of all tweens on the object
animation.setPosition( object1, 3000 )
``````

##### Tagged Tweens

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=4000, tag="tweenTag" } )
local tween2 = animation.to( object2, { y=400 }, { time=2000, tag="tweenTag" } )

-- Set the position of all tweens with the tag "tweenTag"
animation.setPosition( "tweenTag", 1000 )
``````

##### Timeline Time Position

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

-- Sometime later, set the timeline position to a specific time
animation.setPosition( newTimeline, 2000 )
``````

##### Timeline Marker Position

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Create a timeline object
local timelineParams = {
	tweens = {
		{ startTime=0, tween={ object1, { x=400 }, { time=4000, iterations=5 } } },
		{ startTime=1000, tween={ object1, { y=400 }, { time=4000, easing=easing.outQuad } } }
	},
	markers = {
		{ name="marker_2000", time=2000 }
	}
}
local newTimeline = animation.newTimeline( timelineParams )

-- Set the timeline playing
newTimeline:resume()

-- Sometime later, set the timeline position to a specific time marker
animation.setPosition( newTimeline, "marker_2000" )
``````
