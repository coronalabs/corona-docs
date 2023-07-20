# object.clearButtonMode

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          keyboard, text input, text field, native text
> __See also__			[object.setSelection][api.type.TextField.setSelection]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This iOS-only property controls the type of <nobr>clear text button</nobr> is that is presented. Possible values are:

* `"UITextClearButtonModeNever"`
* `"UITextClearButtonModeWhileEditing"`
* `"UITextClearButtonModeUnlessEditing"`
* `"UITextClearButtonModeAlways"`

Please consult the iOS documentation on [UITextFieldViewMode](https://developer.apple.com/documentation/uikit/uitextfieldviewmode?language=objc) for an explanation of each behavior.

## Example

``````lua
local field = native.newTextField( 50, 150, 220, 36 )
field.clearButtonMode = "UITextClearButtonModeUnlessEditing"
``````
