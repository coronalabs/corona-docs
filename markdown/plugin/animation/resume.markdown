# animation.resume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, timeline, interpolation, resume
> __See also__			[Animation &mdash; Tweens and Timelines][guide.media.animationLibrary] _(guide)_
>						[animation.pause()][plugin.animation.pause]
>						[Tween][plugin.animation.type.Tween]
>						[Timeline][plugin.animation.type.Timeline]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `animation.resume()` function resumes the following, depending on the passed parameter:

* All paused tweens/timelines, when called with no parameters.
* A specific paused tween, when called with a [Tween][plugin.animation.type.Tween] reference.
* All paused tweens on a specific display object, when called with a display object reference.
* All paused tweens/timelines with a specific tag, when called with a string parameter representing a tag.
* A paused timeline and everything contained within it, when called with a [Timeline][plugin.animation.type.Timeline] reference.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Calls to this method which target specific child tweens within a [Timeline][plugin.animation.type.Timeline] are ignored. Timeline tweens are controlled/owned by the parent timeline, so you should resume the timeline itself via this method or [object:resume()][plugin.animation.type.Timeline.resume].

</div>


## Syntax

	animation.resume()
	animation.resume( tweenObject )
	animation.resume( displayObject )
	animation.resume( tagName )
	animation.resume( timelineObject )

##### tweenObject ~^(optional)^~
_[Tween][plugin.animation.type.Tween]._ The specific paused [Tween][plugin.animation.type.Tween] to resume.

##### displayObject ~^(optional)^~
_[DisplayObject][api.type.DisplayObject]._ The display object upon which all paused tweens will be resumed.

##### tagName ~^(optional)^~
_[String][api.type.String]._ The tag name; all paused tweens with this tag will be resumed.

##### timelineObject ~^(optional)^~
_[Timeline][plugin.animation.type.Timeline]._ The specific paused [Timeline][plugin.animation.type.Timeline] to resume.


## Examples

##### All Tweens/Timelines

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=400 } )
local tween2 = animation.to( object2, { y=400 }, { time=200 } )

-- At some point, pause all tweens and timelines
animation.pause()

-- Sometime later, resume them
animation.resume()
``````

##### Specific Tween

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=400 } )
local tween2 = animation.to( object2, { y=400 }, { time=200 } )

-- At some point, pause a specific tween
animation.pause( tween1 )

-- Sometime later, resume it
animation.resume( tween1 )
``````

##### Display Object Tweens

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=2000 } )
local tween2 = animation.to( object1, { rotation=90 }, { time=1000, delay=1000 } )

-- At some point, pause all tweens on the object
animation.pause( object1 )

-- Sometime later, resume them
animation.resume( object1 )
``````

##### Tagged Tweens

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=400, tag="tweenTag" } )
local tween2 = animation.to( object2, { y=400 }, { time=200, tag="tweenTag" } )

-- At some point, pause all tweens with the tag "tweenTag"
animation.pause( "tweenTag" )

-- Sometime later, resume them
animation.resume( "tweenTag" )
``````
