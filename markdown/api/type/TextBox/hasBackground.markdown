# object.hasBackground

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Object__            [TextBox][api.type.TextBox]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          text input, text box, native text
> __See also__          [native.newTextBox()][api.library.native.newTextBox]
>								[native.newTextField()][api.library.native.newTextField]
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

-- Text box with transparent background
local textBox = native.newTextBox( 160, 240, 280, 140 )
textBox.font = native.newFont( "Helvetica-Bold", 16 )
textBox:setTextColor( 0.8, 0.8, 0.8 )
textBox.hasBackground = false
textBox.text = "Hello, world!"
``````