# object:setPosition()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, interpolation, setPosition
> __See also__          [object:getPosition()][plugin.animation.type.Tween.getPosition]
>						[animation.setPosition()][plugin.animation.setPosition]
>						[Tween][plugin.animation.type.Tween]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Moves/sets the playback position of a [Tween][plugin.animation.type.Tween] object.


## Syntax

	object:setPosition( position )

##### position ~^(required)^~
_[Number][api.type.Number]._ The position (time) to move/set the playback to, in milliseconds.


## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Move the object
local newTween = animation.to( object1, { x=150, y=400 }, { time=5000 } )

-- Set the tween position
newTween:setPosition( 2000 )
``````
