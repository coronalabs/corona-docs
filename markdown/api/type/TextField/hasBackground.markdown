# object.hasBackground

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          text input, text box, native text
> __See also__          [native.newTextBox()][api.library.native.newTextBox]<br/>[native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Controls whether the text box has an opaque background or not. Default is `true` (opaque).

## Gotchas

This property is not supported in Win32 desktop apps or in the Corona Simulator for Windows.

## Example

``````lua
-- Draw red background
local rect = display.newRect( 0, 0, 320, 480 )
rect:setFillColor( 1, 0, 0 )

-- Text field with transparent background
local textField = native.newTextField( 30, 140, 260, 100 )
textField:setTextColor( 0.8, 0.8, 0.8 )
textField.hasBackground = false
textField.text = "Hello, world!"
``````
