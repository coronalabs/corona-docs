# object:getSelection()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextBox][api.type.TextBox]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          getSelection
> __See also__          [native.newTextBox()][api.library.native.newTextBox]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the cursors first and last position.

## Syntax

	object:getSelection()

## Example

``````lua
local textBox = native.newTextBox( 160, 240, 280, 40 )

textBox.text = "asdf"
native.setKeyboardFocus( textBox )

local start, finish = textBox:getSelection()
-- if native cursor is placed after the "f" in the text, start and finish would return 4, 4
-- if native cursor is selecting the whole text, start and finish would return, 0, 4
