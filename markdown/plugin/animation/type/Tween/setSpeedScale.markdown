# object:setSpeedScale()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, interpolation, setSpeedScale
> __See also__          [object:getSpeedScale()][plugin.animation.type.Tween.getSpeedScale]
>						[animation.setSpeedScale()][plugin.animation.setSpeedScale]
>						[Tween][plugin.animation.type.Tween]
>						[animation.*][plugin.animation]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets the playback speed scale of a [Tween][plugin.animation.type.Tween] object.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Changing the speed scale does __not__ affect any __delay__ set for starting the playback. In other words, only the actual playing portion of the affected object(s) will be modified by this call.

</div>


## Syntax

	object:setSpeedScale( scale )

##### scale ~^(required)^~
_[Number][api.type.Number]._ The relative speed scale. This must be a positive number greater than `0`. By default, the speed scale is `1` (normal&nbsp;speed). Values greater than `1` will increase the speed while values lower than `1` will decrease it.

## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

-- Move the object
local newTween = animation.to( object1, { x=150, y=400 }, { time=5000 } )

-- Set the tween speed scale
newTween:setSpeedScale( 2.5 )
``````
