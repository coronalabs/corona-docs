
# physics.setGravity()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, gravity
> __See also__          [physics.getGravity()][api.library.physics.getGravity]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the __x__ and __y__ components of the global gravity vector in units of m/s&sup2;. The default is `( 0, 9.8 )` to simulate standard Earth gravity, pointing downward on the __y__ axis.

Note that this function can be called at any time in the physics simulation, upon which all objects under the effect of gravity will respond to the new values.


## Syntax

	physics.setGravity( gx, gy )

##### gx, gy ~^(required)^~
_[Numbers][api.type.Number]._ Sets the global gravity vector in x/y direction, in units of m/s&sup2;. In other words, the "pull" of gravity in the x (horizontal) and y (vertical) directions.


## Example

`````lua
local physics = require( "physics" )
physics.start()

physics.setGravity( 0, 6 )

local crate = display.newRect( 100, 50, 40, 40 )
crate:setFillColor( 1 )
crate.x = 180
crate.y = -50
crate.rotation = 5
 
physics.addBody( crate, { density=3.0, friction=0.5, bounce=0.3 } )
`````
