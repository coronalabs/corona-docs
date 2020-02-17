
# event.text

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [userInput][api.event.userInput]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          userInput, text
> __See also__          [event.target][api.event.userInput.target]
>						[native.newTextBox()][api.library.native.newTextBox]
>						[native.newTextField()][api.library.native.newTextField]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The text content of the [TextField][api.type.TextField] or [TextBox][api.type.TextBox].


## Gotchas

This property is only available during the `"editing"` [phase][api.event.userInput.phase] of [userInput][api.event.userInput] events. On a [phase][api.event.userInput.phase] of `"submitted"` or `"ended"`, use `event.target.text` to access the input object's text contents.


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
