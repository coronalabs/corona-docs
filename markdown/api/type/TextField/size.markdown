# object.size

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          text size, native text input
> __See also__          [native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Gets or sets the native text field's font size.

Setting this property to `nil` or `0` will make the text field use the system's default font size.

It is recommended that you call [object:resizeHeightToFitFont()][api.type.TextField.resizeHeightToFitFont] when changing the font size, because the default font size can vary considerably between devices. The advantage of this approach is that the native text field and its font size will be consistent when compared to other native apps on the same device.

## Gotchas

The font size read or written to this property may be either in Corona's <nobr>content-scaled</nobr> points __or__ the platform's native points. You can determine which font size units are currently being used by querying the text field's [object.isFontSizeScaled][api.type.TextField.isFontSizeScaled] property.

By default, the font size is measured in Corona's <nobr>content-scaled</nobr> point system, just like [display.newText()][api.library.display.newText], but the default can be changed via the `"isNativeTextFieldFontSizeScaled"` key of [display.setDefault()][api.library.display.setDefault].

## Example

``````lua
-- Create a native text field
local textField = native.newTextField( 50, 100, 100, 35 )
textField.align = "center"

-- Change the text field's size property
textField.size = 32
-- Resize the text field height to fit the font
textField:resizeHeightToFitFont()

textField:setTextColor( 1, 0.5, 0 )
textField.text = "Hello World!"
``````