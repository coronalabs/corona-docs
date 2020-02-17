
# native.setKeyboardFocus()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          keyboard, text, text input, focus
> __See also__          [native.newTextField()][api.library.native.newTextField]<br/>[native.newTextBox()][api.library.native.newTextBox]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets keyboard focus on a [native.newTextField()][api.library.native.newTextField] or [native.newTextBox()][api.library.native.newTextBox] and shows (or&nbsp;hides) the keyboard. Pass `nil` to remove focus and hide the keyboard. Hiding the keyboard dispatches an `"ended"` [phase][api.event.userInput.phase] to the native object's listener function.


## Syntax

	native.setKeyboardFocus( textField )

##### textField ~^(required)^~
_[Object][api.type.Object]._ ID/reference of the text field/box on which to set the keyboard focus, or `nil` to hide the keyboard.


## Example

`````lua
local function onUsername( event )
    if ( "began" == event.phase ) then
        -- This is the "keyboard appearing" event.
        -- In some cases you may want to adjust the interface while the keyboard is open.

    elseif ( "submitted" == event.phase ) then
        -- Automatically tab to password field if user clicks "Return" on virtual keyboard.
        native.setKeyboardFocus( passwordField )
    end
end
 
local function onPassword( event )
    -- Hide keyboard when the user clicks "Return" in this field
    if ( "submitted" == event.phase ) then
        native.setKeyboardFocus( nil )
    end
end
 
usernameField = native.newTextField( 50, 150, 220, 36 )
usernameField.font = native.newFont( native.systemFontBold, 24 )
usernameField.text = ""
usernameField:setTextColor( 0.4, 0.4, 0.8 )
usernameField:addEventListener( "userInput", onUsername )

passwordField = native.newTextField( 50, 210, 220, 36 )
passwordField.font = native.newFont( native.systemFontBold, 24 )
passwordField.text = ""
passwordField.isSecure = true
passwordField:setTextColor( 0.4, 0.4, 0.8 )
passwordField:addEventListener( "userInput", onPassword )
`````
