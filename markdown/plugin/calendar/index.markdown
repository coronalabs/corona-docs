# calendar.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          calendar
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview


The Calendar plugin allows listing calendars and manipulating events within them.


## Syntax

	local calendar = require( "plugin.calendar" )


## Functions

#### [calendar.getAllCalendars()][plugin.calendar.getAllCalendars]

#### [calendar.getEvents()][plugin.calendar.getEvents]

#### [calendar.addEvent()][plugin.calendar.addEvent]

#### [calendar.editEvent()][plugin.calendar.editEvent]

#### [calendar.removeEvent()][plugin.calendar.removeEvent]


## Project Settings

To use this plugin, add the following entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.calendar"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

### iOS

For iOS, you must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).:

``````lua
settings =
{
    iphone =
    {
        plist =
        {
            NSCalendarsUsageDescription = "This app would like to access calendars from your device",
            NSRemindersUsageDescription = "This app would like to access reminders from your device",
        },
    },
}
``````

