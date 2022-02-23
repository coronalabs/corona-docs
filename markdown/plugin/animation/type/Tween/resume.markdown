# object:resume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, interpolation, resume
> __See also__          [object:pause()][plugin.animation.type.Tween.pause]
>						[animation.pause()][plugin.animation.pause]
>						[animation.resume()][plugin.animation.resume]
>						[Tween][plugin.animation.type.Tween]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Resumes a paused [Tween][plugin.animation.type.Tween] object.


## Syntax

	object:resume()


## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Move the object
local newTween = animation.to( object1, { x=150, y=400 }, { time=5000 } )

-- After 2 seconds, pause the tween
timer.performWithDelay( 2000, function() newTween:pause(); end )

-- Sometime later, resume the tween
newTween:resume()
``````
