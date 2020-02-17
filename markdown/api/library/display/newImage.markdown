
# display.newImage()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          images, objects, display object, graphics
> __See also__          [display.newImageRect()][api.library.display.newImageRect]
>						[display.loadRemoteImage()][api.library.display.loadRemoteImage]
>						[Display Objects][guide.media.displayObjects] _(guide)_
>						[Image Sheets][guide.media.imageSheets] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays an image on the screen from a file (supports tinting via [object:setFillColor][api.type.ShapeObject.setFillColor]). The local origin is at the center of the image and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.

Note that [display.newImageRect()][api.library.display.newImageRect] should be used instead to load images when content scaling is enabled.

Image objects are the same as [rectangle objects][api.library.display.newRect] in which the `object.fill` property is set to be an image.


## Syntax

### Image File

	display.newImage( [parent,] filename [, baseDir] [, x, y] )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the image object.

##### filename ~^(required)^~
_[String][api.type.String]._ The name of the image file to load, relative to `baseDir` (or `system.ResourceDirectory` by default).

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Specifies the base directory where `filename` is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.

##### x  ~^(optional)^~
_[Number][api.type.Number]._ The __x__ coordinate of the image.

##### y ~^(optional)^~
_[Number][api.type.Number]._ The __y__ coordinate of the image.

### Image Sheet

	display.newImage( [parent,] imageSheet, frameIndex [, x, y] )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the image object.

##### imageSheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ Reference to an image sheet object created with [graphics.newImageSheet()][api.library.graphics.newImageSheet]. This is only required if you intend to create an object from an image sheet.

##### frameIndex ~^(required)^~
_[Number][api.type.Number]._ Represents the frame index number within the [ImageSheet][api.type.ImageSheet] to create the object from. This is only required if `imageSheet` is specified.

##### x  ~^(optional)^~
_[Number][api.type.Number]._ The __x__ coordinate of the image.

##### y ~^(optional)^~
_[Number][api.type.Number]._ The __y__ coordinate of the image.


## Texture Sampling

By default, new image sheets will use a linear sampling filter, so that the image will look smooth when the actual rendered region is larger or smaller than the pixel dimensions of the loaded texture. 

You can change the default texture filter by calling [display.setDefault()][api.library.display.setDefault]. Once an image is loaded the first time, the same sampling filter will be applied for any subsequent loads of the same file. This is because textures are loaded once per file.


## Gotchas

* All loaded images are cached. To save texture memory, the image in the cache memory is used when it detects an image with the same file name is displayed. This means that loading the same image multiple times doesn't increase the amount of texture memory used on the device. A negative <nobr>side-effect</nobr> to the image caching is that the comparison is based on the file name and not the file content. This means if an image file is displayed and then deleted from the directory, any file loaded after that with the same file name will still display the previous cached image. To avoid this problem, use a different file name.

* There is a difference between Mac/iOS and Windows/Android when displaying images with `display.newImage()`. If the image to be loaded exceeds the resolution of the device, it will be autoscaled to fit on Mac and iOS. On Windows and Android, it will load full resolution (up to the maximum texture size of the device). This can cause apps to display differently between the platforms. If you know the image size before loading, use [display.newImageRect()][api.library.display.newImageRect] instead &mdash; this API also handles loading the proper image resolution based on the device's resolution.


## Image Guidelines

* Corona supports PNG and JPG format.
* Images should not contain an embedded ICC profile.
* Avoid progressive JPG files since they will take much longer to load.


## Properties

_(Inherits properties from [ShapeObject][api.type.ShapeObject] and [display.newRect()][api.library.display.newRect])_


## Example

##### Image File Usage

`````lua
local myImage = display.newImage( "image.png" )

-- Position the image
myImage:translate( 100, 100 )

-- Tint the image red
myImage:setFillColor( 1, 0, 0 )

-- Hide the image
myImage.isVisible = false

-- Remove the image
myImage:removeSelf()
myImage = nil
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

local myImage = display.newImage( imageSheet, 1 )
`````
