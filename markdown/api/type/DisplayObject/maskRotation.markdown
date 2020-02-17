
# object.maskRotation

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mask, rotation, image mask, masking, clipping, bit mask
> __See also__          [graphics.newMask()][api.library.graphics.newMask]
>								[object.rotation][api.type.DisplayObject.rotation]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieve or set the rotation of the display object's corresponding [mask][api.type.Mask] object, if one exists.

## Example

``````lua
-- Image to be masked
local image = display.newImageRect( "image.png", 768, 1024 )
 
-- Mask
local mask = graphics.newMask( "circlemask.png" )
image:setMask( mask )
image.maskRotation = 180
``````
