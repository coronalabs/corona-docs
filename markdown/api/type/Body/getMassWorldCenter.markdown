# object:getMassWorldCenter()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, mass, world, center
> __See also__          [object:getMassLocalCenter()][api.type.Body.getMassLocalCenter]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A function that returns the __x__ and __y__ components for the body's center of mass in content coordinates.

## Syntax

	object:getMassWorldCenter()


## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Get mass world center values
local x, y = myRect:getMassWorldCenter()
``````
