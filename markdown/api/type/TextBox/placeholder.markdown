# object.placeholder

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextBox][api.type.TextBox]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> __See also__          [native.newTextBox()][api.library.native.newTextBox]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Native text boxes can display optional placeholder text (`nil` by default). This can provide a "hint" as to what the user should enter in the box. If set, the placeholder string is displayed using the same style information (except&nbsp;the&nbsp;[text&nbsp;color][api.type.TextBox.setTextColor]). The placeholder does not appear once actual text has been input into the box and it does not currently participate in determining the size of the text box.

## Example

`````lua
local textBox = native.newTextBox( 160, 240, 280, 140 )

-- Optional placeholder (hint) for the text box
textBox.placeholder = "(description)"
`````