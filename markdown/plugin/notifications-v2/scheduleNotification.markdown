# notifications.scheduleNotification()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		[Userdata][api.type.Userdata]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			notification, notifications, scheduleNotification
> __See also__			[notifications.cancelNotification()][plugin.notifications-v2.cancelNotification]
>						[notifications.*][plugin.notifications-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Schedules a local [notification][api.event.notification] event to be delivered in the future.

This function returns a reference ID that can be used to cancel the notification. The ID is a memory address (pointer) to an object, thus it cannot be saved and it will not be available the next time the program runs.


## Gotchas

### iOS

Scheduling a notification upon application suspend can cause the application to crash.

### Android

Unlike iOS, local notifications on Android are managed by the application and not by the operating system. This means that all scheduled notifications and status bar notifications will be cleared when the application process terminates. However, pressing the __Back__ key to exit the application window will not terminate the application process&nbsp;&mdash; this only destroys the application window which runs your project's Lua scripts and it will receive the `"applicationExit"` [system][api.event.system.type] event just before being destroyed. Thus, the application process will continue to run in the background&nbsp;&mdash; this is standard Android application behavior which allows its notifications to remain available. If the application process gets fully terminated, Corona will automatically restore all pending notifications when the application restarts.

This said, calling [os.exit()][api.library.os.exit] will terminate the application process and __clear__ all notifications. If you need to close just the application window, call [native.requestExit()][api.library.native.requestExit] which only exits the application window and keeps the application process alive, thus keeping your notifications alive.

Also note that all scheduled notifications and status bar notifications will be cleared after rebooting the Android device. In order to restore all notifications, you must set the following permission in your `build.settings` file to set up your application to be started in the background after the Android device boots up:

``````{ brush="lua" gutter="false" first-line="1" highlight="[7]" }
settings =
{
	android =
	{
		usesPermissions =
		{
			"android.permission.RECEIVE_BOOT_COMPLETED",
		},
	},
}
``````


## Syntax

	notifications.scheduleNotification( time [, options] )

##### time ~^(required)^~
This parameter can be in one of two formats:

* A [number][api.type.Number] indicating the number of seconds from this schedule call until delivery.
* A [table][api.type.Table] indicating the __Coordinated&nbsp;Universal&nbsp;Time__ (UTC) at which to deliver the notification. This table should contain the same properties as returned by <nobr>`os.date( "!*t" )`</nobr>. Note that a common pitfall is to pass `"*t"` instead of `"!*t"` which results in a time given in your current time zone instead of a UTC time.

##### options ~^(optional)^~
_[Table][api.type.Table]._ A table that specifies details about the notification to be scheduled&nbsp;&mdash; see the next section for details.


## Options Reference

The `options` table contains details about the notification to be scheduled.

##### alert ~^(optional)^~
_[String][api.type.String]._ The notification message to be displayed to the user. If the application is not currently running, a system alert will display this message.

##### badge ~^(optional)^~
_[Number][api.type.Number]._ The badge number to be displayed on the application icon when the scheduled notification triggers. This replaces the last badge number that was applied. Set to `0` to omit the badge number. This option is not supported on Android.

##### sound ~^(optional)^~
_[String][api.type.String]._ Name of the sound file in the [system.ResourceDirectory][api.library.system.ResourceDirectory] to be played when the scheduled notification triggers. This sound is only played if the app is __not__ currently in the foreground. On iOS, there are limitations on the kinds of sound that can be played (consult&nbsp;Apple's [documentation](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/SupportingNotificationsinYourApp.html) for more&nbsp;details).

##### custom ~^(optional)^~
_[Table][api.type.Table]._ A table that will be delivered with the [notification][api.event.notification] event. This allows you to pass custom information with the notification.


## Example

``````lua
local notifications = require( "plugin.notifications.v2" )

-- Get the app's launch arguments in case it was started when the user tapped on a notification
local launchArgs = ...

-- Set up notification options
local options = {
	alert = "Wake up!",
	badge = 2,
	sound = "alarm.caf",
	custom = { foo = "bar" }
}

-- Schedule a notification to occur 60 seconds from now
local notification1 = notifications.scheduleNotification( 60, options )
 
-- Schedule a notification using Coordinated Universal Time (UTC)
local utcTime = os.date( "!*t", os.time() + 60 )
local notification2 = notifications.scheduleNotification( utcTime, options )

-- Listen for notifications
local function onNotification( event )
	print( event.name )
	if ( event.custom ) then
		print( event.custom.foo )
	end
end
Runtime:addEventListener( "notification", onNotification )

-- The launch arguments provide a notification event if this app was started when the user tapped on a notification
-- In this case, you must call the notification listener manually
if ( launchArgs and launchArgs.notification ) then
	onNotification( launchArgs.notification )
end
``````
