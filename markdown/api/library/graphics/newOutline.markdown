
# graphics.newOutline()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [graphics.*][api.library.graphics]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          outline, physics, body, graphics
> __See also__          [Physics Bodies][guide.physics.physicsBodies] _(guide)_
>						[Image Sheets][guide.media.imageSheets] _(guide)_
>						[physics.addBody()][api.library.physics.addBody]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function produces the outline of the shape obtained from an image file or a frame within an [ImageSheet][api.type.ImageSheet]. A shape is recognized by the image's <nobr>non-transparent</nobr> alpha value. Generally, simpler images produce better outlines.

The returned value is a table of __x__ and __y__ coordinates in content space that can be used as the outline for the [physics.addBody()][api.library.physics.addBody] function

## Syntax

### Image File

	graphics.newOutline( coarsenessInTexels, imageFileName [, baseDir] )

##### coarsenessInTexels ~^(required)^~
_[Number][api.type.Number]._ The coarseness in texels. Higher values produce lower resolution outlines. Lower values produce larger outlines that can hurt performance.

##### imageFile ~^(required)^~
_[String][api.type.String]._ The file name of the image to trace.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Path to load the image from. Default is `system.ResourceDirectory` (project folder; same location as `main.lua`). See [system.pathForFile()][api.library.system.pathForFile] for valid values).

### Image Sheet Frame

	graphics.newOutline( coarsenessInTexels, imageSheet, frameIndex )

##### coarsenessInTexels ~^(required)^~
_[Number][api.type.Number]._ The coarseness in texels. Higher values produce lower resolution outlines. Lower values produce larger outlines that can hurt performance.

##### imageSheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ Reference to an image sheet object created with [graphics.newImageSheet()][api.library.graphics.newImageSheet].

##### frameIndex ~^(required)^~
_[Number][api.type.Number]._ Represents the frame index number within the [ImageSheet][api.type.ImageSheet] to create the object from. This is only required if `imageSheet` is specified.


## Examples

##### Image File

`````lua
local imageFile = "star.png"

local imageOutline = graphics.newOutline( 2, imageFile )
local image = display.newImage( imageFile )

physics.addBody( image, { outline=imageOutline, bounce=0.5, friction=0.1 } )
`````

##### Image Sheet Frame

`````lua
local options =
{
    width = 64,
    height = 64,
    numFrames = 12,
    sheetContentWidth = 256,  -- width of original 1x size of entire sheet
    sheetContentHeight = 192  -- height of original 1x size of entire sheet
}
local letterSheet = graphics.newImageSheet( "first_12_letters_of_the_alphabet.png", options )

local frameIndex = 9

local letterOutline = graphics.newOutline( 2, letterSheet, frameIndex )

local letterImage = display.newImageRect( letterSheet, frameIndex, 64, 64 )

physics.addBody( letterImage, { outline=letterOutline, bounce=0.5, friction=0.1 } )
`````
