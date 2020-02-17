# object.text

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextBox][api.type.TextBox]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> __See also__          [native.newTextBox()][api.library.native.newTextBox]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The contents of the native text input box.

## Example

``````lua
local textBox = native.newTextBox( 160, 240, 280, 140 )
textBox.font = native.newFont( "Helvetica-Bold", 18 )
textBox:setTextColor( 0.8, 0.8, 0.8 )
textBox.alpha = 1.0
textBox.hasBackground = false
textBox.text = "Hello World!"
``````