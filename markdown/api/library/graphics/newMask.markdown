
# graphics.newMask()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [graphics.*][api.library.graphics]
> __Return value__      [Mask][api.type.Mask]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          image mask, masking, clipping, bit mask
> __See also__          [Masking Images][guide.media.imageMask] _(guide)_
>						[object:setMask()][api.type.DisplayObject.setMask]
>						[object.isHitTestMasked][api.type.DisplayObject.isHitTestMasked]
>						[object.maskScaleX][api.type.DisplayObject.maskScaleX]
>						[object.maskScaleY][api.type.DisplayObject.maskScaleY]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a bit mask from an image file. The image is converted internally to grayscale. The white pixels of the bit mask allow the covered image to be visible, while black pixels hide (mask) the covered image. The area outside of the mask must be filled with black pixels which mask off the area outside the mask image.

The function returns a [Mask][api.type.Mask] object that can be applied to any display object using [object:setMask()][api.type.DisplayObject.setMask].

For a walkthrough on how to use image masks, see the [Masking Images][guide.media.imageMask] guide.


## Image Mask Requirements

* The mask image must have width and height dimensions that are __divisible&nbsp;by&nbsp;4__.

* The mask image must be bordered by at least __3&nbsp;pixels__ of black space on all four sides. You may need to increase the overall size of your mask image to include this border.

* If the mask image is smaller than the target image, the region outside of the mask bounds will be fully masked (transparent).


## Gotchas

* There is a nested masking limit of 3, so care must be taken when inserting masked objects into other masked objects which act as containers, including [display.newContainer][api.library.display.newContainer], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], or a masked [display&nbsp;group][api.type.GroupObject]. Other display objects that utilize masks include [display.newText][api.library.display.newText], [display.newEmbossedText][api.library.display.newEmbossedText], and any other [masked][api.type.Mask] display object. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.

* Currently, mask images are not dynamically selected based on the device resolution, unlike images that are displayed using [display.newImageRect()][api.library.display.newImageRect]. Thus, if your masks are very detailed and you need to choose a mask image of the proper resolution for different devices, you should check [display.imageSuffix][api.library.display.imageSuffix] and use the appropriate mask image based on its value. See the example below for more details.


## Syntax

	graphics.newMask( filename [, baseDir] )

##### filename ~^(required)^~
_[String][api.type.String]._ The name of the image file to create the mask from.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Specifies the directory path that contains the mask image. Can be one of the following:

* `system.ResourceDirectory` (default)
* `system.DocumentsDirectory`
* `system.ApplicationSupportDirectory`
* `system.TemporaryDirectory`
* `system.CachesDirectory`


## Examples

##### Mask on Image

``````lua
-- Create and position image to be masked
local image = display.newImageRect( "image.png", 768, 1024 )
image:translate( display.contentCenterX, display.contentCenterY )
 
-- Create mask and apply to image
local mask = graphics.newMask( "circlemask.png" )
image:setMask( mask )
 
-- Transform mask
image.maskScaleX, image.maskScaleY = 2,2
``````

##### Mask on Display Group

`````lua
local g = display.newGroup()
-- Create and position image to be masked, and insert into group
local image = display.newImageRect( g, "image.png", 768, 1024 )

-- Center the Display Group
g:translate( display.contentCenterX, display.contentCenterY )
 
local mask = graphics.newMask( "circlemask.png" )
g:setMask( mask )
`````

##### Dynamically-Selected Mask

`````lua
-- This example shows how to select a different mask image based on the dynamic image suffix
-- It ensures that higher-resolution masks are used when the device resolution warrants it

-- Create and position image to be masked
local image = display.newImageRect( "image.png", 768, 1024 )
image:translate( display.contentCenterX, display.contentCenterY )

-- Create up-value reference for mask
local mask

-- Check the image suffix values and pick the correct mask
if ( display.imageSuffix == "@4x" ) then
	--print( "using @4x" )
	mask = graphics.newMask( "circlemask@4x.png" )
	image:setMask( mask )
	image.maskScaleX = 0.25
	image.maskScaleY = 0.25

elseif ( display.imageSuffix == "@2x" ) then
	--print( "using @2x" )
	mask = graphics.newMask( "circlemask@2x.png" )
	image:setMask( mask )
	image.maskScaleX = 0.5
	image.maskScaleY = 0.5

else
	--print( "using @1x" )
	mask = graphics.newMask( "circlemask.png" )
	image:setMask( mask )
end
`````
