# event.events

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [events][plugin.calendar.event.calendarEvents]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          calendar, events, alarm
> __See also__			[events][plugin.calendar.event.calendarEvents]
>						[calendar.*][plugin.calendar]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Events queried by [calendar.getEvents()][plugin.calendar.getEvents].

Lua array, each element containing [table][api.type.Table] with following fields:


#### `title`

[String][api.type.String] contains the event title.

#### `eventId`

[String][api.type.String] contains the event identifier.

#### `calendarTitle`

[String][api.type.String] contains the calendar title.

#### `calendarId`

[String][api.type.String] contains the calendar identifier.

#### `startDate`

[Number][api.type.Number] contains the event start date in Unix time format.

#### `endDate`

[Number][api.type.Number] contains the event end date in Unix time format.

#### `location`

[String][api.type.String] contains the event location.

#### `allDay`

[Boolean][api.type.Boolean] contains the value `true` if an event should last all day long and `false` otherwise.

#### `repeatFrequency`

[String][api.type.String] contains the event recurrency frequency. Valid values are: `day`, `week`, `month` and `year`.

#### `repeatEndDate`

[Number][api.type.Number] contains the event recurrency end date in Unix time format.

#### `alarms`

[Table][api.type.Table]. Lua array, each entry containing number of minutes before event to trigger an alarm.
