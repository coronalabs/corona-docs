# object:setTextColor()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextBox][api.type.TextBox]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setTextColor, color, text
> __See also__          [native.newTextBox()][api.library.native.newTextBox]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the color of the text in a native text input box.

## Syntax

	object:setTextColor( r, g, b )
	object:setTextColor( r, g, b, a )

##### r, g, b ~^(required)^~
_[Number][api.type.Number]._ A value between `0` and `1` for red, green, and blue channels.

##### a ~^(optional)^~
_[Number][api.type.Number]._ A value between `0` and `1` for the alpha channel. Default is `1`. This can not be changed on Windows.

## Gotchas

If you are passing a table of color values to this function, the table must be [unpacked][api.library.global.unpack] so that the color values are dictated properly:

``````lua
local textBox = native.newTextBox( 160, 240, 280, 140 )

local colorTable = { 1, 0, 0, 0.5 }
textBox:setTextColor( unpack(colorTable) )
``````

## Example

``````lua
local textBox = native.newTextBox( 160, 240, 280, 140 )
textBox.font = native.newFont( "Helvetica-Bold", 18 )
textBox:setTextColor( 0.8, 0.8, 0.8 )
textBox.alpha = 1.0
textBox.hasBackground = false
textBox.text = "Hello World!"
``````
