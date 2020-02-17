# object:removeEventListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [EventDispatcher][api.type.EventDispatcher]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          removeEventListener, event listener
> __See also__          [object:addEventListener()][api.type.EventDispatcher.addEventListener]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Removes the specified listener from the object's list of listeners so that it no longer is notified of events corresponding to the specified event.

Returns a [boolean][api.type.Boolean] value indicating if the given listener was successfully removed. Will return `false` if given invalid arguments or if the given listener does not exist in the internal listener list.


## Gotchas

Note that `nil` is a valid value for `listener` under certain circumstances, so it's not an error to call `object:removeEventListener()` with a `nil` listener. Bugs may persist if you accidentally use the wrong name for the listener you're trying to remove.

## Syntax

	object:removeEventListener( eventName, listener )

##### eventName ~^(required)^~
_[String][api.type.String]._ Specifies the name of the event whose corresponding listener should be removed from the list.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Reference to the listener to remove from the list.


## Example

``````lua
-- Define motion and limits
local DX, DY = 3, 3
local XMIN, XMAX = 1, display.contentWidth-1
local YMIN, YMAX = 20, display.contentHeight-1

-- Create a shape 
local button = display.newRoundedRect( XMIN, YMIN, 150, 50, 5 )
button:setFillColor( 0.4, 0, 1 )
button.strokeWidth = 6
button:setStrokeColor( 0.8 )

-- Move the shape until it hits the limits
local function onFrame (event)
    if button.x + button.width/2 > XMAX or button.x < XMIN 
    or button.y + button.height/2 > YMAX or button.y < YMIN then
        -- Stop
        Runtime:removeEventListener( "enterFrame", onFrame )
    else
        -- Move
        button.x = button.x + DX
        button.y = button.y + DX
    end
end
 
-- Update the position every frame
Runtime:addEventListener( "enterFrame", onFrame )
``````
