# object.inputType

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          keyboard, keyboard type, text input, text field, native text
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets the keyboard type for a native text input field.

## Keyboard Types

Possible string values are:

* `"default"` — the default keyboard, supporting general text, numbers and punctuation.
* `"number"` — a numeric keypad.
* `"decimal"` — a keypad for entering decimal values.
* `"phone"` — a keypad for entering phone numbers.
* `"url"` — a keyboard for entering website URLs.
* `"email"` — a keyboard for entering email addresses.
* `"no-emoji"` — the default keyboard, supporting general text, numbers and punctuation but does not allow emoji to be typed.

### iOS Extensions

The following values are iOS-specific and correspond to the names of actual constants in the iOS API:

* `"UIKeyboardTypeASCIICapable"`
* `"UIKeyboardTypeNumbersAndPunctuation"`
* `"UIKeyboardTypeNamePhonePad"`
* `"UIKeyboardTypeTwitter"`
* `"UIKeyboardTypeWebSearch"`

Please consult the iOS documentation on [UIKeyboardType](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITextInputTraits_Protocol/index.html#//apple_ref/doc/c_ref/UIKeyboardType) for an explanation of each keyboard type.


## Gotchas

* To create an obscured password entry field, set the [object.isSecure][api.type.TextField.isSecure] boolean property to `true`.

* The Corona Simulator and desktop apps do not support the `"phone"`, `"url"`, or `"email"` input types.

* Some operating systems permit the user to paste text which includes emoji, even though they can't be typed.

* Note that "emoji" is narrowly defined to be the <nobr>multi-byte</nobr> character entities that cause issues with some APIs. Some operating systems include characters on their "emoji&nbsp;keyboards" which are just basic Unicode symbols.

## Example

``````lua
local numericField = native.newTextField( 50, 150, 220, 36 )
numericField.inputType = "number"
``````
