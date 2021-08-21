#  Masking Images

This guide discusses how to use [graphics.newMask()][api.library.graphics.newMask] to mask individual display objects or entire display&nbsp;groups.

<div class="guides-toc">

* [Overview](#overview)
* [Creating Mask Images](#create)
* [Applying Masks](#apply)
* [Mask Manipulation](#manipulate)
* [Group Masking](#groupmask)
* [Hit Masking](#hitmasking)
* [Dynamic Mask Selection](#dynamic)
* [Removing Masks](#remove)

</div>


<a id="overview"></a>

## Overview

Masking is a common practice in digital design. Using a black and white (or&nbsp;grayscale) image mask, you can show/hide portions of a [display&nbsp;object][guide.media.displayObjects] or [display&nbsp;group][guide.graphics.group] according to the mask composition. For example, you may create a mask image with white portions and black portions. When applied to a target object/group, the black portions of the mask will render the underlying pixels fully transparent (this is represented by the gray checkerboard in the following examples). In contrast, pixels behind the white portion of the mask image will remain fully visible.

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

----------------------------------------------	------------------	----------------------------------------------	------------------	----------------------------------------------
![][images.simulator.image-mask-base1]			   &nbsp;+&nbsp;	![][images.simulator.image-mask-mask1]			  &nbsp;=&nbsp;		![][images.simulator.image-mask-result1]
----------------------------------------------	------------------	----------------------------------------------	------------------	----------------------------------------------

</div>

Mask images can also be created with gray regions or gradients. In this case, a region of 80% gray will render pixels in the underlying object/group at 20% opacity. Similarly, a region of 10% gray will render the underlying pixels at 90% opacity.

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

----------------------------------------------	------------------	----------------------------------------------	------------------	----------------------------------------------
![][images.simulator.image-mask-base1]			   &nbsp;+&nbsp;	![][images.simulator.image-mask-mask2]			  &nbsp;=&nbsp;		![][images.simulator.image-mask-result2]
----------------------------------------------	------------------	----------------------------------------------	------------------	----------------------------------------------

</div>




<a id="create"></a>

## Creating Mask Images

Mask image files can be created using any standard image editing program like [Photoshop](https://www.adobe.com/products/photoshop.html)&reg;, [GIMP](https://www.gimp.org/downloads/), or [Paint.NET](https://www.getpaint.net/download.html). When creating the image, you __must__ obey the following rules to ensure that masks behave properly.

<div class="guide-notebox-imp">
<div class="notebox-title-imp title-nomargin">Mask Image Requirements</div>

* The mask image must have width and height dimensions that are __divisible&nbsp;by&nbsp;4__.

* The mask image must be bordered by at least __3&nbsp;pixels__ of black space on all four sides. You may need to increase the overall size of your mask image to include this border.

* If the mask image is smaller than the target image, the region outside of the mask bounds will be fully masked (transparent).

</div>




<a id="apply"></a>

## Applying Masks

With the mask file properly prepared and saved, the next step is to create an actual mask using the [graphics.newMask()][api.library.graphics.newMask] API. Just supply the name of the mask image file to the function as follows:

``````lua
local mask = graphics.newMask( "maskframe.png" )
``````

Next, apply the mask to an object of your choice using the `setMask()` function:

``````lua
local mountains = display.newImageRect( "mountains.png", 280, 216 )
mountains.x, mountains.y = 200,160

mountains:setMask( mask )
``````

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

----------------------------------------------	------------------	----------------------------------------------
![][images.simulator.image-mask-base1]			&nbsp;&rarr;&nbsp;	![][images.simulator.image-mask-result1]
----------------------------------------------	------------------	----------------------------------------------

</div>

As illustrated, the area of the photo masked by black is invisible while the white area remains fully visible. The photo and mask can now be regarded as a single display object and, like any normal display object, it can be moved, rotated, inserted into a display group, etc.

Note that the width and height of the masked object remain the same as the unmasked version, even though the example photo appears smaller because of the mask. Solar2D respects the original dimensions in regards to size and positioning. However, touch/tap detection is ignored on completely masked (invisible) regions of an object unless you declare otherwise — see [Hit&nbsp;Masking](#hitmasking) below for more information.


<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Currently, mask images are not dynamically selected based on the device resolution, unlike images that are displayed using [display.newImageRect()][api.library.display.newImageRect]. Thus, if your masks are very detailed and you need to choose a mask image of the proper resolution for different devices, you should check [display.imageSuffix][api.library.display.imageSuffix] and use the appropriate mask image based on its value. See the example in [graphics.newMask()][api.library.graphics.newMask] for more details.

</div>




<a id="manipulate"></a>

## Mask Manipulation

Masks are always applied to an object's default anchor point at an angle of 0 with a scale ratio of 1:1. However, you can manipulate the mask after you've set it, in instances where you need to rotate/scale it or change its position relative to the image/group.

The following properties are available for mask manipulation:

<div class="inner-table">

Function													Description
-----------------------------------------------------------	-------------------------------------------------------
[object.maskX][api.type.DisplayObject.maskX]				Sets or retrieves the __x__ position of the mask.
[object.maskY][api.type.DisplayObject.maskY]				Sets or retrieves the __y__ position of the mask.
[object.maskRotation][api.type.DisplayObject.maskRotation]	Sets or retrieves the rotation angle of the mask.
[object.maskScaleX][api.type.DisplayObject.maskScaleX]		Sets or retrieves the __x__ scale factor of the mask.
[object.maskScaleY][api.type.DisplayObject.maskScaleY]		Sets or retrieves the __y__ scale factor of the mask.
-----------------------------------------------------------	-------------------------------------------------------

</div>

This example sets the mask, shifts its __x__ position 10&nbsp;pixels to the left, rotates it 20&nbsp;degrees, and scales it down to 80% its normal size:

``````lua
local mask = graphics.newMask( "maskframe.png" )

local mountains = display.newImageRect( "mountains.png", 280, 216 )
mountains.x, mountains.y = 200,160

mountains:setMask( mask )

mountains.maskX = -10
mountains.maskRotation = 20
mountains.maskScaleX = 0.8
mountains.maskScaleY = 0.8
``````

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

----------------------------------------------	------------------	----------------------------------------------
![][images.simulator.image-mask-result1]		&nbsp;&rarr;&nbsp;	![][images.simulator.image-mask-result3]
----------------------------------------------	------------------	----------------------------------------------

</div>




<a id="groupmask"></a>

## Group Masking

As indicated already, masks can be applied to [display&nbsp;groups][guide.graphics.group] as well as individual display objects.

``````lua
local group = display.newGroup()

local mask = graphics.newMask( "maskframe.png" )

group:setMask( mask )

group.maskX = group.x
group.maskY = group.y
``````




<a id="hitmasking"></a>

## Hit Masking

Masking can also be used to prevent touch/tap response over completely masked (invisible) regions of an object. This is not possible with a standard, unmasked display object surrounded by transparent pixels. In that case, the object will appear smaller than its canvas size, but the system will still recognize user input on the transparent region. Thus, when dealing with very precise touch/tap recognition, the solution is to mask the image, using 100% black to mask the areas which should __not__ return a touch or tap response.

In the normal, unmasked image below, the system will report input response over the entire canvas, including the transparent pixels represented by gray checkerboard. However, if you need to constrain user input to only the __visible__ portion (the&nbsp;icon&nbsp;itself), a&nbsp;mask is the best solution. In the masked example shown here, touch/tap response will be ignored outside of the visible region.

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

----------------------------------------------	------------------	----------------------------------------------
![][images.simulator.image-mask-base2]			&nbsp;+&nbsp;		![][images.simulator.image-mask-mask3]
----------------------------------------------	------------------	----------------------------------------------

</div>

If you need to override this behavior, but still require masking on the object, you can instruct the system to recognize user input on __all__ areas of the masked object by setting the `object.isHitTestMasked` property to `false`:

``````lua
object.isHitTestMasked = false
``````




<a id="dynamic"></a>

## Dynamic Mask Selection

Unlike images and image sheets, Solar2D does not automatically load different mask files based on the screen resolution. The standard behavior of masks is to scale along with the content area. This makes basic mask usage very simple: provide one mask image file and it will scale according to the object on which it's placed.

However, an accurate, sharp mask image is sometimes required and <nobr>auto-scaling</nobr> is not ideal in such cases. One solution is to retrieve the internal image suffix using [display.imageSuffix][api.library.display.imageSuffix] and append it to the file parameter when creating the mask. Please see the example in [graphics.newMask()][api.library.graphics.newMask] for details.




<a id="remove"></a>

## Removing Masks

To remove a mask from an object, simply call `object:setMask( nil )`. Remember to also `nil` the handle of the mask if it won't be used again.

``````lua
mountains:setMask( nil )
mask = nil
``````