# object.align

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextBox][api.type.TextBox]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Alignment of text displayed in the text box. May be set to one of the following strings: 

* `"left"`
* `"center"`
* `"right"`

## Example

``````lua
local inputBox = native.newTextBox( 160, 240, 280, 140 )
inputBox.align = "center"
``````