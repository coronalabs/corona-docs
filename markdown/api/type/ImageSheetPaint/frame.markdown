# fill.frame

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [ImageSheetPaint][api.type.ImageSheetPaint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [BitmapPaint][api.type.BitmapPaint]
>						[ImageSheetPaint][api.type.ImageSheetPaint]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Defines the [image sheet][api.type.ImageSheet] frame index used for the [ImageSheetPaint][api.type.ImageSheetPaint].


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

-- Initially set the fill (paint) to use frame #1 from the image sheet
local paint = {
    type = "image",
    sheet = imageSheet,
    frame = 1
}

-- Fill the rectangle
rect.fill = paint

-- Sometime later, change the fill to frame #2 from the image sheet
rect.fill.frame = 2
``````