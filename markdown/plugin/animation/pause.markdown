# animation.pause()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, timeline, interpolation, pause
> __See also__			[Animation &mdash; Tweens and Timelines][guide.media.animationLibrary] _(guide)_
>						[animation.resume()][plugin.animation.resume]
>						[Tween][plugin.animation.type.Tween]
>						[Timeline][plugin.animation.type.Timeline]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The `animation.pause()` function pauses the following, depending on the passed parameter:

* All tweens/timelines in progress when called with no parameters.
* A specific tween when called with a [Tween][plugin.animation.type.Tween] reference.
* All tweens on a specific display object when called with the display object reference.
* All tweens/timelines with a specific tag when called with a [string][api.type.String] parameter representing a tag.
* A timeline and everything contained within it when called with a [Timeline][plugin.animation.type.Timeline] reference.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Calls to this method which target specific child tweens within a [Timeline][plugin.animation.type.Timeline] are ignored. Timeline tweens are controlled/owned by the parent timeline, so you should pause the timeline itself via this method or [object:pause()][plugin.animation.type.Timeline.pause].

</div>


## Syntax

	animation.pause()
	animation.pause( tweenObject )
	animation.pause( displayObject )
	animation.pause( tagName )
	animation.pause( timelineObject )

##### tweenObject ~^(optional)^~
_[Tween][plugin.animation.type.Tween]._ The specific [Tween][plugin.animation.type.Tween] to pause.

##### displayObject ~^(optional)^~
_[DisplayObject][api.type.DisplayObject]._ The display object upon which all associated tweens will be paused.

##### tagName ~^(optional)^~
_[String][api.type.String]._ The tag name; all tweens/timelines with this tag will be paused.

##### timelineObject ~^(optional)^~
_[Timeline][plugin.animation.type.Timeline]._ The specific [Timeline][plugin.animation.type.Timeline] to pause.


## Examples

##### All Tweens/Timelines

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=400 } )
local tween2 = animation.to( object2, { y=400 }, { time=200 } )

-- Sometime later, pause all tweens and timelines
animation.pause()
``````

##### Specific Tween

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=400 } )
local tween2 = animation.to( object2, { y=400 }, { time=200 } )

-- Sometime later, pause a specific tween
animation.pause( tween1 )
``````

##### Display Object Tweens

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=2000 } )
local tween2 = animation.to( object1, { rotation=90 }, { time=1000, delay=1000 } )

-- Sometime later, pause all tweens on the object
animation.pause( object1 )
``````

##### Tagged Tweens

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=400, tag="tweenTag" } )
local tween2 = animation.to( object2, { y=400 }, { time=200, tag="tweenTag" } )

-- Sometime later, pause all tweens with the tag "tweenTag"
animation.pause( "tweenTag" )
``````

##### Timeline

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
animation.pause( newTimeline )
``````
