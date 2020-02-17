
# physics.setScale()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      None
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, scale, physical scale
> __See also__          [physics.start()][api.library.physics.start]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the internal pixels-per-meter ratio that is used in converting between on-screen Corona coordinates and simulated physics coordinates. This should be done only once, before any physical objects are instantiated.

Changing this value has no visual consequences — it simply affects the accuracy of the physical model. The Box2D engine is tuned for simulating medium-sized objects between 0.1m and 10m in size, so it works best when the objects in your game are mapped to physical properties that fall roughly within this range.

The default scaling value is `30`, which means that the optimal 0.1m to 10m range corresponds to visible objects between 3 and 300 pixels in size. For larger objects, you may wish to increase this value to `60` or more.

You may also want to increase this value if the objects you are simulating seem too sluggish or react too slowly. In this case, they are likely too big and heavy for your purposes — try raising the scale value and/or reduce their densities.


## Syntax

	physics.setScale( value )

##### value ~^(required)^~
_[Number][api.type.Number]._ Sets the scale value. The default scaling value is `30`, which means that the optimal 0.1m to 10m range corresponds to visible objects between 3 and 300 pixels in size.


## Example

`````lua
physics.setScale( 60 )
`````