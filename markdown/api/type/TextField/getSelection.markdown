# object:getSelection()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          getSelection
> __See also__          [native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the cursors first and last position.

## Syntax

	object:getSelection()

## Example

``````lua
local textField = native.newTextField( 160, 240, 280, 40 )

textField.text = "asdf"
native.setKeyboardFocus( textField )

local start, finish = textField:getSelection()
-- if native cursor is placed after the "f" in the text, start and finish would return 4, 4
-- if native cursor is selecting the whole text, start and finish would return, 0, 4
``````
