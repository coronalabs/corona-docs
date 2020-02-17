
# physics.stop()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, stop, stop physics
> __See also__          [physics.start()][api.library.physics.start]
>						[physics.pause()][api.library.physics.pause]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Stops the physics engine. This function will return `false` and display a warning message if the API cannot be processed.

## Gotchas

* This API is treated as a request to destroy the physics world, so if you merely want to pause the physics engine, you should use [physics.pause()][api.library.physics.pause] instead.

* This call cannot be used in a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision&nbsp;Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.

## Syntax

	physics.stop()

## Example

`````lua
local physics = require( "physics" )

-- Start the physics engine
physics.start()

-- Stop the physics simulation after 2 seconds
timer.performWithDelay( 2000, function()
	physics.stop()
end )
`````
