# animation.cancel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, timeline, interpolation, cancel
> __See also__			[Animation &mdash; Tweens and Timelines][guide.media.animationLibrary] _(guide)_
>						[Tween][plugin.animation.type.Tween]
>						[Timeline][plugin.animation.type.Timeline]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `animation.cancel()` function will cancel the following, depending on the passed parameter:

* All tweens/timelines in progress, when called with no parameters.
* A specific tween, when called with a [Tween][plugin.animation.type.Tween] reference.
* All tweens on a specific display object, when called with a display object reference.
* All tweens/timelines with a specific tag, when called with a string parameter representing a tag.
* A timeline and everything contained within it, when called with a [Timeline][plugin.animation.type.Timeline] reference.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Calls to this method which target specific child tweens within a [Timeline][plugin.animation.type.Timeline] are ignored. Timeline tweens are controlled/owned by the parent timeline, so you should cancel the timeline itself via this method or [object:cancel()][plugin.animation.type.Timeline.cancel].

</div>


## Syntax

	animation.cancel()
	animation.cancel( tweenObject )
	animation.cancel( displayObject )
	animation.cancel( tagName )
	animation.cancel( timelineObject )

##### tweenObject ~^(optional)^~
_[Tween][plugin.animation.type.Tween]._ The specific [Tween][plugin.animation.type.Tween] to cancel.

##### displayObject ~^(optional)^~
_[DisplayObject][api.type.DisplayObject]._ The display object upon which all associated tweens will be cancelled.

##### tagName ~^(optional)^~
_[String][api.type.String]._ The tag name; all tweens with this tag will be cancelled.

##### timelineObject ~^(optional)^~
_[Timeline][plugin.animation.type.Timeline]._ The specific [Timeline][plugin.animation.type.Timeline] to cancel.


## Examples

##### All Tweens/Timelines

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=400 } )
local tween2 = animation.to( object2, { y=400 }, { time=200 } )

-- Sometime later, cancel all tweens and timelines
animation.cancel()
``````

##### Specific Tween

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=400 } )
local tween2 = animation.to( object2, { y=400 }, { time=200 } )

-- Sometime later, cancel a specific tween
animation.cancel( tween1 )
``````

##### Display Object Tweens

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=2000 } )
local tween2 = animation.to( object1, { rotation=90 }, { time=1000, delay=1000 } )

-- Sometime later, cancel all tweens on the object
animation.cancel( object1 )
``````

##### Tagged Tweens

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=400, tag="tweenTag" } )
local tween2 = animation.to( object2, { y=400 }, { time=200, tag="tweenTag" } )

-- Sometime later, cancel all tweens with the tag "tweenTag"
animation.cancel( "tweenTag" )
``````
