# calendar.addEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          calendar, event, add, addEvent
> __See also__			[calendar.*][plugin.calendar]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`calendar.addEvent()` adds event with specified properties.


## Syntax

	calendar.addEvent( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing call parameters - see next section for details.

## Parameters table reference

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener that will receive [event][plugin.calendar.event.calendarEvent] event.

##### calendarId ~^(optional)^~
_[String][api.type.String]._ Calendar identifier where calendar event should be added. Default calendar would be used if not specified.

##### title ~^(optional)^~
_[String][api.type.String]._ Title for new calendar event.

##### startDate ~^(optional)^~
_[Number][api.type.Number]._ Start date for new calendar event in Unix time format.

##### endDate ~^(optional)^~
_[Number][api.type.Number]._ End date for new calendar event in Unix time format.

##### location ~^(optional)^~
_[String][api.type.String]._ Location for new calendar event.

##### allDay ~^(optional)^~
_[Boolean][api.type.Boolean]._ Boolean value, where `true` means that new calendar event should last all day and `false` otherwise.

##### repeatFrequency ~^(optional)^~
_[String][api.type.String]._ Recurrency frequency for new calendar event. Valid values are: `day`, `week`, `month` and `year`. This field must be combined with `repeatEndDate`.

##### repeatEndDate ~^(optional)^~
_[Number][api.type.Number]._ Recurrency end date for new calendar event in Unix time format. This field must be combined with `repeatFrequency`.

##### alarms ~^(optional)^~
_[Table][api.type.Table]._ Lua array, each entry containing number of minutes before event to trigger an alarm.


## Example

``````lua
local calendar = require( "plugin.calendar" )

local unixTimeNow = os.time( os.date( '*t' ) )

local function addEventListener( event )
	-- Handle events here
end

-- Add event with specified properties
calendar.addEvent(
{
    listener = addEventListener,

    title = "Test Event",
    startDate = unixTimeNow + 86400,
    endDate = unixTimeNow + 86400 + 3600,
    alarm = 30,
    repeatFrequency = "day",
    repeatEndDate = unixTimeNow + 604800
}
)
``````
