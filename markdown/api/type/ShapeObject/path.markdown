# object.path

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Path][api.type.Path]
> __Object__            [ShapeObject][api.type.ShapeObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          stroke, width, border
> __See also__          [Shapes — Paths, Fills, Strokes][guide.graphics.path] _(guide)_
>						[Path][api.type.Path]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Paths are a property of [shapes][api.type.ShapeObject] that let you control the geometry of the shape.

For the different types of paths, see [Path][api.type.Path].

## Example

``````lua
local rect = display.newRect( 135, 100, 50, 50 )
local path = rect.path
transition.to( path, { width=200 } )
``````
