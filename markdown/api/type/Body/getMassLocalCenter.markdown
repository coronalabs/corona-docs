# object:getMassLocalCenter()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, mass, local, center
> __See also__          [object:getMassWorldCenter()][api.type.Body.getMassWorldCenter]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A function that returns the __x__ and __y__ components for the body's local center of mass.

## Syntax

	object:getMassLocalCenter()


## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Get mass local center values
local x, y = myRect:getMassLocalCenter()
``````
