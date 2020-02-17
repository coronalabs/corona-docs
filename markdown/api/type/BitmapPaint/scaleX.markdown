# fill.scaleX

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [BitmapPaint][api.type.BitmapPaint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [paint.scaleY][api.type.BitmapPaint.scaleY]
>								[BitmapPaint][api.type.BitmapPaint]
>								[ImageSheetPaint][api.type.ImageSheetPaint]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Defines the __x__ scale factor of the [BitmapPaint][api.type.BitmapPaint] image, for example, `1` equals 100%, `0.5` equals 50%, and `2` equals 200%.

## Gotchas

When scaling a bitmap fill to span a display object of a different size (compared to the fill image), you may need to include a transparent border of 2 pixels around the fill image to prevent the outermost pixels from bleeding.

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

-- Scale the fill on the X axis
rect.fill.scaleX = 2
``````
