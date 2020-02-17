# object:resizeHeightToFitFont()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          resizeHeightToFitFont, native text input
> __See also__          [object:resizeFontToFitHeight()][api.type.TextField.resizeFontToFitHeight]
>						[native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Changes the height of the text field to "best&nbsp;fit" the font size that it's currently using.

## Syntax

	object:resizeHeightToFitFont()

## Example

``````lua
-- Create the text field
-- When a text field is created, it will auto-size its font to best fit the field height
local textField = native.newTextField( 160, 240, 280, 40 )
textField.text = "Hello World"

-- Change the text field's font size to the system default 
textField.size = nil
-- Resize the text field's height to best fit the font
textField:resizeHeightToFitFont()
``````
