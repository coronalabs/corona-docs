# native.newTextBox()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [TextBox][api.type.TextBox]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          text box, text input, native text
> __See also__          [native.newTextField()][api.library.native.newTextField]
>						[native.setKeyboardFocus()][api.library.native.setKeyboardFocus]
>						[userInput][api.event.userInput]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a scrollable, __multi-line__ [TextBox][api.type.TextBox] object for text input. For <nobr>single-line</nobr> text input, see [native.newTextField()][api.library.native.newTextField].

By default, the content of text boxes is not editable. Set the [object.isEditable][api.type.TextBox.isEditable] property to `true` to make the content editable.

Native text boxes can listen for [userInput events][api.event.userInput] (see&nbsp;example).


## Gotchas

* Use `"\n"` to start text on a new line. Text will automatically wrap to the next line if it's too long.

* Native text boxes are not part of the OpenGL canvas and do not obey the display object hierarchy, so they will always appear in front of normal display objects including images, text, and vector objects. However, native text boxes can be "inserted" ([object:insert()][api.type.GroupObject.insert]) into Corona [display groups][api.type.GroupObject] and they will move in unison with that group.

* Presentation of native controls in the Corona Simulator can only be an approximation of the actual device. Always test on a device and assume that the behavior/appearance on devices is correct.

* To remove a native text box from the display, use `object:removeSelf()`.

* The [native.setKeyboardFocus()][api.library.native.setKeyboardFocus] API is used to show and hide the keyboard used for text input (applies&nbsp;to device and Xcode Simulator&nbsp;only).

* On Android, due to the fact that Corona runs on multiple threads, getting the `.text` value of a [TextBox][api.type.TextBox] immediately after setting it will not return the correct value. This action should be performed following a short [timer][api.library.timer] or during the next time step.


## Syntax

	native.newTextBox( x, y, width, height )

##### x ~^(required)^~
_[Number][api.type.Number]._ The __x__ coordinate that corresponds to the center of the text box.

##### y ~^(required)^~
_[Number][api.type.Number]._ The __y__ coordinate that corresponds to the center of the text box.

##### width ~^(required)^~
_[Number][api.type.Number]._ Width of the text box.

##### height ~^(required)^~
_[Number][api.type.Number]._ Height of the text box.


## Properties / Methods

See the [TextBox][api.type.TextBox] documentation for a list of functions and properties.


## Events

See the [userInput][api.event.userInput] event documentation for properties related to various [TextBox][api.type.TextBox] object events.


## Example

`````lua
local defaultBox

local function textListener( event )

	if ( event.phase == "began" ) then
		-- User begins editing "defaultBox"

	elseif ( event.phase == "ended" or event.phase == "submitted" ) then
		-- Output resulting text from "defaultBox"
		print( event.target.text )

	elseif ( event.phase == "editing" ) then
		print( event.newCharacters )
		print( event.oldText )
		print( event.startPosition )
		print( event.text )
	end
end

-- Create text box
defaultBox = native.newTextBox( 200, 200, 280, 140 )
defaultBox.text = "This is line 1.\nAnd this is line2"
defaultBox.isEditable = true
defaultBox:addEventListener( "userInput", textListener )
`````
