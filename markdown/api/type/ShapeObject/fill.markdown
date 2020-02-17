# object.fill

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Paint][api.type.Paint]
> __Object__            [ShapeObject][api.type.ShapeObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          fill
> __See also__          [stroke][api.type.ShapeObject.stroke]
>						[Filters/Generators/Composites][guide.graphics.effects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

For object fills, Corona uses the concept of [paint][api.type.Paint]. The fill of a shape refers to the interior area of the shape. When you assign a [paint][api.type.Paint] to a fill, you control how the interior area of the shape is rendered.


## Paint Types

* [Paint][api.type.Paint] &mdash; solid color fills/strokes.
* [BitmapPaint][api.type.BitmapPaint] &mdash; used to fill/stroke an object with an image.
* [CompositePaint][api.type.CompositePaint] &mdash; used for multi-texture fills/strokes.
* [GradientPaint][api.type.GradientPaint] &mdash; used for linear gradient fills/strokes.
* [ImageSheetPaint][api.type.ImageSheetPaint] &mdash; used to fill/stroke an object with an [image sheet][api.library.graphics.newImageSheet] frame.
* Camera Source &mdash; used to fill an object with the device camera source <nobr>(iOS-only).</nobr>


## Examples

##### Solid Color Fill

``````lua
local paint = { 1, 0, 0.5 }
local rect = display.newRect( 200, 300, 300, 300 )
rect.fill = paint
``````

##### Bitmap Image Fill

``````lua
local paint = {
    type = "image",
    filename = "texture1.png"
}

local rect = display.newRect( 200, 200, 300, 300 )
rect.fill = paint
``````

##### Composite Fill

``````lua
local paint = {
    type = "composite",
    paint1 = { type="image", filename="wood.png" },
    paint2 = { type="image", filename="dust.png" }
}

local rect = display.newRect( 200, 200, 300, 300 )
rect.fill = paint
rect.fill.effect = "composite.average"
``````

##### Gradient Fill

``````lua
local paint = {
    type = "gradient",
    color1 = { 1, 0, 0.4 },
    color2 = { 1, 0, 0, 0.2 },
    direction = "down"
}

local rect = display.newRect( 200, 200, 300, 300 )
rect.fill = paint
``````

##### Image Sheet Frame Fill

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
rect.fill = paint
``````

##### Camera Source Fill

``````lua
if ( system.getInfo("environment") ~= "simulator" ) then
	display.setDefault( "cameraSource", "front" )   --front-facing camera
	--display.setDefault( "cameraSource", "back" )  --back-facing camera
end

local rect = display.newRect( 200, 200, 300, 300 )
rect.fill = { type = "camera" }
``````
