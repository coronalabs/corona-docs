
# graphics.newImageSheet()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [graphics.*][api.library.Graphics]
> __Return value__      [ImageSheet][api.type.ImageSheet]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sprite sheet, texture atlas, texture memory, images
> __See also__          [Image Sheets][guide.media.imageSheets] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

[ImageSheet][api.type.ImageSheet] objects, sometimes referred to as sprite sheets or texture atlases, allow you to load multiple images from a single image file. Image sheets must be used for [animated sprites][api.library.display.newSprite] and they can also be used to preload many static images.

## Texture Sampling

By default, new image sheets will use a linear sampling filter, so that the image will look smooth when the actual rendered region is larger or smaller than the pixel dimensions of the loaded texture. 

You can change the default texture filter by calling [display.setDefault()][api.library.display.setDefault]. Once an image is loaded the first time, the same sampling filter will be applied for any subsequent loads of the same file. This is because textures are loaded once per file. 

## Gotchas

Image sheet packing tools such as [TexturePacker](http://www.codeandweb.com/texturepacker/) will output the `sourceX`, `sourceY`, `sourceWidth`, and `sourceHeight` parameters for __trimmed__ frames. When displaying these frames on the screen, the image will be positioned in respect to the __center__ point of the untrimmed frame size.

If you want to use dynamically-selected image sheets &mdash; chosen automatically depending on the screen resolution &mdash; you __must__ include the `sheetContentWidth` and `sheetContentHeight` parameters. See below for details.

On Android, images are limited (downsized) to 2048×2048, even though the maximum texture memory size is higher on the device. The reason is most Android devices don't have enough heap memory to load the image. We recommend that you don't load image files larger than 2048×2048.

## Syntax

	graphics.newImageSheet( filename, [baseDir, ] options )

##### filename ~^(required)^~
_[String][api.type.String]._ This is the filename of the image file that includes all frames of the image sheet. This file is also called a "sprite sheet" image.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Specifies the base directory where `filename` is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.

##### options ~^(required)^~
_[Table][api.type.Table]._ Table with keys that represent specific options related to the resulting image sheet &mdash; see the next section for details.


## Options Reference

Depending on the layout of the image sheet, the `options` table can be configured in two ways:

### Simple

This configuration assumes all frames in the image sheet texture share identical properties.

``````lua
local options =
{
    --required parameters
    width = 50,
    height = 50,
    numFrames = 3,
    
    --optional parameters; used for scaled content support
    sheetContentWidth = 150,  -- width of original 1x size of entire sheet
    sheetContentHeight = 50   -- height of original 1x size of entire sheet
}
``````

##### width ~^(required)^~
_[Number][api.type.Number]._ Width of all images (frames) in the image sheet texture.

##### height ~^(required)^~
_[Number][api.type.Number]._ Height of all images (frames) in the image sheet texture.

##### numFrames ~^(required)^~
_[Number][api.type.Number]._ Total number of images (frames) in the image sheet.

##### border ~^(optional)^~
_[Number][api.type.Number]._ The border around each frame, typically used for tiles whose edges are extruded to eliminate seam artifacts. Default is `0`. When greater than `0`, this overrides the trimming options for cropping the frame.

##### sheetContentWidth / sheetContentHeight ~^(optional)^~
These values tell Corona the size of the original 1x image sheet. For example, if you're developing for both iPad and iPad Retina, and you're using an image sheet of 1000×1000 for the regular iPad, you should specify `1000` for both of these values and then design your Retina image sheet at 2000×2000. For more information on this topic, see the [Project Configuration][guide.basics.configSettings] guide.

### Complex

This configuration is required if the image sheet has frames of varying sizes. In this case, `options` consists of an array of tables within a parent `frames` table, and each of these tables represents a single frame in the image sheet.

``````lua
local options =
{
    --array of tables representing each frame (required)
    frames =
    {
        -- Frame 1
        {
            --all parameters below are required for each frame
            x = 2,
            y = 70,
            width = 50,
            height = 50
        },
        
        -- Frame 2
        {
            x = 2,
            y = 242,
            width = 50,
            height = 52
        },
        
        -- Frame 3 and so on...
    },

    -- Optional parameters; used for scaled content support
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}
``````

##### x ~^(required)^~
_[Number][api.type.Number]._  The __x__ location of the frame in the texture.

##### y ~^(required)^~
_[Number][api.type.Number]._  The __y__ location of the frame in the texture.

##### width ~^(required)^~
_[Number][api.type.Number]._  Width of the frame; if cropping, specify cropped width here.

##### height ~^(required)^~
_[Number][api.type.Number]._  Height of the frame; if cropping, specify cropped height here.

##### sourceWidth ~^(optional)^~
_[Number][api.type.Number]._  Width of the original uncropped frame. Default is the same as `width`.

##### sourceHeight ~^(optional)^~
_[Number][api.type.Number]._  Height of the original uncropped frame. Default is the same as `height`.

##### sourceX ~^(optional)^~
_[Number][api.type.Number]._  The __x__ origin of the crop rect relative to the uncropped image. Default is `0`.

##### sourceY ~^(optional)^~
_[Number][api.type.Number]._  The __y__ origin of the crop rect relative to the uncropped image. Default is `0`.

##### border ~^(optional)^~
_[Number][api.type.Number]._ The amount of pixels around each individual frame. This is necessary for scaling image sheets without getting blending artifacts around the edges. Default is `0`.

##### sheetContentWidth / sheetContentHeight ~^(optional)^~
These values tell Corona the size of the original 1x image sheet. For example, if you're developing for both iPad and iPad Retina, and you're using an image sheet of 1000×1000 for the regular iPad, you should specify `1000` for both of these values and then design your Retina image sheet at 2000×2000. For more information on this topic, see the [Project Configuration][guide.basics.configSettings] guide.

## Examples

##### Simple

`````lua
local options =
{
    -- Required parameters
    width = 70,
    height = 41,
    numFrames = 2,

    -- Optional parameters; used for scaled content support
    sheetContentWidth = 70,  -- width of original 1x size of entire sheet
    sheetContentHeight = 82  -- height of original 1x size of entire sheet
}

local imageSheet = graphics.newImageSheet( "characterSheet.png", options )
`````

##### Complex

`````lua
local options =
{
    -- Array of tables representing each frame (required)
    frames =
    {
        -- Frame 1
        {
            x = 2,
            y = 70,
            width = 50,
            height = 50
        },
        
        -- Frame 2
        {
            x = 2,
            y = 242,
            width = 50,
            height = 52
        },
    },

    -- Optional parameters; used for scaled content support
    sheetContentWidth = 1024,
    sheetContentHeight = 1024
}

local imageSheet = graphics.newImageSheet( "characterSheet.png", options )
`````
