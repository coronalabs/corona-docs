# object:setMask()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setMask, image mask, masking, clipping, bit mask
> __See also__          [Masking Images][guide.media.imageMask] _(guide)_
>						[graphics.newMask()][api.library.graphics.newMask]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Associates a mask with a display object. To remove an object's mask, use `object:setMask( nil )`. You can modify a display object's mask __x__ and __y__ position ([object.maskX][api.type.DisplayObject.maskX], [object.maskY][api.type.DisplayObject.maskY]), __x-scale__ and __y-scale__ factors ([object.maskScaleX][api.type.DisplayObject.maskScaleX], [object.maskScaleY][api.type.DisplayObject.maskScaleY]), and rotation ([object.maskRotation][api.type.DisplayObject.maskRotation]).

For a walkthrough on how to use image masks, see the [Masking Images][guide.media.imageMask] guide.


## Gotchas

* There is a nested masking limit of 3, so care must be taken when inserting masked objects into other masked objects which act as containers, including [display.newContainer][api.library.display.newContainer], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], or a masked [display&nbsp;group][api.type.GroupObject]. Other display objects that utilize masks include [display.newText][api.library.display.newText], [display.newEmbossedText][api.library.display.newEmbossedText], and any other [masked][api.type.Mask] display object. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.

* Masks can be applied to [display groups][guide.start.displayGroups] as well as individual display objects. Just remember that the group's origin is at `0,0` (top&nbsp;left). The group mask will be centered over the group but you need to translate the group to center the group on the screen. See the example below.


## Syntax

	object:setMask( mask )

##### mask ~^(required)^~
_[Mask][api.type.Mask]._ The mask object created with [graphics.newMask()][api.library.graphics.newMask]. Set to `nil` to remove the object's current mask.

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
 
local mask = graphics.newMask("circlemask.png")
g:setMask(mask)
`````
