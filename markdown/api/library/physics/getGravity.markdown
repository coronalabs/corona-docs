
# physics.getGravity()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, gravity
> __See also__          [physics.setGravity()][api.library.physics.setGravity]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the __x__ and __y__ components of the global gravity vector, in units of m/s&sup2;. This takes advantage of the fact that Lua functions can return multiple values, which in this case are:

* `gx` — The global gravity vector in the __x__ direction, in units of m/s&sup2;.
* `gy` — The global gravity vector in the __y__ direction, in units of m/s&sup2;.

## Syntax

	physics.getGravity()


## Example

`````lua
local gx, gy = physics.getGravity()
print( "x gravity: " .. gx .. ", y gravity: " .. gy )
`````