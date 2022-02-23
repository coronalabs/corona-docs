# object:getSpeedScale()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, interpolation, getSpeedScale
> __See also__          [object:setSpeedScale()][plugin.animation.type.Tween.setSpeedScale]
>						[animation.setSpeedScale()][plugin.animation.setSpeedScale]
>						[Tween][plugin.animation.type.Tween]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `object:getSpeedScale()` method returns the speed scale of the [Tween][plugin.animation.type.Tween] as set via [object:setSpeedScale()][plugin.animation.type.Tween.setSpeedScale] or [animation.setSpeedScale()][plugin.animation.setSpeedScale].


## Syntax

	object:getSpeedScale()


## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Move the object
local newTween = animation.to( object1, { x=150, y=400 }, { time=5000 } )

-- Set the tween speed scale
newTween:setSpeedScale( 2.5 )

-- Get the speed scale
local currentSpeedScale = newTween:getSpeedScale()
print( currentSpeedScale )  --> 2.5
``````
