
# display.getDefault()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      various
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          defaults, get default, color, graphics, vector objects
> __See also__          [display.setDefault()][api.library.display.setDefault]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Get default display values including default colors for display objects, anchor point defaults, texture wrapping settings, etc.

## Syntax

	display.getDefault( key )

##### key ~^(required)^~
_[String][api.type.String]._ Specifies the key to get the default value for.


## Display Object Keys

These keys indicate default anchor values and anchor bounds for all display objects.

* `"anchorX"` &mdash; The default anchor alignment along the __x__ direction. Values range between `0` and `1`.

* `"anchorY"` &mdash; The default anchor alignment along the __y__ direction. Values range between `0` and `1`.


## Color Keys

A color key indicates which default color value is set.

* `"background"` &mdash; The default color for that the screen is cleared with. Returns multiple values (see [example](#examples) below).

* `"fillColor"` &mdash; The default fill color for vector objects like [display.newRect()][api.library.display.newRect]. Returns multiple values (see [example](#examples) below).

* `"strokeColor"` &mdash; The default stroke color for vector objects like [display.newRect()][api.library.display.newRect]. Returns multiple values (see [example](#examples) below).

* `"lineColor"` &mdash; The default color for line objects like [display.newLine()][api.library.display.newLine]. Returns multiple values (see [example](#examples) below).


## Native Keys

* `"isNativeTextBoxFontSizeScaled"` &mdash; The default [Boolean][api.type.Boolean] value to be assigned to a native text box's [object.isFontSizeScaled][api.type.TextBox.isFontSizeScaled] property when created via the [native.newTextBox()][api.library.native.newTextBox] function. This is `true` by default.

* `"isNativeTextFieldFontSizeScaled"` &mdash; The default [Boolean][api.type.Boolean] value to be assigned to a native text field's [object.isFontSizeScaled][api.type.TextField.isFontSizeScaled] property when created via the [native.newTextField()][api.library.native.newTextField] function. This is `true` by default.


## Texture Keys

* `"isExternalTextureRetina"` &mdash; The default [Boolean][api.type.Boolean] value to be assigned as a [external texture][api.type.TextureResourceExternal]'s sampling behavior whenever a new one is created, say
by a plugin. This is `true` by default.

* `"isImageSheetFrameTrimCorrected"` &mdash; The default [Boolean][api.type.Boolean] value to be assigned as a new [sprite][api.type.SpriteObject]'s frame trim correction behavior whenever a sprite is loaded by
Solar2D. This is `false` by default.

* `"magTextureFilter"` &mdash; The default magnification sampling filter applied whenever an image is loaded. Values include `"linear"` or `"nearest"`.

* `"minTextureFilter"` &mdash; The default minification sampling filter applied whenever an image is loaded. Values include `"linear"` or `"nearest"`.

* `"textureWrapX"` &mdash; The texture wrap mode along the __x__ direction. Values include `"clampToEdge"`, `"repeat"`, or `"mirroredRepeat"`.

* `"textureWrapY"` &mdash; The texture wrap mode along the __y__ direction. Values include `"clampToEdge"`, `"repeat"`, or `"mirroredRepeat"`.


<a id="examples"></a>

## Examples

``````lua
-- Fill color default values
local defaultR, defaultG, defaultB, defaultA = display.getDefault( "fillColor" )
print( defaultR, defaultG, defaultB, defaultA )

-- Default "anchorX" value
local defaultAnchorX = display.getDefault( "anchorX" )
print( defaultAnchorX )

-- Default "anchorY" value
local defaultAnchorY = display.getDefault( "anchorY" )
print( defaultAnchorY )
``````
