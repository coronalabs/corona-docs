
# event.target

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [NativeDisplayObject][api.type.NativeDisplayObject]
> __Event__             [userInput][api.event.userInput]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          userInput, target
> __See also__          [event.text][api.event.userInput.text]
>						[native.newTextBox()][api.library.native.newTextBox]
>						[native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A direct reference to the native object associated with the [TextField][api.type.TextField] or [TextBox][api.type.TextBox] event.


## Gotchas

On a [phase][api.event.userInput.phase] of `"submitted"` or `"ended"`, use `event.target.text` to access the input object's text contents. In slight contrast, use `event.text` to access the object's text contents during an `"editing"` event.


## Example
 
``````lua
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
``````
