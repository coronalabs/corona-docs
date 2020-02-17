
# event.contact

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [PhysicsContact][api.type.PhysicsContact]
> __Event__             [collision][api.event.collision]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          collision, contact
> --------------------- ------------------------------------------------------------------------------------------

## Overview

During a collision, there are multiple [contact][api.type.PhysicsContact] points that occur. You can manipulate these contact points to create certain effects.


## Gotchas

You should not hold onto the contact object. It is only valid in the scope of your collision listener.


## Properties

* `event.contact.isTouching` &mdash; indicates whether the two objects are touching <nobr>(read only)</nobr>.
* `event.contact.bounce` &mdash; specifies the bounce factor of the collision <nobr>(read or write)</nobr>.
* `event.contact.friction` &mdash; specifies the friction factor of the collision <nobr>(read or write)</nobr>.


## Example

``````lua
local platform = display.newRect( 0, 0, 280, 30 )
platform.surfaceType = "superbounce"
platform.x, platform.y = display.contentCenterX, display.contentCenterY+80
physics.addBody( platform, "static", { bounce=0.0, friction=0.3 } )

local ball = display.newCircle( 0, 0, 15 )
ball.x, ball.y = display.contentCenterX, display.contentCenterY-40
physics.addBody( ball, "dynamic", { bounce=0.0, radius=20 } )

local function onCollision( self, event )

   local collideObject = event.other
   if ( collideObject.surfaceType == "superbounce" ) then
      event.contact.bounce = 20  -- Magnify bounce for this specific collision
   end
end

ball.collision = onCollision
ball:addEventListener( "collision" )
``````