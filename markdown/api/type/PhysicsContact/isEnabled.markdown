# PhysicsContact.isEnabled

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [PhysicsContact][api.type.PhysicsContact]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics contact, isEnabled
> __See also__          [preCollision][api.event.preCollision]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Enable or disable the collision associated with this contact. This is typically used inside a [preCollision][api.event.preCollision] event listener and may be used to construct <nobr>one-sided</nobr> platforms that the character can jump vertically through, but only from below.


## Gotchas

The contact is only enabled/disabled for the current time step. Future contacts will be registered as usual.


## Example

``````lua
local platform = display.newRect( 0, 0, 280, 30 )
platform.x, platform.y = display.contentCenterX, display.contentCenterY+80
platform.collType = "passthru"
physics.addBody( platform, "static", { bounce=0.0, friction=0.3 } )

local ball = display.newCircle( 0, 0, 15 )
ball.x, ball.y = display.contentCenterX, display.contentCenterY-40
physics.addBody( ball, "dynamic", { bounce=0.0, radius=20 } )

local function preCollisionEvent( self, event )

   local collideObject = event.other
   if ( collideObject.collType == "passthru" ) then
      event.contact.isEnabled = false  --disable this specific collision
   end
end

ball.preCollision = preCollisionEvent
ball:addEventListener( "preCollision" )
``````