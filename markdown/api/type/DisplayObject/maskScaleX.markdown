
# object.maskScaleX

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          image mask, masking, clipping, bit mask
> __See also__          [object.maskScaleY][api.type.DisplayObject.maskScaleY]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieve or set the __x__-scale factor for the display object's corresponding [mask][api.type.Mask] object, if any.

## Gotchas

Increasing this value above `1.0` will increase the masked object's content width \([object.contentWidth][api.type.DisplayObject.contentWidth]\).

## Example

``````lua
-- Image to be masked
local image = display.newImageRect( "image.png", 768, 1024 )
 
-- Mask
local mask = graphics.newMask( "circlemask.png" )
image:setMask( mask )
image.maskScaleX = 0.5
image.maskScaleY = 0.5
``````
