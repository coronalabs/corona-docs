# animation.from()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Tween][plugin.animation.type.Tween]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, timeline, interpolation, from
> __See also__			[Animation &mdash; Tweens and Timelines][guide.media.animationLibrary] _(guide)_
>						[animation.to()][plugin.animation.to]
>						[Tween][plugin.animation.type.Tween]
>						[Timeline][plugin.animation.type.Timeline]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Similar to [animation.to()][plugin.animation.to] except that the starting property values are specified in the `properties` table and the final values are the corresponding property values of the object prior to the call.

## Syntax

	animation.from( target, properties, params )

##### target ~^(required)^~
_[DisplayObject][api.type.DisplayObject] or [Userdata][api.type.Userdata]._ The display object, [RectPath][api.type.RectPath] point, [Paint][api.type.Paint] fill, or [fill.effect][api.type.Paint.effect] to tween.

##### properties ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the properties of the object that will be interpolated&nbsp;&mdash; see [animation.to()][plugin.animation.to#syntax] for a list of common options.

##### params ~^(required)^~
_[Table][api.type.Table]._ A table which specifies control parameters for the tween &mdash; see [animation.to()][plugin.animation.to#params] for parameter references.


## Example

##### Basic Movement

``````lua
local square = display.newRect( 0, 0, 100, 100 )

local w, h = display.contentWidth, display.contentHeight

local function tweenListener( obj )
	print( "Tween completed; ID: " .. obj.id )
end

-- Move square from bottom right corner to upper left corner
animation.from( square, { x=(w-50), y=(h-50) }, { time=1500, id="tween1", onComplete=tweenListener } )
``````
