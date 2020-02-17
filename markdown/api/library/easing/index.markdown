# easing.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          easing, animation, transition, tween, interpolation
> __See also__          [Transitions][guide.media.transitionLib] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Easing functions provide a simple way of interpolating between two values to achieve varied animations. They are used in conjunction with the [transition][api.library.transition] library.


## Syntax

	transition.to( target, { transition=easing.outExpo } )

	transition.from( target, { transition=easing.inOutCirc } )


## Easing Functions


``````lua
easing.linear
``````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-linear]

</div>
<div class="newline"></div>




`````lua
easing.continuousLoop
`````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-continuous]

</div>
<div class="newline"></div>




`````lua
easing.inSine ; easing.outSine ; easing.inOutSine ; easing.outInSine
`````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-sine]

</div>
<div class="newline"></div>




`````lua
easing.inQuad ; easing.outQuad ; easing.inOutQuad ; easing.outInQuad
`````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-quad]

</div>
<div class="newline"></div>




`````lua
easing.inCubic ; easing.outCubic ; easing.inOutCubic ; easing.outInCubic
`````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-cubic]

</div>
<div class="newline"></div>




`````lua
easing.inQuart ; easing.outQuart ; easing.inOutQuart ; easing.outInQuart
`````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-quart]

</div>
<div class="newline"></div>




`````lua
easing.inQuint ; easing.outQuint ; easing.inOutQuint ; easing.outInQuint
`````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-quint]

</div>
<div class="newline"></div>




`````lua
easing.inExpo ; easing.outExpo ; easing.inOutExpo ; easing.outInExpo
`````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-expo]

</div>
<div class="newline"></div>




`````lua
easing.inCirc ; easing.outCirc ; easing.inOutCirc ; easing.outInCirc
`````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-circ]

</div>
<div class="newline"></div>




`````lua
easing.inBack ; easing.outBack ; easing.inOutBack ; easing.outInBack
`````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-back]

</div>
<div class="newline"></div>




`````lua
easing.inElastic ; easing.outElastic ; easing.inOutElastic ; easing.outInElastic
`````

<div style="margin-top: -15px; margin-bottom: 25px;">

![][images.simulator.easing-elastic]

</div>
<div class="newline"></div>




`````lua
easing.inBounce ; easing.outBounce ; easing.inOutBounce ; easing.outInBounce
`````

<div style="margin-top: -15px; margin-bottom: 20px;">

![][images.simulator.easing-bounce]

</div>


## Example

`````lua
local circle = display.newCircle( 100, 100, 40 )
circle:setFillColor( 0, 0, 1 )
transition.to( circle, { time=400, y=200, transition=easing.inExpo } )
``````
