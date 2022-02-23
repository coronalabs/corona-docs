# object:getDuration()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, interpolation, getDuration
> __See also__          [Tween][plugin.animation.type.Tween]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `object:getDuration()` method returns the duration of the [Tween][plugin.animation.type.Tween] in milliseconds.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* This value will be affected by the tween's [speed scale][plugin.animation.type.Tween.setSpeedScale].

* In the instance of an endless tween (infinite&nbsp;iterations), this value will be `nil` because there is effectively no <nobr>pre-determined</nobr> duration.

</div>


## Syntax

	object:getDuration()


## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Move the object
local newTween = animation.to( object1, { x=150, y=400 }, { time=5000, delay=1000 } )

-- Get the animation's playing duration
local duration = newTween:getDuration()
print( duration )  --> 5000
``````
