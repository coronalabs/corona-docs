# object.stroke

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Paint][api.type.Paint]
> __Object__            [ShapeObject][api.type.ShapeObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          stroke
> __See also__          [fill][api.type.ShapeObject.fill]
>						[Filters/Generators/Composites][guide.graphics.effects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

For object strokes, Corona uses the concept of [paint][api.type.Paint]. The stroke of a shape refers to the boundary of the shape. When you assign a [paint][api.type.Paint] to a stroke, you control how the boundary is rendered.

Strokes are painted centrally (equally inside and outside) the object's boundary.

## Paint Types

* [Paint][api.type.Paint] &mdash; solid color fills/strokes.
* [BitmapPaint][api.type.BitmapPaint] &mdash; used to fill/stroke an object with an image.
* [CompositePaint][api.type.CompositePaint] &mdash; used for multi-texture fills/strokes.
* [GradientPaint][api.type.GradientPaint] &mdash; used for linear gradient fills/strokes.
* [ImageSheetPaint][api.type.ImageSheetPaint] &mdash; used to fill/stroke an object with an [image sheet][api.library.graphics.newImageSheet] frame.

## Examples

##### Solid Color Stroke

``````lua
local paint = { 1, 0, 0.5 }
local rect = display.newRect( 200, 300, 300, 300 )
rect.stroke = paint
rect.strokeWidth = 4
``````

##### Bitmap Image Stroke

``````lua
local paint = {
	type = "image",
	filename = "texture1.png"
}

local rect = display.newRect( 200, 200, 300, 300 )
rect.stroke = paint
rect.strokeWidth = 4
``````

##### Composite Stroke

``````lua
local paint = {
	type = "composite",
	paint1 = { type="image", filename="wood.png" },
	paint2 = { type="image", filename="dust.png" }
}

local rect = display.newRect( 200, 200, 300, 300 )
rect.stroke = paint
rect.strokeWidth = 4
rect.stroke.effect = "composite.average"
``````

##### Gradient Stroke

``````lua
local paint = {
    type = "gradient",
    color1 = { 1, 0, 0.4 },
    color2 = { 1, 0, 0, 0.2 },
    direction = "down"
}

local rect = display.newRect( 200, 200, 300, 300 )
rect.stroke = paint
rect.strokeWidth = 4
``````

##### Image Sheet Frame Stroke

``````lua
local options =
{
    width = 40,
    height = 100,
    numFrames = 8,
    sheetContentWidth = 160,  -- width of original 1x size of entire sheet
    sheetContentHeight = 200  -- height of original 1x size of entire sheet
}
local imageSheet = graphics.newImageSheet( "textures.png", options )

local paint = {
    type = "image",
    sheet = imageSheet,
    frame = 2
}

local rect = display.newRect( 200, 200, 300, 300 )
rect.stroke = paint
rect.strokeWidth = 4
``````
