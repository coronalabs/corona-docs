# fill.rotation

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [BitmapPaint][api.type.BitmapPaint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [BitmapPaint][api.type.BitmapPaint]
>								[ImageSheetPaint][api.type.ImageSheetPaint]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Defines the rotation of the [BitmapPaint][api.type.BitmapPaint] image.

## Example

``````lua
-- Create a vector rectangle
local rect = display.newRect( 200, 200, 300, 300 )

-- Set the fill (paint) to use the bitmap image
local paint = {
    type = "image",
    filename = "texture1.png"
}

-- Fill the rectangle
rect.fill = paint

-- Rotate the fill
rect.fill.rotation = 45
``````
