# object.font

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Userdata][api.type.Userdata]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> __See also__			[object:resizeFontToFitHeight()][api.type.TextField.resizeFontToFitHeight]
>						[object:resizeHeightToFitFont()][api.type.TextField.resizeHeightToFitFont]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Gets or sets the native text field's font. May be set to a font object as returned by the [native.newFont()][api.library.native.newFont] function.

## Gotchas

The font size read or written to this property may be either in Corona's <nobr>content-scaled</nobr> points __or__ the platform's native points. You can determine which font size units are currently being used by querying the text field's [object.isFontSizeScaled][api.type.TextField.isFontSizeScaled] property.

By default, the font size is measured in Corona's <nobr>content-scaled</nobr> point system, just like [display.newText()][api.library.display.newText], but the default can be changed via the `"isNativeTextFieldFontSizeScaled"` key of [display.setDefault()][api.library.display.setDefault].

## Example

``````lua
local myField = native.newTextField( 10, 30, 180, 30 )
myField.font = native.newFont( native.systemFontBold, 18 )
myField:resizeHeightToFitFont()
``````
