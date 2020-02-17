# CompositePaint

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Paint][api.type.Paint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composite paint, multitexture
> __See also__          [object.fill][api.type.ShapeObject.fill]
>						[object.stroke][api.type.ShapeObject.stroke]
>                       [Filters, Generators, Composites][guide.graphics.effects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Composite paints contain multiple images, thus enabling multi-texturing.

## Syntax

``````
local paint = {
    type = "composite",
    paint1 = ,
    paint2 =
}
``````

##### type ~^(required)^~
_[String][api.type.String]._ String value of `"composite"`.

##### paint1 ~^(required)^~
_[Table][api.type.Table]._ A table that specifies a [BitmapPaint][api.type.BitmapPaint]. See __Limitations__ below.

##### paint2 ~^(required)^~
_[Table][api.type.Table]._ A table that specifies a [BitmapPaint][api.type.BitmapPaint]. See __Limitations__ below.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Specifies the base directory where filename is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.

## Limitations

Because of the way multi-texturing works, both `paint1` and `paint2` will be rendered using the same texture coordinates. Because [GradientPaints][api.type.GradientPaint] and [ImageSheetPaints][api.type.ImageSheetPaint] use different texture coordinates from plain [BitmapPaints][api.type.BitmapPaint], you will get unexpected results unless you use plain [BitmapPaints][api.type.BitmapPaint] for `paint1` and `paint2`. 

## Properties

_(Inherits properties from [Paint][api.type.Paint])_

## Example

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
