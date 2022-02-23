# calendar.editEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          calendar, event, edit, editEvent
> __See also__			[calendar.*][plugin.calendar]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`calendar.editEvent()` updates existing event with specified properties.


## Syntax

	calendar.editEvent( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing call parameters - see next section for details.

## Parameters table reference

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener that will receive [event][plugin.calendar.event.calendarEvent] event.

##### eventId ~^(required)^~
_[String][api.type.String]._ Identifier of calendar event to modify.

##### title ~^(optional)^~
_[String][api.type.String]._ Title for the event.

##### startDate ~^(optional)^~
_[Number][api.type.Number]._ Start date for the event in Unix time format.

##### endDate ~^(optional)^~
_[Number][api.type.Number]._ End date for the event in Unix time format.

##### calendarId ~^(optional)^~
_[String][api.type.String]._ Calendar identifier to move the calendar event.

<div class="guide-notebox">
<div class="notebox-title">Note</div>
    Changing calendar will probably change event's identifier.
</div>


##### location ~^(optional)^~
_[String][api.type.String]._ Location for the event.

##### allDay ~^(optional)^~
_[Boolean][api.type.Boolean]._ Boolean value, where `true` means that the event should last all day and `false` otherwise.

##### repeatFrequency ~^(optional)^~
_[String][api.type.String]._ Recurrency frequency for the event. Valid values are: `day`, `week`, `month` and `year`.

##### repeatEndDate ~^(optional)^~
_[Number][api.type.Number]._ Recurrency end date for the event in Unix time format.

##### alarms ~^(optional)^~
_[Table][api.type.Table]._ Lua array, each entry containing number of minutes before event to trigger an alarm.


## Example

``````lua
local calendar = require( "plugin.calendar" )

local function editEventListener( event )
	-- Handle events here
end

 -- retrieve event id from getEvents or addEvent
local someEventId = nil

-- Change event's title
calendar.editEvent(
{
    listener = editEventListener,
    eventId = someEventId,
    title = "Modified Test Event"
}
)
``````
