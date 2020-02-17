
# object.anchorSegments

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [LineObject][api.type.LineObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          line, segments, anchor
> __See also__          [display.newLine()][api.library.display.newLine]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This boolean property controls whether [LineObjects][api.type.LineObject] take [anchorX][api.type.DisplayObject.anchorX] and [anchorY][api.type.DisplayObject.anchorY] into account. This value is `false` by default.

## Example

``````lua
local star = display.newLine( 200,90, 227,165, 305,165, 243,216, 265,290, 200,245, 135,290, 157,215, 95,165, 173,165, 200,90 )

star.x = display.contentWidth * 0.5
star.y = display.contentHeight * 0.5

star.anchorSegments = true
star.anchorX = 0.75
star.anchorY = 0.25
``````