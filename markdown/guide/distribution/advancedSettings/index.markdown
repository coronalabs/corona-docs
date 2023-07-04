# Advanced Build Settings

This guide outlines various advanced build options for Solar2D apps.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

This guide is intended for those who require more specialized configuration options and customized app settings. If you're looking for general/basic build settings and options, please consult the [Project Build Settings][guide.distribution.buildSettings] guide.

</div>
</div>

<div class="guides-toc">

* [Advanced Settings &mdash; iOS](#ios)
* [Advanced Settings &mdash; Android](#android)
* [Plugins &mdash; Supported Platforms](#plugins)
* [Build Control](#buildcontrol)

</div>


<a id="ios"></a>

## Advanced Settings &mdash; iOS

### Device Capabilities

If you wish to limit your iOS app to devices with specific capabilities, you can include the optional `UIRequiredDeviceCapabilities` key within the <nobr>`iphone` &rarr; `plist`</nobr> table. The value of this key should be a table containing specific keys matching Apple's [documentation](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Articles/iPhoneOSKeys.html#//apple_ref/doc/uid/TP40009252-SW3). For&nbsp;example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[7,8,9,10]" }
settings =
{
	iphone =
	{
		plist =
		{
			UIRequiredDeviceCapabilities =
			{
				["gyroscope"] = true,
			},
		},
	},
}
``````

When including a specific key within the `UIRequiredDeviceCapabilities` table, its value is expected to be a boolean with this logic:

* `true` &mdash; Devices __must__ have the associated feature in order to run the app.
* `false` &mdash; Devices must __not__ have the associated feature in order to run the app.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* You should only include a specific key if you absolutely __must__ limit the app's target devices&nbsp;&mdash; if it doesn't matter whether a device supports a certain capability, omit its key.

* Omitting a key's __value__ will yield the same result as setting it to `true`. For instance, the following are equivalent:

<div class="code-indent">

`UIRequiredDeviceCapabilities = { "gyroscope" }`

`UIRequiredDeviceCapabilities = { ["gyroscope"] = true }`

</div>
</div>

### PNG Processing

If you need to circumvent PNG file processing (`pngcrush`) at build time, you can include the `skipPNGCrush` key with a value of `true`. This key should be specified outside of the `plist` table but inside the `iphone` table:

``````{ brush="lua" gutter="false" first-line="1" highlight="[9]" }
settings =
{
	iphone =
	{
		plist =
		{

		},
		skipPNGCrush = true,
	},
}
``````

### Alternate Icon

If you want to include alternate icons with your xassets project, use `alternateIcons` and include array of the icon names. Only available in Solar2D Sim 2023.3692+

``````{ brush="lua" gutter="false" first-line="1" highlight="[9]" }
settings =
{
	iphone =
	{
		plist =
		{

		},
		xcassets = "Images.xcassets",
		alternateIcons = {"Icon1", "Icon2"},
	},
}
``````




<a id="android"></a>

## Advanced Settings &mdash; Android

### Minimum SDK Version

Providing a minimum SDK version with the `minSdkVersion` key value allows you to exclude your app from being installed on devices with older versions of the Android&nbsp;OS. It corresponds to the `minSdkVersion` item detailed [here](https://developer.android.com/guide/topics/manifest/uses-sdk-element.html). This setting is invisible to users.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
settings =
{
	android =
	{
		minSdkVersion = "16",
	},
}
``````

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The minimum SDK version must be specified as an __integer__&nbsp;&mdash; it cannot contain any decimal points.

* Solar2D only allows values as low as `"15"` for Android __4.0.3__ (the&nbsp;oldest version supported by&nbsp;Solar2D). For details on the various Android&nbsp;SDK versions and API levels, see [here](https://developer.android.com/guide/topics/manifest/uses-sdk-element.html#ApiLevels).

* The minimum SDK version defaults to `"15"` if not specified otherwise.

</div>

### Android TV

If you are deploying an app to Android&nbsp;TV, you should include the `supportsTV` key with a value of `true`. This will make the app available to Android&nbsp;TV devices via purchase through Google&nbsp;Play.

In addition, you can set the `isGame` key with a value of `true` to categorize the app under the __games__ section of Google&nbsp;Play. If&nbsp;this key is omitted or set to `false`, the app will be categorized under the __apps__ section.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6]" }
settings =
{
	android =
	{
		supportsTV = true,
		isGame = true,
	},
}
``````

### Screen Support

The optional `supportsScreens` table specifies/limits which screens an Android app supports. See the Android [documentation](https://developer.android.com/guide/topics/manifest/supports-screens-element.html) for detailed descriptions and more options.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9,10,11,12]" }
settings =
{
	android =
	{
		supportsScreens =
		{
			smallScreens  = true,
			normalScreens = true,
			largeScreens  = true,
			xlargeScreens = false,
			requiresSmallestWidthDp = 320,
		},
	},
}
``````

### Disabling File Access

By default, other apps are granted <nobr>read-only</nobr> access to your app's files via an Android `content://` URL. This is required to attach your app's files to <nobr>e-mails</nobr>, post photos via the [social][plugin.CoronaProvider_native_popup_social] plugin, or open your files via the [system.openURL()][api.library.system.openURL] function. If you want to block all access to your app's files, set the following in the `build.settings` file:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
settings =
{
	android =
	{
		allowAppsReadOnlyAccessToFiles = false,
	},
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

You cannot block file access on Android devices which have been rooted. This applies to all Android apps, including those not built with Solar2D. Thus, if your app's files contain any sensitive information, it's recommended that you encrypt this information yourself.

</div>

### Large Heap

You can request that the Android OS provides your app with more heap memory in Java by adding the `largeHeap` key with a value of `true`. For example, it may raise the max heap size on a particular device from 32&nbsp;MB to 256&nbsp;MB. This parameter might be a viable option if your app is triggering <nobr>out-of-memory</nobr> exceptions on <nobr>low-end</nobr> devices.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
settings =
{
	android =
	{
		largeHeap = true,
	},
}
``````

### Android Directives

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This section details additional directives which can be used to <nobr>fine-tune</nobr> the `AndroidManifest.xml` in your application. They are rarely needed and if you don't understand what they do, you can break your application or cause unexpected behavior. Essentially, use of these directives is __not__ recommended unless you're familiar with the concepts involved.

</div>

The following specialized directives are available for <nobr>Solar2D-built</nobr> Android apps:

* `strings` &mdash; This directive enables the creation of a `strings.xml` file in the `.apk`.

<div class="code-indent" style="margin-bottom: 20px;">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9]" }
settings =
{
	android =
	{
		strings =
		{
			permdesc = "Custom permission description",
			permlabel = "custom-permission-Label",
		},
	},
}
``````

</div>

* `permissions` &mdash; This directive enables the creation of custom Android permissions.

<div class="code-indent" style="margin-bottom: 20px;">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9,10,11,12,13,14,15]" }
settings =
{
	android =
	{
		permissions =
		{
			{
				name = ".PERMISSION1",
				description = "@string/permdesc",
				icon = "@mipmap/icon",
				label = "@string/permlabel",
				permissionGroup = "android.permission-group.COST_MONEY",
				protectionLevel = "normal",
			},
		},
	},
}
``````

</div>

* `manifestChildElements` &mdash; This directive adds XML elements to the `manifest` element of `AndroidManifest.xml`.

<div class="code-indent" style="margin-bottom: 20px;">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9,10,11]" }
settings =
{
	android =
	{
		manifestChildElements =
		{
			-- Array of strings
			[[
			<uses-configuration android:reqFiveWayNav="true" />
			]],
		},
	},
}
``````

</div>

* `applicationChildElements` &mdash; This directive adds XML elements to the `application` element of `AndroidManifest.xml`.

<div class="code-indent" style="margin-bottom: 20px;">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9,10,11,12]" }
settings =
{
	android =
	{
		applicationChildElements =
		{
			-- Array of strings
			[[
			<activity android:name="com.example.MyActivity"
				android:configChanges="keyboard|keyboardHidden"/>
			]],
		},
	},
}
``````

</div>

* `apkFiles` &mdash; This directive causes files to be copied from the project directory to the root of the `.apk` file, preserving any directory hierarchy. In the following example, <nobr>`google-play-services.json`</nobr> is copied to the root of the `.apk` and `res/raw/mypage.html` is copied to `res/raw`. The file paths are always relative to the base directory of the project.

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9]" }
settings =
{
	android =
	{
		apkFiles =
		{
			"google-play-services.json",
			"res/raw/mypage.html",
		},
	},
}
``````

</div>

* `coronaActivityFlags` &mdash; This directive allows attributes to be added to the `com.ansca.corona.CoronaActivity` activity definition in the app's `AndroidManifest.xml`. Activity attributes are documented [here](https://developer.android.com/guide/topics/manifest/activity-element.html).

<div class="code-indent">

Solar2D uses the following attributes for its own purposes and they cannot be overridden:

<div class="inner-table">

Attribute
----------------------------- --
`android:configChanges`
`android:label`
`android:launchMode`
`android:name`
`android:screenOrientation`
`android:theme`
----------------------------- --

</div>


``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9]" }
settings =
{
	android =
	{
		coronaActivityFlags =
		{
			resizeableActivity = true,
			persistableMode = "persistRootOnly",
		},
	},
}
``````

</div>




<a id="plugins"></a>

## Plugins &mdash; Supported Platforms

If necessary, you may fine-tune a plugin to be supported only on specific platforms. This is done by including a `supportedPlatforms` table with <nobr>key-value</nobr> pairs <nobr>(value of `true`)</nobr> which indicate the platform(s) that a plugin should be supported on. For&nbsp;example:

``````lua
["plugin.gpgs"] =
{
	publisherId = "com.coronalabs",
	supportedPlatforms = { android=true },
},
``````

Inside this table, the following keys are allowed:

<div class="inner-table">

Key						Platform(s)
----------------------	--------------------------------------
`iphone`				all iOS devices		
`android`				all Android devices
`appletvos`				Apple TV
`macos`					macOS desktop
`win32`					Windows desktop
`["android-kindle"]`	Amazon Kindle
`["iphone-sim"]`		Xcode iOS Simulator
----------------------	--------------------------------------

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Omitting the `supportedPlatforms` table effectively includes the plugin on all platforms that it inherently supports.

</div>

### Forcing Plugin versions

You can set versions to be the same as GitHub tag name for the release for plugin found on [the Solar2D Free Plugins Directory](https://plugins.solar2d.com). For the plugin in example [here are available releases](https://github.com/coronalabs/com.coronalabs-CoronaProvider.native.popup.activity/releases) Note this requires Solar2D 3676+

``````lua
plugins = {
	 ["com.coronalabs-CoronaProvider.native.popup.activity"] = {
				publisherId = "com.coronalabs",
				version = "v3",
	 },
},
``````




<a id="buildcontrol"></a>

## Build Control

Normally, distribution builds of an app (those&nbsp;intended for app&nbsp;stores) have Lua debug info stripped from the compiled code, while development builds are not stripped. Generally, stripping debug symbols is preferred for distribution because it reduces app size and provides a small performance gain, but this entirely depends on the type of app and how you prefer to do error reporting.

In iOS, distribution builds are made by using a provisioning profile whose name contains __iPhone&nbsp;Distribution:__ and on Android they are made by using a keystore with any name except __Debug__.

Sometimes it can be useful to have debug symbols available in distribution builds of your app. This means that you get more detail in stack traces and runtime error messages. Depending on your needs, the `neverStripDebugInfo` setting can be used to turn off debug symbol stripping altogether. In theory, there's no reason why an app built with this setting could not be submitted to an app store, but policies vary and there are no guarantees&nbsp;&mdash; just be aware that the debug info may reveal details of your app that you may prefer remain proprietary.

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6]" }
settings =
{
	build =
	{
		neverStripDebugInfo = true,
	},
}
``````
