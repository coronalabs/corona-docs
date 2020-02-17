
# native.systemFont

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Constant][api.type.Constant]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, fonts, systemFont
> __See also__          [native.systemFontBold][api.library.native.systemFontBold]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The native system font used by default for [display.newText()][api.library.display.newText], [native.newTextField()][api.library.native.newTextField], [native.newTextBox()][api.library.native.newTextBox], and various [widgets][api.library.widget].

## Example

`````lua
local text = display.newText( "Hello World!", 0, 0, native.systemFont, 12 )
text:setFillColor( 1, 0, 0 )
`````