# object:getInertia()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, getInertia
> __See also__          [physics.addBody()][api.library.physics.addBody]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns the rotational inertia of the physics body about its center of mass.

## Syntax

	object:getInertia()

## Example

`````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body
physics.addBody( myRect, "dynamic" )

-- Get the rotational inertia
local inertia = myRect:getInertia()
if inertia then
    print( "Rotational inertia: " .. inertia )
else
    print( "Object does not have a physics body" )
end
`````
