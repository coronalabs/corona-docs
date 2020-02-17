
# object.isHitTestable

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          hit test, touchable, touches
> __See also__          [object.isHitTestMasked][api.type.DisplayObject.isHitTestMasked]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Allows an object to continue to receive hit events even if it is not visible. If `true`, objects will receive hit events regardless of visibility; if `false`, events are only sent to visible objects. Defaults to `false`.

## Gotchas

This property only comes into play if the object is not visible.

## Example

``````lua
local circle = display.newCircle( 100, 100, 50 )
circle:setFillColor( 1, 0, 0 )
circle.isVisible = false
circle.isHitTestable = true
``````