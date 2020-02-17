
# physics.removeBody()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, bodies, physics body
> __See also__          [physics.addBody()][api.library.physics.addBody]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Removes a physics body from a display object without destroying the entire object. This removes the body created with [physics.addBody()][api.library.physics.addBody].

This API only removes the physics body from the [DisplayObject][api.type.DisplayObject] — it does __not__ remove the display object itself.

This function returns `true` if the body was removed and `false` if the call failed. The API will fail if called in any collision event listener.


## Gotchas

This call cannot be used in a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision&nbsp;Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.


## Syntax

	physics.removeBody( object )

##### object ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ The object whose physics body should be removed.


## Example

`````lua
if not ( physics.removeBody( object ) ) then

	print( "Could not remove physics body" )

end
`````
