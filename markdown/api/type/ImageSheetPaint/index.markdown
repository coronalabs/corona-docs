# ImageSheetPaint

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Paint][api.type.Paint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          imageSheetPaint
> __See also__          [object.fill][api.type.ShapeObject.fill]
>						[object.stroke][api.type.ShapeObject.stroke]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

An image sheet paint is a special kind of [BitmapPaint][api.type.BitmapPaint] used to fill/stroke an object with an [image&nbsp;sheet][api.library.graphics.newImageSheet] frame.

## Gotchas

It is not possible to use __texture&nbsp;wrap__ modes \([reference][api.library.display.setDefault]\) in conjunction with image sheet frames. This is because OpenGL only supports wrap modes on entire textures, not subsections of textures.

## Syntax

``````
local paint = {
    type = "image",
    sheet = ,
    frame =
}
``````

##### type ~^(required)^~
_[String][api.type.String]._ String value of `"image"`.

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ An image sheet object returned by [graphics.newImageSheet()][api.library.graphics.newImageSheet].

##### frame ~^(required)^~
_[Number][api.type.Number]._ The frame index from the image sheet.

## Properties

_(Inherits properties from [Paint][api.type.Paint])_

#### [fill.frame][api.type.ImageSheetPaint.frame]

#### [fill.rotation][api.type.BitmapPaint.rotation]

#### [fill.scaleX][api.type.BitmapPaint.scaleX]

#### [fill.scaleY][api.type.BitmapPaint.scaleY]

#### [fill.x][api.type.BitmapPaint.x]

#### [fill.y][api.type.BitmapPaint.y]

## Example

``````lua
-- Set up the image sheet
local options =
{
    width = 40,
    height = 100,
    numFrames = 8,
    sheetContentWidth = 160,  -- width of original 1x size of entire sheet
    sheetContentHeight = 200  -- height of original 1x size of entire sheet
}
local imageSheet = graphics.newImageSheet( "textures.png", options )

-- Create a vector rectangle
local rect = display.newRect( 200, 200, 300, 300 )

-- Set the fill (paint) to use frame #2 from the image sheet
local paint = {
    type = "image",
    sheet = imageSheet,
    frame = 2
}

-- Fill the rectangle
rect.fill = paint
``````