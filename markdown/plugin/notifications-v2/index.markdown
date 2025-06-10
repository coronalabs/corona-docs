# Notifications (local and Firebase)

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Library][api.type.Library]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			notification, notifications
> __Platforms__			Android, iOS
> __See also__			[Local/Push Notifications][guide.events.appNotification] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This plugin provides access to local notifications and [Firebase](https://firebase.google.com) push notifications.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

For Android, all __new__ apps, or existing apps being updated with push notifications for the first time, must use <nobr>[Firebase](https://firebase.google.com/) Cloud Messaging (FCM)</nobr>, supported by this plugin. If you have a legacy app already configured for <nobr>Google Cloud Messaging (GCM)</nobr>, it will continue to work indefinitely, but you should continue using the [legacy][plugin.notifications] plugin instead of this plugin.

</div>


<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

To use Firebase notifications on iOS make sure to include `plugin.notifications.v2.firebase` plugin in your `build.settings`. This plugin is identical to the `plugin.notifications.v2` and also includes libraries required to operate notification through Firebase on iOS. Note you that to use Firebase for iOS you need to configure your Firebase project with the necessary Apple Push Notfication Auth or Keys, [Read More Here](https://firebase.google.com/docs/cloud-messaging/ios/client#upload_your_apns_authentication_key). 

</div>




## Syntax

	local notifications = require( "plugin.notifications.v2" )


## Functions

#### [notifications.subscribe()][plugin.notifications-v2.subscribe]

#### [notifications.unsubscribe()][plugin.notifications-v2.unsubscribe]

#### [notifications.scheduleNotification()][plugin.notifications-v2.scheduleNotification]

#### [notifications.cancelNotification()][plugin.notifications-v2.cancelNotification]

#### [notifications.getDeviceToken()][plugin.notifications-v2.getDeviceToken]

#### [notifications.registerForPushNotifications()][plugin.notifications-v2.registerForPushNotifications]

#### [notifications.areNotificationsEnabled()][plugin.notifications-v2.areNotificationsEnabled]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

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

Or use `plugin.notifications.v2.firebase` if you plan to use Firebase on iOS.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.notifications.v2.firebase"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

### iOS

If your app is for iOS, you must specify what __types__ of notifications your app will use within the <nobr>`notification` &rarr; `iphone` &rarr; `types`</nobr> table of `config.lua`:

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

Additionally, if you want to use Google <nobr>[Firebase](https://firebase.google.com) Cloud Messaging (FCM)</nobr> for push notifications, follow these steps:

1. Copy `GoogleService-Info.plist`, provided in the Firebase console, to your Corona project's root directory alongside `main.lua`.

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

### Android

If your app is for Android, you must follow these additional steps to ensure that Firebase notifications function properly:

1. Copy <nobr>`google-services.json`</nobr>, provided in the Firebase console, to your Corona project's root directory alongside `main.lua`.

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


## CORONA_NATIVE_PRODUCT

### iOS

If you're using CORONA_NATIVE_PRODUCT for iOS, you'll need to add a reference to the `CoronaNotificationsDelegate` in your `Info.plist` as follows:

1. Add an entry to your `Info.plist` called `"CoronaDelegates"` and make it of type `Array`.

2. Add an entry to the `CoronaDelegates` array and call it `"CoronaNotificationsDelegate"`. Ensure this is of type `String`.

### Android

When developing natively for Android, Google wants all icons in the project's `res` directory. This is important because Google's Android build process generates code, creating a `R.java` file containing unique integer IDs to every resource that your project and its libraries contain. The IDs are needed to access these resources, including the notification icons.

When developing with CORONA_NATIVE_PRODUCT, you must override Corona's notification icon resources as follows:

1. First, you should become familiar with how Android handles resources by reading Google's official [documentation](http://developer.android.com/guide/topics/resources/overview.html).

2. Inspect the Corona library's resource directory (`./Native/Corona/android/lib/Corona/res/`). In this directory, every `drawable` directory contains a file named `corona_statusbar_icon_default.png`. This is the image file to override. Note that this action should be an "override" and __not__ a replacement&nbsp;&mdash; you should __not__ modify the contents of the Corona library directory!

3. To override these notification image files with your own, you need to set up the Android project with the same `drawable` directories under your `res` directory. Add each `IconNotification*.png` icon to its respective `drawable` directory by resolution and version <nobr>(see [here][guide.events.appNotification#android-icons])</nobr>. You also __must__ rename these files to `corona_statusbar_icon_default.png`.

4. Make a small change to the `copyCoronaResources` task of <nobr>`build.gradle` (`Module: app`)</nobr> to ignore the notification icons provided in the Corona library project. Do this by replacing the <nobr>`from fileTree(...)`</nobr> line with the following:

<div class="code-indent">

``````
from fileTree(dir: "$coronaEnterpriseAndroidLibDir/res", exclude: '**/corona_statusbar_icon_default.png')
``````

</div>
