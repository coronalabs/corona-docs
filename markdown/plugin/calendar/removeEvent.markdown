# calendar.removeEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          calendar, event, remove, removeEvent
> __See also__			[calendar.*][plugin.calendar]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`calendar.removeEvent()` removes event with specified identifier.


## Syntax

	calendar.removeEvent( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing call parameters - see next section for details.

## Parameters table reference


##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener that will receive [removingEvent][plugin.calendar.event.calendarRemoveEvent] event.

##### eventId ~^(required)^~
_[String][api.type.String]._ Identifier of the event to be removed.


## Example

``````lua
local calendar = require( "plugin.calendar" )

local function removeEventListener( event )
	-- check event.isError if required
end

 -- retrieve event id from getEvents or addEvent
local someEventId = nil

-- Add event with specified properties
calendar.removeEvent(
{
    listener = removeEventListener,
    eventId = someEventId,
}
)
``````
