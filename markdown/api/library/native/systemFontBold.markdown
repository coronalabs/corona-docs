
# native.systemFontBold

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Constant][api.type.Constant]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, fonts, systemFontBold
> __See also__          [native.systemFont][api.library.native.systemFont]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The native "bold" system font used by default for [display.newText()][api.library.display.newText], [native.newTextField()][api.library.native.newTextField], [native.newTextBox()][api.library.native.newTextBox], and various [widgets][api.library.widget].

## Example

`````lua
local text = display.newText( "Hello World!", 0, 0, native.systemFontBold, 12 )
text:setFillColor( 1, 0, 0 )
`````
