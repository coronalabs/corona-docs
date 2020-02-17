# BitmapPaint

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Paint][api.type.Paint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          bitmap paint
> __See also__          [object.fill][api.type.ShapeObject.fill]
>						[object.stroke][api.type.ShapeObject.stroke]
>						[Effects Guide][guide.graphics.effects]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A bitmap paint contains a single texture.

If desired, bitmap fills can be repeated (tiled) across the span of a display object. See the `textureWrapX` and `textureWrapY` properties in the __Texture&nbsp;Keys__ section of [display.setDefault()][api.library.display.setDefault] for more information.


## Syntax

``````
local paint = {
    type = "image",
    filename = ,
    baseDir = 
}
``````

##### type ~^(required)^~
_[String][api.type.String]._ String value of `"image"`.

##### filename ~^(required)^~
_[String][api.type.String]._ Filename of the image file.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Specifies the base directory where filename is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.

## Properties

_(Inherits properties from [Paint][api.type.Paint])_

#### [fill.rotation][api.type.BitmapPaint.rotation]

#### [fill.scaleX][api.type.BitmapPaint.scaleX]

#### [fill.scaleY][api.type.BitmapPaint.scaleY]

#### [fill.x][api.type.BitmapPaint.x]

#### [fill.y][api.type.BitmapPaint.y]


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
``````
