# object.spellCheckingType

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          keyboard, text input, text field, native text
> __See also__			[object.autocorrectionType][api.type.TextField.autocorrectionType]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This iOS-only property controls the type of spell checking behavior. Possible values are:

* `"UITextSpellCheckingTypeDefault"`
* `"UITextSpellCheckingTypeYes"`
* `"UITextSpellCheckingTypeNo"`

Please consult the iOS documentation on [UITextSpellCheckingType](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITextInputTraits_Protocol/index.html#//apple_ref/c/tdef/UITextSpellCheckingType) for an explanation of each behavior.

## Example

``````lua
local field = native.newTextField( 50, 150, 220, 36 )
field.spellCheckingType = "UITextSpellCheckingTypeDefault"
``````
