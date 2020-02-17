# object.size

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [TextBox][api.type.TextBox]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          text size, native text input
> __See also__          [native.newTextBox()][api.library.native.newTextBox]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Gets or sets the native text box's font size.

Setting this property to `nil` or `0` will make the text box use the system's default font size.

## Gotchas

The font size read or written to this property may be either in Corona's <nobr>content-scaled</nobr> points __or__ the platform's native points. You can determine which font size units are currently being used by querying the text box's [object.isFontSizeScaled][api.type.TextBox.isFontSizeScaled] property.

By default, the font size is measured in Corona's <nobr>content-scaled</nobr> point system, just like [display.newText()][api.library.display.newText], but the default can be changed via the `"isNativeTextBoxFontSizeScaled"` key of [display.setDefault()][api.library.display.setDefault].

## Example

`````lua
-- Create a native text box
local textBox = native.newTextBox( 160, 240, 280, 140 )
textBox:setTextColor( 0.8, 0.8, 0.8 )
textBox.hasBackground = false
textBox.text = "Hello World!"

-- Change the text box's size property
textBox.size = 18
`````