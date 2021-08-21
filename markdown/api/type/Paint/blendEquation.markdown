# fill.blendEquation

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [Paint][api.type.Paint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          blend equation
> __See also__          [Paint][api.type.Paint]
>						[object.fill][api.type.ShapeObject]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The blend equation per the [OpenGL-ES 2 specification](https://www.khronos.org/registry/OpenGL-Refpages/es2.0/xhtml/glBlendEquation.xml). 

Blend equation values can be:

* `"add"` (default)
* `"subtract"`
* `"reverseSubtract"`

## Example

``````lua
object.fill.blendEquation = "subtract"
``````