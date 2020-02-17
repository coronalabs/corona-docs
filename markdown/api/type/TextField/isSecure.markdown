# object.isSecure

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Controls whether text in the field is obscured. This is useful for passwords. Default is `false`.

## Example

``````lua
local passwordField = native.newTextField( 100, 50, 40, 30 )
passwordField.inputType = "number"
passwordField.isSecure = true
``````
