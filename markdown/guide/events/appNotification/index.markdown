# Local/Push Notifications

This guide discusses how to implement __local__ and __push__ notifications.

<div class="guides-toc">

* [Overview](#overview)
* [Usage Notes](#usage)
* [App Interaction](#interact)
* [Project Settings](#settings)
* [iOS Setup](#ios-setup)
* [Android Setup](#android-setup)
* [Scheduling Local Notifications](#localnot)
* [Handling Notification Events](#events)
* [Remote Registration (iOS)](#remotereg)

</div>


<a id="overview"></a>

## Overview

CORONA_CORE_PRODUCT supports two types of notifications: __local__ and __push__. The purpose of both notification types is to notify the user about something — a&nbsp;message or an upcoming appointment, for example — when the application isn't running in the foreground. The essential difference between local notifications and push notifications is simple:

* __Local notifications__ are scheduled by an app locally and are delivered by the same device.

* __Push notifications__ are sent by a remote server (its&nbsp;provider) which sends these notifications to devices on which the app is installed.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Notifications are only supported on iOS and Android, __not__ on macOS desktop, Windows desktop, Apple&nbsp;TV, or Android&nbsp;TV.

</div>
</div>




<a id="usage"></a>

## Usage Notes

To use __push__ notifications, remember the following points:

* The app has to support a registration process and it must support incoming messages.

* You must configure your app and devices so that Apple and/or Google recognizes them.

* If using iOS/Apple, your app cannot send push requests directly to their servers.

* We recommend that you use a third-party service to send push requests to Apple or Google, who in turn sends them onward to devices. That service can be a company like [OneSignal](https://github.com/OneSignal/OneSignal-Solar2D-SDK), [PushWoosh](http://www.pushwoosh.com), or [Urban Airship](http://urbanairship.com) that specializes in push notifications.




<a id="interact"></a>

## App Interaction

How an app reacts to notifications depends on its state:

* __Not running__ — the app has exited by design, user decision, reboot, etc. In this state, if the user interacts with the notification, the operating system will launch the app. Information about the notification event will be passed to the app using "launch&nbsp;arguments". The app should watch for these and react accordingly, for example, show a "snooze" button for an alarm or open a [native.newWebView()][api.library.native.newWebView] if it has a URL. Note, however, that if the user starts the app by tapping directly on its icon, the notification will __not__ be presented.

* __Backgrounded__ — the app is running but it's not the active app. In this state, if the user interacts with the notification by swiping on the unlock screen while the notification is showing or tapping on it in the notification center, the operating system will bring the app to the foreground and make it active. At this time, the app will receive the notification event but __not__ receive launch arguments.

* __Foregrounded__ — the app is active and the user is currently interacting with it. In this state, the app will receive the notification event.




<a id="settings"></a>

## Project Settings

To use the [Notifications][plugin.notifications-v2] plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.notifications.v2"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````
Inside this `build.settings` file, also include the `minSdkVersion` of 16 or higher. For more info about setting minimum SDK version, [see this](https://docs.coronalabs.com/guide/distribution/advancedSettings/index.html)

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
    android =
    {
        minSdkVersion = "16",
    },
}
``````




Then, within the code module which uses notifications functions, simply `require()` the library as follows:

``````lua
local notifications = require( "plugin.notifications.v2" )
``````



<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* For Android, all __new__ apps, or existing apps being updated with push notifications for the first time, must use [Firebase Cloud Messaging (FCM)](https://firebase.google.com/), supported by the current [Notifications][plugin.notifications-v2] plugin (above). If you have a legacy app already configured for Google Cloud Messaging (GCM), it will continue to work indefinitely, but you should continue using the [legacy][plugin.notifications] plugin instead of the current notifications plugin.

* For iOS, you can either use the Apple Push Notification Service (APNS) or Firebase Cloud Messaging (FCM) for push notifications (see&nbsp;below).

</div>




<a id="ios-setup"></a>

## iOS Setup

Much of the iOS configuration for __push__ notifications is done within the [Apple Developer](https://developer.apple.com/) portal. In addition, you must specify what __types__ of notifications your app will use within the <nobr>`notification` &rarr; `iphone` &rarr; `types`</nobr> table of `config.lua`:

``````{ brush="lua" gutter="false" first-line="1" highlight="[9,10,11]" }
application =
{
	notification =
	{
		iphone = 
		{
			types = 
			{
				"badge",
				"sound",
				"alert"
			},
		},
	},
}
``````

### Firebase 

If you want to use [Google Firebase Cloud Messaging (FCM)](https://firebase.google.com) for push notifications, follow these additional steps:

1. Copy `GoogleService-Info.plist`, provided in the Firebase console, to your project's root directory alongside `main.lua`.

2. Add the following entries to the <nobr>`iphone` &rarr; `plist`</nobr> table of `build.settings`:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[7,8]" }
settings =
{
	iphone =
	{
		plist =
		{
			UIBackgroundModes = { "remote-notification" },
			FirebaseAppDelegateProxyEnabled = false,
		},
	},
}
``````

</div>




<a id="android-setup"></a>

## Android Setup

Android also requires some additional configuration for __push__ notifications:

1. Copy `google-services.json`, provided in the Firebase console, to your project's root directory alongside `main.lua`.

2. Add an additional `useGoogleServicesJson` entry into the `android` table of `build.settings`. When added, the build server will read the settings from the JSON file and integrate them into your app during the build phase.

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
settings =
{
	android =
	{
		useGoogleServicesJson = true,
	},
}
``````

</div>

<a id="androidicons"></a>

### Android Icons

You can set custom notification icons in a project by adding the following files to the root of the project directory, just like custom application icons. Please see [Google's official documentation](https://developer.android.com/guide/practices/ui_guidelines/icon_design_status_bar.html) for further details.

<div class="inner-table">

File												Size (w&times;h)
--------------------------------------------------	------------------
`IconNotificationDefault-ldpi.png`					18 &times; 18
`IconNotificationDefault-mdpi.png`					24 &times; 24
`IconNotificationDefault-hdpi.png`					36 &times; 36
`IconNotificationDefault-xhdpi.png`					48 &times; 48
`IconNotificationDefault-xxhdpi.png`				72 &times; 72
`IconNotificationDefault-xxxhdpi.png`				96 &times; 96
--------------------------------------------------	------------------

</div>




<a id="localnot"></a>

## Scheduling Local Notifications

To schedule a __local__ notification, use the [notifications.scheduleNotification()][plugin.notifications-v2.scheduleNotification] function and specify the __time__ of the future event in one of two formats:

1. Number of seconds from the call time when the notification should be delivered.

2. Time specified in Coordinated Universal Time (UTC). This should be a time table as returned by `os.date("!*t")`. Note that a common pitfall is to forget the exclamation point and pass `"*t"` instead <nobr>of `"!*t"` &mdash;</nobr> this will return the time structure in local time (your&nbsp;time&nbsp;zone) instead of UTC.

You should also pass an `options` table containing any of the following parameters:

* `alert` \([string][api.type.String]\) &mdash; The notification message to be displayed to the user. If the application is not currently running, a system alert will display this message.

* `badge` \([number][api.type.Number]\) &mdash; This option is only supported on iOS and it indicates the badge number to be displayed on the application icon when the scheduled notification triggers. This replaces the last badge number that was applied. Set to `0` to omit the badge number.

* `sound` \([string][api.type.String]\) &mdash; Name of the sound file in the [system.ResourceDirectory][api.library.system.ResourceDirectory] to be played when the scheduled notification triggers. This sound is only played if the app is __not__ currently in the foreground. On iOS, there are limitations on the kinds of sound that can be played (consult&nbsp;Apple's [documentation](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/SupportingNotificationsinYourApp.html) for more&nbsp;details).

* `custom` \([table][api.type.Table]\) &mdash; A table that will be delivered with the notification event. This allows you to pass custom information with the notification.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

To cancel a local notification before it triggers, use the [notifications.cancelNotification()][plugin.notifications-v2.cancelNotification] function and pass the ID returned by [notifications.scheduleNotification()][plugin.notifications-v2.scheduleNotification].

</div>
</div>




<a id="events"></a>

## Handling Notification Events

In accordance with the CORONA_CORE_PRODUCT event/listener model, if your app is running in either the foreground or background and a notification arrives, you'll receive a [notification][api.event.notification] event. It's your responsibility to initialize the system and set up a listener function to handle these events. Please review the following framework and then read the detailed subsections below.

``````lua
local function notificationListener( event )

	if ( event.type == "remote" ) then
		-- Handle the push notification

	elseif ( event.type == "local" ) then
		-- Handle the local notification

	end
end

Runtime:addEventListener( "notification", notificationListener )
``````

### Notification Data

A [notification][api.event.notification] event returns a table of information which you can use to manage the specific notification. This table includes the following:

* [event.alert][api.event.notification.alert] &mdash; This [string][api.type.String] value consists of the message displayed.
* [event.applicationState][api.event.notification.applicationState] &mdash; A [string][api.type.String] value of either `"active"` or `"inactive"`.
* [event.badge][api.event.notification.badge] &mdash; A [number][api.type.Number] representing the badge count (iOS&nbsp;only).
* [event.custom][api.event.notification.custom] &mdash; If this [table][api.type.Table] exists, there may be data from the push service that helps your app react to the data.  This is known as __deep&nbsp;linking__.
* [event.name][api.event.notification.name] &mdash; A [string][api.type.String] value of `"notification"`.
* [event.sound][api.event.notification.sound] &mdash; A [string][api.type.String] value representing a sound file, for example `"alarm.caf"`.
* [event.type][api.event.notification.type] &mdash; A [string][api.type.String] value of `"local"` for local notifications or `"remote"` for push notifications.

### Launch Arguments

When the operating system, as the result of an incoming notification, starts your app from an inactive (not&nbsp;running) state, the app receives the data as part of `launchArgs` instead of triggering a notification event. You can use your `notificationListener` function to process the launch arguments.

``````lua
local launchArgs = ...

if ( launchArgs and launchArgs.notification ) then
	notificationListener( launchArgs.notification )
end
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This `launchArgs` processing must be in `main.lua` since it's the code which receives the data.

</div>

### Notification Badges (iOS)

Notification badges on iOS are easily recognized by a small circle/number overlaying the app icon. If a notification passes a `badge` value, a badge equal to that value will appear over the app icon.

It's your responsibility to read and set the badge number depending on its previous value. This is accomplished with the [native.getProperty()][api.library.native.getProperty] and [native.setProperty()][api.library.native.setProperty] functions. In almost every case, when the user opens/handles the notification, you should decrement the badge number by 1 as follows:

``````lua
-- Decrement the badge number by 1
local function notificationListener( event )

	if ( event.type == "local" ) then
		-- Handle the local notification
		local badgeNum = native.getProperty( "applicationIconBadgeNumber" )
		if ( badgeNum > 0 ) then
			badgeNum = badgeNum - 1
			native.setProperty( "applicationIconBadgeNumber", badgeNum )
		end

	elseif ( event.type == "remote" ) then
		-- Handle the push notification
		if ( event.badge and event.badge > 0 ) then
			native.setProperty( "applicationIconBadgeNumber", event.badge - 1 )
		end
	end
end
``````

Alternatively, you can clear the badge entirely:

``````lua
native.setProperty( "applicationIconBadgeNumber", 0 )
``````

### Notification Sounds

By default, the device will play a sound when a notification comes in. You can specify a custom sound file in your project to play instead of the default sound. For instance, if you have the file `notification.wav` inside your app bundle, you can specify the string `"notification.wav"` as part of the push bundle (if&nbsp;the sending service supports&nbsp;it) and the operating system will play that custom sound instead of the default. In this case, the `event.sound` entry in the event listener will equal this string.




<a id="remotereg"></a>

## Remote Registration (iOS)

On iOS, when you're ready to ask the user for permission to allow __push__ notifications, you should call [notifications.registerForPushNotifications()][plugin.notifications-v2.registerForPushNotifications]. This will show the popup which asks the user if they want to enable push notifications. It's recommended that you only ask for this permission when you need it and not at the startup of your app.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you're using [Google Firebase Cloud Messaging (FCM)](https://firebase.google.com/) for push notifications, you should pass an additional parameter to [notifications.registerForPushNotifications()][plugin.notifications-v2.registerForPushNotifications]. This parameter should be a [table][api.type.Table] containing the `useFCM` key with a value of `true`:

``````lua
notifications.registerForPushNotifications( { useFCM=true } )
``````

</div>

Calling [notifications.registerForPushNotifications()][plugin.notifications-v2.registerForPushNotifications] will trigger a remote registration event to your notification listener function. To accommodate this, add an additional condition:

``````{ brush="lua" gutter="false" first-line="1" highlight="[6,7]" }
local function notificationListener( event )

	if ( event.type == "remote" ) then
		-- Handle the push notification

	elseif ( event.type == "remoteRegistration" ) then
		-- Code to register your device with the service

	elseif ( event.type == "local" ) then
		-- Handle the local notification

	end
end
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

The code required to register your device varies depending on the service. Please consult your preferred provider's documentation or seek assistance in the [forums](https://forums.solar2d.com/) or [Discord](https://discord.gg/Abf5V9G).

</div>
</div>
