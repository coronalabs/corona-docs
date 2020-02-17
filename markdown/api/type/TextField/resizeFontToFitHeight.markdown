# object:resizeFontToFitHeight()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          resizeFontToFitHeight, native text input
> __See also__          [object:resizeHeightToFitFont()][api.type.TextField.resizeHeightToFitFont]
>						[native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Changes the font size to "best fit" the current height of the text field. This will automatically occur when you first create a text field via the [native.newTextField()][api.library.native.newTextField] function.

## Syntax

	object:resizeFontToFitHeight()

## Example

``````lua
-- Create the text field
-- When a text field is created, it will auto-size its font to best fit the field height
local textField = native.newTextField( 160, 240, 280, 40 )
textField.text = "Hello World"

-- Change the height of the text field
textField.height = 60
-- Resize the font to best fit the text field's new height
textField:resizeFontToFitHeight()
``````