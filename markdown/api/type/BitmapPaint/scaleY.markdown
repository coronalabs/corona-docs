# fill.scaleY

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [BitmapPaint][api.type.BitmapPaint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [paint.scaleX][api.type.BitmapPaint.scaleX]
>								[BitmapPaint][api.type.BitmapPaint]
>								[ImageSheetPaint][api.type.ImageSheetPaint]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Defines the __y__ scale factor of the [BitmapPaint][api.type.BitmapPaint] image, for example, `1` equals 100%, `0.5` equals 50%, and `2` equals 200%.

## Gotchas

When scaling a bitmap fill to span a display object of a different size (compared to the fill image), you may need to include a transparent border of 2 pixels around the fill image to prevent the outermost pixels from bleeding. The aspect ratio of the filled image should be the same as the parent, or stretching will occur. See sample code below on how to maintain image aspect ratio.

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

-- Scale the fill on the Y axis
rect.fill.scaleY = 2
``````

Loads an image and maintain its aspect ratio
``````lua
-- Create a vector rectangle
local rect = display.newRoundedRect( 0, 0, 150, 50, 12 )

-- Set the fill (paint) to use the bitmap image
local paint = {
    type = "image",
    filename = "image1.png",
    baseDir = system.TemporaryDirectory,
}

-- Fill the rectangle
rect.fill = paint

-- Draw the temporary image to get the width and height. This will be removed later.
local image = display.newImage( "image1.png" , system.TemporaryDirectory )

-- Calculate the image ratio
local imageRatio = image.width / image.height
local rectRatio = rect.width / rect.height 

-- Apply the scale correctly 
if imageRatio ~= rectRatio then
    if imageRatio < rectRatio then
        -- Make height higher
        rect.fill.scaleY = rectRatio / imageRatio
    else
        -- Make width wider
        rect.fill.scaleX =  imageRatio / rectRatio
    end
end

-- Remove the image
display.remove(image)

                    
``````
