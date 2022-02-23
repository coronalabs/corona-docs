# animation.setSpeedScale()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, timeline, interpolation, setSpeedScale
> __See also__			[Animation &mdash; Tweens and Timelines][guide.media.animationLibrary] _(guide)_
>						[Tween][plugin.animation.type.Tween]
>						[Timeline][plugin.animation.type.Timeline]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `animation.setSpeedScale()` method will set the playback speed scale, depending on the passed parameter:

* All tweens/timelines, unless called with one of the following references.
* A specific tween, when called with a [Tween][plugin.animation.type.Tween] reference.
* All tweens on a specific display object, when called with a display object reference.
* All tweens/timelines with a specific tag, when called with a string parameter representing a tag.
* A timeline and everything contained within it, when called with a [Timeline][plugin.animation.type.Timeline] reference.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Calls to this method on specific child tweens within a [Timeline][plugin.animation.type.Timeline] are ignored. Timeline tweens are controlled/owned by the parent timeline, so you should set the speed scale of the timeline itself via this method or [object:setSpeedScale()][plugin.animation.type.Timeline.setSpeedScale].

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Changing the speed scale does __not__ affect any __delay__ set for starting the playback. In other words, only the actual playing portion of the affected object(s) will be modified by this call.

</div>


## Syntax

	animation.setSpeedScale( scale )
	animation.setSpeedScale( tweenObject, scale )
	animation.setSpeedScale( displayObject, scale )
	animation.setSpeedScale( tagName, scale )
	animation.setSpeedScale( timelineObject, scale )

##### scale ~^(required)^~
_[Number][api.type.Number]._ The relative speed scale. This must be a positive number greater than `0`. By default, the speed scale is `1` (normal&nbsp;speed). Values greater than `1` will increase the speed while values lower than `1` will decrease it.

##### tweenObject ~^(optional)^~
_[Tween][plugin.animation.type.Tween]._ The specific [Tween][plugin.animation.type.Tween] upon which to set the speed scale.

##### displayObject ~^(optional)^~
_[DisplayObject][api.type.DisplayObject]._ The display object upon which to set the speed scale of all tweens.

##### tagName ~^(optional)^~
_[String][api.type.String]._ The tag name; all tweens/timelines with this tag will be affected.

##### timelineObject ~^(optional)^~
_[Timeline][plugin.animation.type.Timeline]._ The specific [Timeline][plugin.animation.type.Timeline] upon which to set the speed scale.


## Examples

##### All Tweens/Timelines

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=4000 } )
local tween2 = animation.to( object2, { y=400 }, { time=2000 } )

-- Set the speed scale of all tweens and timelines
animation.setSpeedScale( 2.5 )
``````

##### Specific Tween

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=4000 } )
local tween2 = animation.to( object2, { y=400 }, { time=2000 } )

-- Set the speed scale of a specific tween
animation.setSpeedScale( tween1, 2.5 )
``````

##### Display Object Tweens

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=2000 } )
local tween2 = animation.to( object1, { rotation=90 }, { time=1000, delay=1000 } )

-- Set the speed scale of all tweens on the object
animation.setSpeedScale( object1, 2.5 )
``````

##### Tagged Tweens

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

local tween1 = animation.to( object1, { y=300 }, { time=4000, tag="tweenTag" } )
local tween2 = animation.to( object2, { y=400 }, { time=2000, tag="tweenTag" } )

-- Set the speed scale of all tweens with the tag "tweenTag"
animation.setSpeedScale( "tweenTag", 2.5 )
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

-- Set the speed scale of the timeline
animation.setSpeedScale( newTimeline, 2.5 )
``````
