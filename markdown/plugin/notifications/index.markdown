# notifications.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Library][api.type.Library]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			notification, notifications
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Gives access to local and push notifications.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

This documentation outlines the legacy notifications plugin, primarily intended for Android apps which have been configured for <nobr>Google Cloud Messaging (GCM)</nobr>. If you are creating a __new__ Android app or updating an existing Android app with push notifications for the first time, you must use <nobr>[Firebase](https://firebase.google.com/) Cloud Messaging (FCM)</nobr>, supported by the current [Notifications][plugin.notifications-v2] plugin.

For new iOS apps, or existing iOS apps being updated with notifications for the first time, you should also implement the current [Notifications][plugin.notifications-v2] plugin.

</div>
</div>


## Syntax

	local notifications = require( "plugin.notifications" )


## Functions

#### [notifications.registerForPushNotifications()][plugin.notifications.registerForPushNotifications]

#### [notifications.cancelNotification()][plugin.notifications.cancelNotification]

#### [notifications.scheduleNotification()][plugin.notifications.scheduleNotification]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.notifications"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

### Android

If your app is for Android and you intend to use GCM __push__ notifications, you will also need to include the following plugin. However, if you only intend to use __local__ notifications, this plugin should be omitted.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9]" }
settings =
{
	plugins =
	{
		["shared.google.play.services.gcm"] =
		{
			publisherId = "com.coronalabs",
			supportedPlatforms = { android=true }
		},
	},
}
``````

Additionally, add a `notification` table to your `config.lua` file as follows. When you registered with the GCM service, you should have received the `projectNumber` value needed for the `google` table.

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6,7,8,9]" }
application =
{
	notification =
	{
		google =
		{
			projectNumber = "YOUR_PROJECT_NUMBER"
		},
	}
}
``````


## CORONA_NATIVE_PRODUCT

If you're using CORONA_NATIVE_PRODUCT for iOS, you'll need to add a reference to the `CoronaNotificationsDelegate` in your `Info.plist` as follows:

1. Add an entry to your `Info.plist` called `CoronaDelegates` and make it of type `Array`.

2. Add an entry to the `CoronaDelegates` array and call it `CoronaNotificationsDelegate`. Ensure this is of type `String`.
