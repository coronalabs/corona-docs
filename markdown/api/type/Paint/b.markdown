# fill.b

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Paint][api.type.Paint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          color channel, tint, blue
> __See also__          [Paint][api.type.Paint]
>                       [object.fill][api.type.ShapeObject]
>						[fill.r][api.type.Paint.r]
>						[fill.g][api.type.Paint.g]
>						[fill.a][api.type.Paint.a]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The blue channel value ranging from `0` to `1`.

Setting this property to a value less than `1` will tint (modulate) the blue texture channel.

## Example

``````lua
object.fill.b = 0.5
``````