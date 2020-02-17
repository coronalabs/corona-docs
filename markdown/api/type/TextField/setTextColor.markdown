# object:setTextColor()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setTextColor, color, text
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the color of the text in a native text input field.

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
local field1 = native.newTextField( 50, 100, 100, 35 )

local colorTable = { 1, 0, 0, 0.5 }
field1:setTextColor( unpack(colorTable) )
``````

## Example

``````lua
local field1 = native.newTextField( 50, 100, 100, 35 )
field1.align = "center"
field1:setTextColor( 1, 0.5, 0 )
field1.text = "Hello World!"
``````
