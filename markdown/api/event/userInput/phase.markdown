
# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [userInput][api.event.userInput]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          userInput, phase
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [String][api.type.String] identifying where in the [userInput][api.event.userInput] sequence the event occurred. This can be one of the following values:

* `"began"` &mdash; On devices this is the <nobr>"keyboard has appeared"</nobr> event; depending on your interface design, you may want to adjust the screen contents when the keyboard comes on screen.  In desktop apps this event occurs when the field gains focus, for example when the user clicks inside it.

* `"ended"` &mdash; This event is sent when the text field/box loses focus, for example when the user touches a different field or when the keyboard is hidden.

* `"submitted"` &mdash; For [TextField][api.type.TextField] objects, this event is dispatched when the user presses the "return" key to finish editing. This does not apply to [TextBox][api.type.TextBox] objects because pressing "return" adds a new line.

* `"editing"` &mdash; This event occurs when the user types or modifies text in the field. During this phase, several other keys are present in the `event` table (see&nbsp;the [userInput][api.event.userInput] documentation for a complete listing).


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
