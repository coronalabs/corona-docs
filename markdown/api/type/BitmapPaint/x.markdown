# fill.x

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [BitmapPaint][api.type.BitmapPaint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [BitmapPaint][api.type.BitmapPaint]
>								[fill.y][api.type.BitmapPaint.y]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This value is used to offset a repeating bitmap fill by a ratio of its width.

Instead of using a specific pixel value for this property, a value between `-1` and `1` is required. This tells the GPU to offset the pattern by a full repetition in the horizontal direction. So, using `0.5` will shift the pattern half of one repetition distance on the __x__ axis.

An important distinction is that setting a positive value will shift the pattern to the left, while a negative value will shift the object to the right.

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

-- Offset the fill on the X axis
rect.fill.x = 1
``````