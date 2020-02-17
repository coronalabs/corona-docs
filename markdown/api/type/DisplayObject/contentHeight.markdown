# object.contentHeight

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          content height
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The read-only height of the object in content coordinates. This is similar to [object.height][api.type.DisplayObject.height] except that its value is affected by __y__ scaling and rotation.

## Example

``````lua
local rect = display.newRect( 100, 100, 50, 50 )
rect.rotation = 25
rect:setFillColor( 1, 0, 0 )

print( "contentHeight: ".. rect.contentHeight )
``````