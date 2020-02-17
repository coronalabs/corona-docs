# object.align

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Alignment of text displayed in the input text field. May be set to one of the following strings: 

* `"left"`
* `"center"`
* `"right"`

## Example

``````lua
local nameField = native.newTextField( 50, 150, 220, 36 )
nameField.align = "center"
``````
