# object.placeholder

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> __See also__          [native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Native text fields can display optional placeholder text (`nil` by default). This can provide a "hint" as to what the user should enter in the field. If set, the placeholder string is displayed using the same style information (except&nbsp;the&nbsp;[text&nbsp;color][api.type.TextField.setTextColor]). The placeholder does not appear once actual text has been input into the field and it does not currently participate in determining the size of the text field.

## Example

`````lua
local numericField = native.newTextField( 150, 150, 220, 36 )
numericField.inputType = "number"

-- Optional placeholder (hint) for the text field
numericField.placeholder = "(phone number)"

numericField:addEventListener( "userInput", handlerFunction )
`````