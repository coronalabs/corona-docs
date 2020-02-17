# object.contentBounds

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          content bounds
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A read-only table with properties `xMin`, `xMax`, `yMin`, `yMax` that represent the boundaries of a [display object][api.type.DisplayObject], in content coordinates.

## Example

``````lua
local rect = display.newRect( 100, 100, 50, 50 )
rect:setFillColor( 1, 0, 0 )

local bounds = rect.contentBounds 
print( "xMin: ".. bounds.xMin ) -- xMin: 75
print( "yMin: ".. bounds.yMin ) -- yMin: 75
print( "xMax: ".. bounds.xMax ) -- xMax: 125
print( "yMax: ".. bounds.yMax ) -- yMax: 125
``````