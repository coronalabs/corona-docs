# calendar.getEvents()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          calendar, events, list, get, getEvents
> __See also__			[calendar.*][plugin.calendar]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`calendar.getEvents()` lists all available events for specified calendar.


## Syntax

	calendar.getEvents( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing call parameters - see next section for details.

## Parameters table reference


##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener that will receive [events][plugin.calendar.event.calendarEvents] event.

##### calendarId ~^(optional)^~
_[String][api.type.String]._ An optional parameter to specify calendar to list events. If omitted, default calendar would be queried.

##### startDate ~^(optional)^~
_[Number][api.type.Number]._ An optional parameter to filter out event before this Unix time. If omitted, current date would be used.

##### endDate ~^(optional)^~
_[Number][api.type.Number]._ An optional parameter to filter out event after this Unix time. If omitted "distant future" would be used.


## Example

``````lua
local calendar = require( "plugin.calendar" )

local function listEventsListener( event )
	-- Handle resut in event.events here
end

-- List all available calendars
calendar.getEvents( { listener = listEventsListener } )
``````
