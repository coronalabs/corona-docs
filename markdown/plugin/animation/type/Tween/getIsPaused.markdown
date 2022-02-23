# object:getIsPaused()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, interpolation, getIsPaused
> __See also__          [object:pause()][plugin.animation.type.Tween.pause]
>						[Tween][plugin.animation.type.Tween]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a boolean `true` if the [Tween][plugin.animation.type.Tween] is paused, otherwise `false`.


## Syntax

	object:getIsPaused()


## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Move the object
local newTween = animation.to( object1, { x=150, y=400 }, { time=5000 } )

-- Sometime later, pause the tween
newTween:pause()

-- Check if tween is paused
local isPaused = newTween:getIsPaused()
print( isPaused )  --> true
``````
