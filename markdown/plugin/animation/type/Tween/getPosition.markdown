# object:getPosition()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, interpolation, getPosition
> __See also__          [object:setPosition()][plugin.animation.type.Tween.setPosition]
>						[animation.setPosition()][plugin.animation.setPosition]
>						[Tween][plugin.animation.type.Tween]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `object:getPosition()` method returns the position of the [Tween][plugin.animation.type.Tween] in milliseconds.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

This value may be greater than the duration of the tween, essentially indicating that it has completed. If necessary, the returned value can be constrained to a range between `0` and the tween's duration by passing `true` to the method call&nbsp;&mdash; see&nbsp;below for details.

</div>


## Syntax

	object:getPosition( [getClipped] )

##### getClipped ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the returned value will be between `0` and the tween's duration. Default is `false`.


## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Move the object
local newTween = animation.to( object1, { x=150, y=400 }, { time=5000 } )

-- Sometime later, pause the tween
newTween:pause()

-- Check the tween position
local currentPosition = newTween:getPosition()
print( currentPosition )
``````
