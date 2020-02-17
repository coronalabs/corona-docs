# native.newTextField()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [TextField][api.type.TextField]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          text input, text fields, native text
> __See also__          [native.newTextBox()][api.library.native.newTextBox]
>						[native.setKeyboardFocus()][api.library.native.setKeyboardFocus]
>						[object.inputType][api.type.TextField.inputType]
>						[userInput][api.event.userInput]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a __single-line__ [TextField][api.type.TextField] object for text input. For <nobr>multi-line</nobr> text input, see [native.newTextBox()][api.library.native.newTextBox].

The default font size of the text field depends on the field's height and is calculated to be the maximum font size that will fit inside the field, taking into account such things as <nobr>platform-specific</nobr> margins. The easiest way to create a text field is to set its height and let the font size be calculated automatically &mdash; however, note the first "gotcha" below.

Native text fields can listen for [userInput events][api.event.userInput] (see&nbsp;example).

Native text fields can display optional [placeholder][api.type.TextField.placeholder] text (`nil` by default). This can provide a "hint" as to what the user should enter in the field. If set, the placeholder string is displayed using the same style information (except&nbsp;the&nbsp;[text&nbsp;color][api.type.TextField.setTextColor]). The placeholder does not appear once actual text has been input into the field and it does not currently participate in determining the size of the text field.


## Gotchas

* Presentation of native controls in the Corona Simulator can only be an approximation of the actual device. Always test on a device and assume that the behavior/appearance on devices is correct. In particular, the internal margins in text fields on some devices may be much larger than expected, reducing the space available for the actual text and making the font appear to be very small because it is being <nobr>auto-sized</nobr> into a small region. Increasing the font size won't help since there will not be space available for the font, so increasing the height of the text field is a better approach. See [object:resizeHeightToFitFont()][api.type.TextField.resizeHeightToFitFont] and [object:resizeFontToFitHeight()][api.type.TextField.resizeFontToFitHeight] for convenient ways to make these kind of adjustments. Note that the internal margins of text fields are __not__ adjustable.

* Native text fields are not part of the OpenGL canvas and do not obey the display object hierarchy, so they will always appear in front of normal display objects including images, text, and vector objects. However, native text fields can be "inserted" ([object:insert()][api.type.GroupObject.insert]) into Corona [display groups][api.type.GroupObject] and they will move in unison with that group.

* To remove a native text field from the display, use `object:removeSelf()`.

* The [native.setKeyboardFocus()][api.library.native.setKeyboardFocus] API is used to show and hide the keyboard used for text input (applies&nbsp;to device and Xcode iOS Simulator&nbsp;only).

* On Android, due to the fact that Corona runs on multiple threads, getting the `.text` value of a [TextField][api.type.TextField] immediately after setting it will not return the correct value. This action should be performed following a short [timer][api.library.timer] or during the next time step.


## Syntax

	native.newTextField( x, y, width, height )

##### x ~^(required)^~
_[Number][api.type.Number]._ The __x__ coordinate that corresponds to the center of the text field.

##### y ~^(required)^~
_[Number][api.type.Number]._ The __y__ coordinate that corresponds to the center of the text field.

##### width ~^(required)^~
_[Number][api.type.Number]._ Width of the text field.

##### height ~^(required)^~
_[Number][api.type.Number]._ Height of the text field.


## Properties / Methods

See the [TextField][api.type.TextField] documentation for a list of methods and properties.


## Events

See the [userInput][api.event.userInput] event documentation for properties related to various [TextField][api.type.TextField] object events.


## Examples

##### Standard

`````lua
local defaultField

local function textListener( event )

	if ( event.phase == "began" ) then
		-- User begins editing "defaultField"

	elseif ( event.phase == "ended" or event.phase == "submitted" ) then
		-- Output resulting text from "defaultField"
		print( event.target.text )

	elseif ( event.phase == "editing" ) then
		print( event.newCharacters )
		print( event.oldText )
		print( event.startPosition )
		print( event.text )
	end
end

-- Create text field
defaultField = native.newTextField( 150, 150, 180, 30 )
defaultField:addEventListener( "userInput", textListener )
`````

##### Numeric Input Only

`````lua
local numericField

local function textListener( event )

	if ( event.phase == "began" ) then
		-- User begins editing "numericField"
	end
end

-- Create text field
numericField = native.newTextField( 150, 150, 180, 30 )
numericField.inputType = "number"
numericField:addEventListener( "userInput", textListener )
`````
