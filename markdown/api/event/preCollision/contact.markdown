
# event.contact

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [PhysicsContact][api.type.PhysicsContact]
> __Event__             [preCollision][api.event.preCollision]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          preCollision, contact
> --------------------- ------------------------------------------------------------------------------------------

## Overview

During a pre-collision, there are multiple [contact][api.type.PhysicsContact] points that occur. You can manipulate these contact points to create certain effects like <nobr>one-sided</nobr> platforms.


## Gotchas

You should not hold onto the contact object. It is only valid in the scope of your collision listener.


## Properties

* `event.contact.isEnabled` &mdash; enables or disables the collision associated with the contact.
* `event.contact.isTouching` &mdash; indicates whether the two objects are touching <nobr>(read only)</nobr>.
* `event.contact.bounce` &mdash; specifies the bounce factor of the collision <nobr>(read or write)</nobr>.
* `event.contact.friction` &mdash; specifies the friction factor of the collision <nobr>(read or write)</nobr>.


## Example

``````lua
local platform = display.newRect( 0, 0, 280, 30 )
platform.x, platform.y = display.contentCenterX, display.contentCenterY+80
platform.collType = "passthru"
physics.addBody( platform, "static", { bounce=0.0, friction=0.3 } )

local function preCollisionEvent( self, event )

   local collideObject = event.other
   if ( collideObject.collType == "passthru" ) then
      event.contact.isEnabled = false  -- Disable this specific collision
   end
end

local ball = display.newCircle( 0, 0, 15 )
ball.x, ball.y = display.contentCenterX, display.contentCenterY-40
physics.addBody( ball, "dynamic", { bounce=0.0, radius=20 } )

ball.preCollision = preCollisionEvent
ball:addEventListener( "preCollision", ball )
``````