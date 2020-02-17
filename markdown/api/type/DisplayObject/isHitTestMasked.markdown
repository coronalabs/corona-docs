
# object.isHitTestMasked

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          image mask, masking, clipping, bit mask
> __See also__          [object.isHitTestable][api.type.DisplayObject.isHitTestable]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Limits touch events to the masked portion of the object. This property can be read or set.

By default this property is `true`, meaning touch events for the object only occur on the masked portion of the object. Setting this property to `false` generates touch events when a touch occurs on any portion of the object.

Currently, for an image mask created by [graphics.newMask()][api.library.graphics.newMask], the touch sensitive area corresponds to the image bounds, i.e. it is rectangular regardless of the image contents.

## Example

``````lua
-- Create and position image to be masked
local image = display.newImageRect( "image.png", 768, 1024 )
image:translate( display.contentCenterX, display.contentCenterY )
 
-- Create mask and apply to image
local mask = graphics.newMask( "circlemask.png" )
image:setMask( mask )
 
-- Touch events on the image will be masked to the mask bounds
-- (always rectangular for an image, regardless of the image contents)
image.isHitTestMasked = true
 
-- Transform mask
image.maskScaleX, image.maskScaleY = 2,2
``````
