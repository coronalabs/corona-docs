# object.font

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Userdata][api.type.Userdata]
> __Object__            [TextBox][api.type.TextBox]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native text input
> __See also__          [native.newTextBox()][api.library.native.newTextBox]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Gets or sets the native text box's font. May be set to a font object as returned by the [native.newFont()][api.library.native.newFont] function.

## Gotchas

The font size read or written to this property may be either in Corona's <nobr>content-scaled</nobr> points __or__ the platform's native points. You can determine which font size units are currently being used by querying the text box's [object.isFontSizeScaled][api.type.TextBox.isFontSizeScaled] property.

By default, the font size is measured in Corona's <nobr>content-scaled</nobr> point system, just like [display.newText()][api.library.display.newText], but the default can be changed via the `"isNativeTextBoxFontSizeScaled"` key of [display.setDefault()][api.library.display.setDefault].
