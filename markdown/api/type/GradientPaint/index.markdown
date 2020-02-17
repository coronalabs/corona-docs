# GradientPaint

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Paint][api.type.Paint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gradient paint
> __See also__          [object.fill][api.type.ShapeObject.fill]
>						[object.stroke][api.type.ShapeObject.stroke]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

A gradient paint creates a linear progression from one color to another.

## Syntax

``````
local paint = {
    type = "gradient",
    color1 = { r,g,b,a },
    color2 = { r,g,b,a },
    direction =
}
``````

##### type ~^(required)^~
_[String][api.type.String]._ String value of `"gradient"`.

##### color1 ~^(required)^~
_[Array][api.type.Array]._ An RGB+A array of color channels for the start color. Each number should range between `0` and `1` and represent the corresponding value for that channel.

##### color2 ~^(required)^~
_[Array][api.type.Array]._ An RGB+A array of color channels for the end color. Each number should range between `0` and `1` and represent the corresponding value for that channel.

##### direction ~^(optional)^~
_[String][api.type.String]._ The direction of the gradient from `color1` to `color2`. This can be `"down"`, `"up"`, `"left"`, or `"right"`. Default is `"down"`.

If _[number][api.type.Number]._ is passed as `direction` parameter, `"down"` would be used and [fill.rotation][api.type.BitmapPaint.rotation] would be applied its value.

## Properties

_(Inherits properties from [Paint][api.type.Paint])_

## Example


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
