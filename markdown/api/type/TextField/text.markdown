# object.text

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> __See also__          [native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The contents of the native text input field.

## Example

``````lua
local field1 = native.newTextField( 50, 100, 100, 35 )
field1.align = "center"
field1:setTextColor( 1, 0.5, 0 )
field1.text = "Hello World!"
``````