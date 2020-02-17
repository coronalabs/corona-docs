# object.autocorrectionType

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          keyboard, text input, text field, native text
> __See also__			[object.spellCheckingType][api.type.TextField.spellCheckingType]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This iOS-only property controls the type of <nobr>auto-correction</nobr> performed. Possible values are:

* `"UITextAutocorrectionTypeDefault"`
* `"UITextAutocorrectionTypeYes"`
* `"UITextAutocorrectionTypeNo"`

Please consult the iOS documentation on [UITextAutocorrectionType](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITextInputTraits_Protocol/index.html#//apple_ref/c/tdef/UITextAutocorrectionType) for an explanation of each behavior.

## Example

``````lua
local field = native.newTextField( 50, 150, 220, 36 )
field.autocorrectionType = "UITextAutocorrectionTypeDefault"
``````
