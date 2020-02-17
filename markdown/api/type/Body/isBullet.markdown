# object.isBullet

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, isBullet
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A boolean for whether the body should be treated as a "bullet." Bullets are subject to continuous collision detection rather than periodic collision detection at world time steps. This is more computationally expensive but it can prevent <nobr>fast-moving</nobr> objects from passing through solid barriers. The default is `false`.


## Example

``````lua
local bullet = display.newCircle( 100, 100, 10 )
physics.addBody( bullet, "dynamic", { radius=10 } )
bullet.gravityScale = 0

-- Make the object a "bullet" type object
bullet.isBullet = true

bullet:setLinearVelocity( 800, 0 )
``````