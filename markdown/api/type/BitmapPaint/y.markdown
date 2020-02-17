# fill.y

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [BitmapPaint][api.type.BitmapPaint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [BitmapPaint][api.type.BitmapPaint]
>								[fill.x][api.type.BitmapPaint.x]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This value is used to offset a repeating bitmap fill by a ratio of its height.

Instead of using a specific pixel value for this property, a value between `-1` and `1` is required. This tells the GPU to offset the pattern by a full repetition in the vertical direction. So, using `0.5` will shift the pattern half of one repetition distance on the __y__ axis.

An important distinction is that setting a positive value will shift the pattern in an upward direction, while a negative value will shift the object downward.

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

-- Offset the fill on the Y axis
rect.fill.y = 1
``````