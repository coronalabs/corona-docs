
# native.newFont()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Userdata][api.type.Userdata]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          font, custom font, fonts
> __See also__          [Using Custom Fonts][guide.system.customFont] _(guide)_
>						[native.getFontNames()][api.library.native.getFontNames]
>						[display.newText()][api.library.display.newText]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a font object that you can use to specify fonts in native text fields, native text boxes, and text display objects.

## Gotchas

Available fonts are platform-dependent. Also, the fonts available in the Simulator may be different from the fonts actually available on the device. When in doubt, check the available device font names using [native.getFontNames()][api.library.native.getFontNames].

## Syntax

	native.newFont( name [, size] )

##### name ~^(required)^~
_[String][api.type.String], [Userdata][api.type.Userdata], or [Constant][api.type.Constant]._ This can be one of the following:

* The font family name (typeface name). You may obtain an array of available font names via [native.getFontNames()][api.library.native.getFontNames].
* Name of the font file in the Corona project's main resource directory (alongside `main.lua`).
* A font object returned by [native.newFont()][api.library.native.newFont].
* A font constant such as [native.systemFont][api.library.native.systemFont] or [native.systemFontBold][api.library.native.systemFontBold].

##### size ~^(optional)^~
_[Number][api.type.Number]._ The point size of the font to use. By default, it will be the standard system font size of the device.


## Example

`````lua
local textBox = native.newTextBox( 30, 140, 260, 100 )
textBox.font = native.newFont( "Helvetica-Bold", 16 )
textBox:setTextColor( 0.5 )
`````