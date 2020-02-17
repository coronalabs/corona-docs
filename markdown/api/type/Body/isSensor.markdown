# object.isSensor

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, isSensor
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A sensor is a fixture that detects collisions but does not produce a physical response. Sensors do not generate contact points.

The `isSensor` property is a <nobr>set-only</nobr> boolean value that, if set to `true`, prevents any visible collisions from happening to the object, although `"began"` and `"ended"` collision events are still fired.

## Gotchas

### One-Sided Platforms

For one-sided platforms that a jumping character can pass through from below but should land upon from above, the `isSensor` property may not be sufficient to handle all cases. Instead, consider the [isEnabled][api.type.PhysicsContact.isEnabled] property of the [PhysicsContact][api.type.PhysicsContact] object.

### Fixtures

In Box2D, `isSensor` is a property for a specific fixture or, in Corona terms, a "body&nbsp;element" &mdash; it is not a property of the entire body. However, Corona does not currently expose access to individual body elements __after__ the body is created, so it's not possible to set properties on individual body elements following creation of the body. Consequently, setting <nobr>`isSensor = true`</nobr> on a body sets this behavior for the entire body. One implication of this pertains to complex physics bodies where some elements are sensors and some are not &mdash; in this case, the `isSensor` property will permanently override the individual body element settings.


## Example

``````lua
local laserBeam = display.newImage( "laserBeam.png" )
physics.addBody( laserBeam, "dynamic" )
laserBeam.gravityScale = 0

-- Make the object a "bullet" type object
laserBeam.isBullet = true

-- Make the object a sensor
laserBeam.isSensor = true

laserBeam:setLinearVelocity( 400, 0 )
``````