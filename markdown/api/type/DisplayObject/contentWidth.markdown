# object.contentWidth

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          content width
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The read-only width of the object in content coordinates. This is similar to [object.width][api.type.DisplayObject.width] except that its value is affected by __x__ scaling and rotation.

## Example

``````lua
local rect = display.newRect( 100, 100, 50, 50 )
rect.rotation = 25
rect:setFillColor( 1, 0, 0 )

print( "contentWidth: ".. rect.contentWidth )
``````