# fill.g

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Paint][api.type.Paint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          color channel, tint, green
> __See also__          [Paint][api.type.Paint]
>                       [object.fill][api.type.ShapeObject]
>						[fill.r][api.type.Paint.r]
>						[fill.b][api.type.Paint.b]
>						[fill.a][api.type.Paint.a]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The green channel value ranging from `0` to `1`.

Setting this property to a value less than `1` will tint (modulate) the green texture channel.

## Example

``````lua
object.fill.g = 0.5
``````