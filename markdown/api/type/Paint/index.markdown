# Paint

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Userdata][api.type.Userdata]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          paint, fill, stroke
> __See also__          [object.fill][api.type.ShapeObject.fill]
>						[object.stroke][api.type.ShapeObject.stroke]
>						[Filters/Generators/Composites][guide.graphics.effects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

For object [fills][api.type.ShapeObject.fill] and [strokes][api.type.ShapeObject.stroke], Corona uses the concept of __paint__. Once a paint is declared, it can be applied to objects via [object.fill][api.type.ShapeObject.fill] and [object.stroke][api.type.ShapeObject.stroke].

Solid fills and strokes are specified by an array of color channels. For other fill/stroke types, including images, composites, and gradients, please see:

* [BitmapPaint][api.type.BitmapPaint] &mdash; used to fill/stroke an object with an image.
* [CompositePaint][api.type.CompositePaint] &mdash; used for multi-texture fills/strokes.
* [GradientPaint][api.type.GradientPaint] &mdash; used for linear gradient fills/strokes.
* [ImageSheetPaint][api.type.ImageSheetPaint] &mdash; used to fill/stroke an object with an [image sheet][api.library.graphics.newImageSheet] frame.

## Syntax

``````
{ gray }
{ gray, alpha }
{ red, green, blue }
{ red, green, blue, alpha }
``````

##### gray, red, green, blue, alpha ~^(optional)^~
_[Numbers][api.type.Number]._ Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the object.


## Properties

#### [fill.r][api.type.Paint.r]

#### [fill.g][api.type.Paint.g]

#### [fill.b][api.type.Paint.b]

#### [fill.a][api.type.Paint.a]

#### [fill.blendEquation][api.type.Paint.blendEquation]

#### [fill.blendMode][api.type.Paint.blendMode]

#### [fill.effect][api.type.Paint.effect]


## Examples

##### 50% Gray Fill

``````lua
local paint = { 0.5 }
local rect = display.newRect( 200, 300, 300, 300 )
rect.fill = paint
``````

##### Solid Color Fill

``````lua
local paint = { 1, 0, 0.5 }
local rect = display.newRect( 200, 300, 300, 300 )
rect.fill = paint
``````