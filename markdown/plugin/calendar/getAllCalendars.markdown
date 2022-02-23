# calendar.getAllCalendars()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          calendar, list, getAllCalendars
> __See also__			[calendar.*][plugin.calendar]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`calendar.getAllCalendars()` lists all available calendars on the device.

## Syntax

	calendar.getAllCalendars( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener that will receive [calendars][plugin.calendar.event.calendarCalendars] event.


## Example

``````lua
local calendar = require( "plugin.calendar" )

local function listCalendarsListener( event )
	-- Handle result list in event.calendars
end

-- List all available calendars
calendar.getAllCalendars( listCalendarsListener )
``````
