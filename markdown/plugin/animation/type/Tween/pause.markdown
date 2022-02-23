# object:pause()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, interpolation, pause
> __See also__          [object:resume()][plugin.animation.type.Tween.resume]
>						[animation.resume()][plugin.animation.resume]
>						[animation.pause()][plugin.animation.pause]
>						[Tween][plugin.animation.type.Tween]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pauses a [Tween][plugin.animation.type.Tween] object.


## Syntax

	object:pause()


## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Move the object
local newTween = animation.to( object1, { x=150, y=400 }, { time=5000 } )

-- Sometime later, pause the tween
newTween:pause()
``````
