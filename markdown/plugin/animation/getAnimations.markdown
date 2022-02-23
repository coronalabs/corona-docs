# animation.getAnimations()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, timeline, interpolation, getAnimations
> __See also__			[Animation &mdash; Tweens and Timelines][guide.media.animationLibrary] _(guide)_
>						[Tween][plugin.animation.type.Tween]
>						[Timeline][plugin.animation.type.Timeline]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function must be called with a display object reference or tag name. Returns a table containing child [arrays][api.type.Array] `tweens` and `timelines`, each of which contains [Tween][plugin.animation.type.Tween] and/or [Timeline][plugin.animation.type.Timeline] references respectively.

When called with a display object reference, these arrays will indicate all tweens/timelines currently in effect for the display object.

When called with a tag name, these arrays will indicate all tweens/timelines which share that same tag name.


## Syntax

	animation.getAnimations( DisplayObjectOrTag )

##### DisplayObjectOrTag ~^(required)^~
_[DisplayObject][api.type.DisplayObject] or [String][api.type.String]._ The display object or tag name for which to fetch all [Tween][plugin.animation.type.Tween] and/or [Timeline][plugin.animation.type.Timeline] references.


## Examples

##### Display Object

``````lua
local object = display.newRect( 50, 50, 100, 100 )

-- Run three tweens on the object
local tween1 = animation.to( object, { x=300 }, { time=4000 } )
local tween2 = animation.to( object, { y=400 }, { time=2000 } )
local tween3 = animation.to( object, { alpha=0.5 }, { time=500, delay=3500 } )

-- Get the tween references
local interpolations = animation.getAnimations( object )
for i = 1,#interpolations.tweens do
	print( interpolations.tweens[i] )
end
``````

##### Tagged Interpolations

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )
local object2 = display.newRect( 50, 150, 100, 100 )

-- Run two tweens sharing the tag "tweenTag"
local tween1 = animation.to( object1, { y=300 }, { time=4000, tag="tweenTag" } )
local tween2 = animation.to( object2, { y=400 }, { time=2000, tag="tweenTag" } )

-- Get the tween references
local interpolations = animation.getAnimations( "tweenTag" )
for i = 1,#interpolations.tweens do
	print( interpolations.tweens[i] )
end
``````
