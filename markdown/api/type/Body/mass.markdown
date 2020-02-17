# object.mass

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, mass
> __See also__				[object:resetMassData()][api.type.Body.resetMassData]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A read-only value representing the body's mass.


## Example

``````lua
local bullet = display.newCircle( 100, 100, 10 )
physics.addBody( bullet, "dynamic", { radius=10 } )

print( bullet.mass )
``````