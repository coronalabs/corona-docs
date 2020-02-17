
# object.isVisible

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          visibility, object visible, invisible
> __See also__          [object.alpha][api.type.DisplayObject.alpha]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Controls whether the object is visible on the screen. The property is also readable. The default is `true`.

## Example

``````lua
local rect1 = display.newRect( 100, 100, 50, 50 )
rect1:setFillColor( 0.7 )

local rect2 = display.newRect( 150, 100, 50, 50 )
rect2:setFillColor( 1, 0, 0, 0.6 )
rect2.isVisible = false
``````