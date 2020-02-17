
# display.newGroup()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [GroupObject][api.type.GroupObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          groups, objects, grouping
> __See also__          [Group Programming][guide.graphics.group] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a display group for organizing/layering display objects. Initially, there are no children in a group. The local origin is at the parent's origin; the anchor point is initialized to this local origin.

See the [Group Programming][guide.graphics.group] guide for more information.

## Gotchas

Using groups with the physics engine has some limitations &mdash; see the [Physics Notes/Limitations][guide.physics.limitations] guide.


## Syntax

	display.newGroup()


## Example

`````lua
-- Create a rectangle and a group, then insert the rectangle into the group
local rect = display.newRect( 0, 0, 100, 100 )
rect:setFillColor( 0.5 )

local group = display.newGroup()
group:insert( rect )
`````