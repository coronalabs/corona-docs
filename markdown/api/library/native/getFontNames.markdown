
# native.getFontNames()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Array][api.type.Array]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          fonts, font names
> __See also__          [native.newFont()][api.library.native.newFont]
>						[display.newText()][api.library.display.newText]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns an array of the available native fonts.

## Gotchas

* The fonts available in the Corona Simulator may be different from those available on your device. In general, iOS device fonts can be accessed from the Corona&nbsp;Simulator for macOS, but additional macOS fonts will also be available that may not work on the device. If you encounter a problem of fonts appearing in the Corona Simulator but not on your device, this is the most likely cause. When in doubt, check the available device font names using `native.getFontNames()`.

* Also use `native.getFontNames()` if you're using custom fonts. On Android, the font name must be spelled __exactly__ right, but often the font name is different from the font file name; for a given font file, the font name can be different on Android than on iOS.


## Syntax

	native.getFontNames()


## Example

`````lua
local systemFonts = native.getFontNames()

-- Set the string to query for (part of the font name to locate)
local searchString = "pt"

-- Display each font in the Terminal/console
for i, fontName in ipairs( systemFonts ) do

	local j, k = string.find( string.lower(fontName), string.lower(searchString) )

	if ( j ~= nil ) then
		print( "Font Name = " .. tostring( fontName ) )
	end
end
`````
