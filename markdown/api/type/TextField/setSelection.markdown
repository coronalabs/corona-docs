# object:setSelection()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setSelection
> __See also__          [native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the cursor position if the start and end positions are the same. Alternatively, sets a range of selected text if the start and end positions are different.

## Syntax

	object:setSelection( startPosition, endPosition )
	
##### startPosition ~^(required)^~
_[Number][api.type.Number]._ The cursor position or the beginning of the selection area. To select the first character, this value should be `0`.

##### endPosition ~^(required)^~
_[Number][api.type.Number]._ The end of the selection area (if greater than `startPosition`). The last character will be used if this number is greater than the length of the current string in the text field.

## Example

``````lua
local textField = native.newTextField( 160, 240, 280, 40 )

textField.text = "asdf"
native.setKeyboardFocus( textField )

textField:setSelection( 1, 3 )  -- The characters "sd" will be selected
textField:setSelection( 1, 1 )  -- Cursor will be placed between "a" and "s"
``````
