
# display.newImageRect()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          images, objects, display object, graphics
> __See also__          [display.newImage()][api.library.display.newImage]
>						[display.loadRemoteImage()][api.library.display.loadRemoteImage]
>						[Display Objects][guide.media.displayObjects] _(guide)_
>						[Image Sheets][guide.media.imageSheets] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays an image on the screen from a file. This image supports tinting via [object:setFillColor][api.type.ShapeObject.setFillColor]. The local origin is at the center of the image and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

The difference between this function and [display.newImage()][api.library.display.newImage] is that `display.newImageRect()` automatically substitutes <nobr>higher-resolution</nobr> assets on <nobr>higher-resolution</nobr> devices, making this function ideal for displaying images across devices of varying resolutions. The actual image chosen will depend on the current content scale determined by Corona. This is based on the ratio between the current screen and the base content dimensions defined in `config.lua`. Based on this, Corona uses the `imageSuffix` table (also&nbsp;defined in `config.lua`) which lists the suffixes for the same family of images, and this function finds the best match from the image choices available. At any time, the chosen suffix is accessible via the <nobr>read-only</nobr> property [display.imageSuffix][api.library.display.imageSuffix]. Please refer to the [Project Configuration][guide.basics.configSettings] guide for more information.

</div>
</div>

Essentially, `display.newImageRect()` should always be used to load images when content scaling is enabled, and this function can be used in two ways:

1. Use multiple image files designed for targeted devices and display the correct image based on the resolution/screen of each device.
2. Resize high-resolution images to fit the existing content width and height. Since this only uses one <nobr>high-resolution</nobr> image, it uses more texture memory than method 1, but handles the case of sizing an image that will be used on multiple device resolutions.


## Syntax

### Image File

	display.newImageRect( [parent,] filename, [baseDir,] width, height )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the image.

##### filename ~^(required)^~
_[String][api.type.String]._ The name of the image file to load, relative to `baseDir` (or `system.ResourceDirectory` by default).

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Specifies the base directory where `filename` is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.

##### width ~^(required)^~
_[Number][api.type.Number]._ The content width of the image, which is the width within the reference screen of the content. When using trimmed frames that have been packed into an [ImageSheet][api.type.ImageSheet] by programs like [TexturePacker](http://www.codeandweb.com/texturepacker/), specify the _trimmed_ width, not the width of the original uncropped frame.

##### height ~^(required)^~
_[Number][api.type.Number]._ The content height of the image, which is the height within the reference screen of the content. When using trimmed frames that have been packed into an [ImageSheet][api.type.ImageSheet] by programs like [TexturePacker](http://www.codeandweb.com/texturepacker/), specify the _trimmed_ height, not the height of the original uncropped frame.

### Image Sheet

	display.newImageRect( [parent,] imageSheet, frameIndex, width, height )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the image. By default, uses the current stage (as returned from [display.getCurrentStage()][api.library.display.getCurrentStage]) if no parent is specified.

##### imageSheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ Reference to an image sheet object created with [graphics.newImageSheet()][api.library.graphics.newImageSheet]. This is only required if you intend to create an object from an image sheet.

##### frameIndex ~^(required)^~
_[Number][api.type.Number]._ Represents the frame index number within the [ImageSheet][api.type.ImageSheet] to create the object from. This is only required if `imageSheet` is specified.

##### width ~^(required)^~
_[Number][api.type.Number]._ The content width of the image, which is the width within the reference screen of the content. When using trimmed frames that have been packed into an [ImageSheet][api.type.ImageSheet] by programs like [TexturePacker](http://www.codeandweb.com/texturepacker/), specify the _trimmed_ width, not the width of the original uncropped frame.

##### height ~^(required)^~
_[Number][api.type.Number]._ The content height of the image, which is the height within the reference screen of the content. When using trimmed frames that have been packed into an [ImageSheet][api.type.ImageSheet] by programs like [TexturePacker](http://www.codeandweb.com/texturepacker/), specify the _trimmed_ height, not the height of the original uncropped frame.


## Texture Sampling

By default, new image sheets will use a linear sampling filter, so that the image will look smooth when the actual rendered region is larger or smaller than the pixel dimensions of the loaded texture. 

You can change the default texture filter by calling [display.setDefault()][api.library.display.setDefault]. Once an image is loaded the first time, the same sampling filter will be applied for any subsequent loads of the same file. This is because textures are loaded once per file.


## Gotchas

* All loaded images are cached. To save texture memory, the image in the cache memory is used when it detects an image with the same file name is displayed. This means that loading the same image multiple times doesn't increase the amount of texture memory used on the device. A potential <nobr>side-effect</nobr> to the image caching is that the comparison is based on the file name and not the file content. This means if an image file is displayed and then deleted from the directory, any file loaded after that with the same file name will still display the previous cached image. To avoid this problem, use a different file name.


## Image Guidelines

* Corona supports PNG and JPG format.
* Images should not contain an embedded ICC profile.
* Be aware of the gamma and color differences between your development system (Mac and Windows machines) and the device. For best results, color calibrate the display used for creating the images.
* Avoid progressive JPG files since they will take much longer to load.


## Properties

_(Inherits properties from [ShapeObject][api.type.ShapeObject] and [display.newRect()][api.library.display.newRect])_


## Examples

##### Image File Usage

`````lua
local image = display.newImageRect( "image.png", 100, 100 )
image.x = display.contentCenterX
image.y = display.contentCenterY

-- Hide the object
image.isVisible = false

-- Remove it
image:removeSelf()
image = nil
`````

##### Image Sheet Usage

`````lua
-- Create the image sheet object
local options =
{
	-- The params below are required
	width = 70,
	height = 41,
	numFrames = 2,

	-- The params below are optional (used for dynamic image selection)
	sheetContentWidth = 70,  -- width of original 1x size of entire sheet
	sheetContentHeight = 82  -- height of original 1x size of entire sheet
}
local imageSheet = graphics.newImageSheet( "fishies.png", options )

-- Create new image from the above image sheet
local obj = display.newImageRect( imageSheet, 1, 70, 41 )
obj.x, obj.y = 100, 100
`````
