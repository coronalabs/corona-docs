# Project Build Settings

Build-time properties for an app are defined using a optional `build.settings` file written in Lua syntax. It should be placed in the project's base directory.

<div class="guides-toc">

* [Basic Structure](#basicstruct)
* [App Orientation](#orientation)
* [iOS Build Settings](#iOSsettings)
* [Android Build Settings](#androidsettings)
* [Desktop Build Settings](#desktopsettings)
* [Plugins](#plugins)
* [Custom App Icons](#appicons)
* [Splash/Launch Screen](#launchimage)
* [Excluding Files](#excludingfiles)

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This guide outlines the most common build settings for apps across the various platforms that Corona supports. For those developers who require more advanced settings, please consult the [Advanced Build Settings][guide.distribution.advancedSettings] guide for which options are available.

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* For CORONA_NATIVE_PRODUCT builds on iOS, only the `orientation` \([details](#orientation)\) and <nobr>`iphone` &rarr; `plist`</nobr> settings \([details](#iOSsettings)\) are respected.

* For CORONA_NATIVE_PRODUCT builds on Android, the `build.settings` file is ignored entirely.

</div>




<a id="basicstruct"></a>

## Basic Structure

At the minimum, the `build.settings` file should contain a `settings` table which will contain various child tables to dictate <nobr>build-time</nobr> options.

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,2,3,4]" }
settings =
{
	-- Child tables here
}
``````




<a id="orientation"></a>

## App Orientation

The `build.settings` file can be used to set app orientation in relation to the device's physical orientation in space&nbsp;&mdash; this includes <nobr>auto-orientation</nobr> triggered by the accelerometer if the device is rotated or flipped during runtime.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Please note that there are three different things which are subject to orientation:

1. The splash screen (see [Splash Screen](#launchimage) below).
2. Native UI elements such as alerts and the visual keyboard.
3. The Corona display stage itself.

</div>

All orientation settings must be contained in the `orientation` table within `settings`:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6]" }
settings =
{
	orientation =
	{
		-- Parameters
	},
}
``````

Within the `orientation` table, there are two optional key values: `default` and `supported`:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6]" }
settings =
{
	orientation =
	{
		default = "",    -- Initial launch orientation
		supported = {},  -- Table of allowed options for auto-orientation
	},
}
``````

Each of these accepts the following __orientation&nbsp;conventions__:

<div class="inner-table">

Name						Orientation
--------------------------	----------------------------------------------------------------------
`"portrait"`				Device in the vertical position with the home button at the bottom
`"portraitUpsideDown"`		Device in the vertical position with the home button at the top
`"landscapeLeft"`			Device in the horizontal position with the home button at the left
`"landscapeRight"`			Device in the horizontal position with the home button at the right
--------------------------	----------------------------------------------------------------------

</div>

### Auto-Orientation

On most devices, __auto-orientation__ is triggered by the accelerometer if the device is rotated or flipped during runtime. If you want to limit an app to either landscape orientation, specify both `"landscapeLeft"` and `"landscapeRight"` in the `supported` table.

``````lua
supported = { "landscapeLeft", "landscapeRight" },
``````

Similarly, to limit an app to either portrait orientation, specify both `"portrait"` and `"portraitUpsideDown"`:

``````lua
supported = { "portrait", "portraitUpsideDown" },
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp title-nomargin">Important</div>

1. When the device orientation changes, the __coordinate&nbsp;position__ `(0,0)` on the Corona display stage will correspond to the top-left corner of the current orientation.

2. The __iPad__ ignores the `default` setting and attempts to launch in the current physical orientation of the device, assuming that orientation is specified in the supported list.

3. If you ever need to detect the current device orientation, it can be read from the [system.orientation][api.library.system.orientation] property. This will provide a value from the four standard conventions listed above. In addition, iOS devices may report either the `"faceUp"` or `"faceDown"` orientation.

</div>




<a id="iOSsettings"></a>

## iOS Build Settings

Within the `settings` table, you can include a `plist` table nested within an `iphone` table. This `plist` table is used to set values for the compiled app's `Info.plist` file.

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6,7,8,9,10,11,12,13]" }
settings =
{
	iphone =
	{
		plist =
		{
			CFBundleIconFiles = {},  -- Required!
			UILaunchStoryboardName = "LaunchScreen",  -- Required!
			UIStatusBarHidden = true,
			CFBundleDisplayName = "Corona App",
			CFBundleName = "Corona App",
		},
	},
}
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* The `iphone` table encompasses __all__ iOS devices, not just iPhone devices.

* For boolean values in `plist` keys, use <nobr>Lua-style</nobr> booleans <nobr>(`true` or `false` )</nobr> rather than <nobr>Objective-C</nobr> booleans <nobr>(`YES` or `NO`)</nobr>.

</div>

In the example above, a few common `plist` keys are shown:

* `CFBundleIconFiles` ([table][api.type.Table]) &mdash; a __required__ table of app icon image files to associate with the app. See [Custom App Icons](#appicons) below for details.

* `UILaunchStoryboardName` &mdash; a __required__ string pointing to a valid `.storyboardc` file. See [iOS Launch Screen](#ios-launch) below for important details.

* `UIStatusBarHidden` ([boolean][api.type.Boolean]) &mdash; specifies if the status bar should initially be hidden when the app launches.

* `CFBundleDisplayName` ([string][api.type.String]) &mdash; the display name of the bundle. If you do __not__ need to localize the app and the bundle name contains only ASCII characters, omit this key and specify the bundle name as __Application&nbsp;Name__ in the Simulator __Build&nbsp;for&nbsp;iOS__ window. If you localize the app ([guide][guide.distribution.localization]), include this key in both the `plist` table and in the `InfoPlist.strings` files of your language <nobr>sub-directories</nobr> alongside the localized `CFBundleName` keys.

* `CFBundleName` ([string][api.type.String]) &mdash; a short app name of 16 characters or less. If the bundle name contains only ASCII characters, omit this key and specify the bundle name as __Application&nbsp;Name__ in the Simulator __Build&nbsp;for&nbsp;iOS__ window. If you localize the app ([guide][guide.distribution.localization]), this key should be included in the `plist` table and also alongside `CFBundleDisplayName` in the `InfoPlist.strings` files of your language <nobr>sub-directories</nobr>. If you do __not__ localize the app, you may include this `CFBundleName` key in the `plist` table, but do not include the `CFBundleDisplayName` key.

Please see Apple's [documentation](https://developer.apple.com/library/content/documentation/General/Reference/InfoPlistKeyReference/Introduction/Introduction.html) for more information on supported values and what you can do with them.

<a id="permissions-ios"></a>

### Permissions

On iOS, when accessing certain hardware or <nobr>OS-level</nobr> functionality, you must notify the user why you're doing so. This is accomplished by including specific keys/descriptions in the `plist` table of `build.settings`. For&nbsp;example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[7,8]" }
settings =
{
	iphone =
	{
		plist =
		{
			NSCameraUsageDescription = "This app would like to access the camera.",
			NSPhotoLibraryUsageDescription = "This app would like to access the photo library.",
			NSPhotoLibraryAddUsageDescription = "This app would like to add the photo library.",
		},
	},
}
``````

When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that the descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

In Corona, the following APIs are affected by iOS permissions, so you should include the permission key(s) noted in the associated API documentation if you're using any of these commands:

* [display.capture()][api.library.display.capture] when `saveToPhotoLibrary` is `true`
* [display.captureBounds()][api.library.display.captureBounds] when `saveToPhotoLibrary` is `true`
* [display.captureScreen()][api.library.display.captureScreen] when `saveToPhotoLibrary` is `true`
* [object:addEventListener()][api.type.EventDispatcher.addEventListener] with an `eventName` of `"accelerometer"`
* [system:setAccelerometerInterval()][api.library.system.setAccelerometerInterval]
* [native.newMapView()][api.library.native.newMapView]
* [media.newRecording()][api.library.media.newRecording]
* [media.capturePhoto()][api.library.media.capturePhoto]
* [media.captureVideo()][api.library.media.captureVideo]
* [media.selectPhoto()][api.library.media.selectPhoto]
* [media.selectVideo()][api.library.media.selectVideo]

</div>

### Advanced Build Settings

In addition to the iOS settings mentioned above, the following build options are available as outlined in the [Advanced Build Settings][guide.distribution.advancedSettings] guide:

<div class="inner-table">

Setting/Feature																					Purpose
----------------------------------------------------------------------------------------------	--------------------------------------
[Device Capabilities][guide.distribution.advancedSettings#device-capabilities]					Used to restrict your app to installation on devices with specific capabilities.
[PNG Processing][guide.distribution.advancedSettings#png-processing]							Used to circumvent PNG file processing (`pngcrush`) at build time.
----------------------------------------------------------------------------------------------	--------------------------------------

</div>




<a id="androidsettings"></a>

## Android Build Settings

Within the `settings` table, you can include an `android` table to control build settings for Android devices.

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6]" }
settings =
{
	android =
	{

	},
}
``````

### Version Code

You can override the __version&nbsp;code__ entered into the Corona&nbsp;Simulator __Build&nbsp;for&nbsp;Android__ box with an optional `versionCode` <nobr>key-value</nobr> pair in the `build.settings` file. This is an internal number used to distinguish application releases for the Android app store, corresponding to the `versionCode` item detailed [here](http://developer.android.com/guide/topics/manifest/manifest-element.html). This setting is invisible to users.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
settings
{
	android =
	{
		versionCode = "11",
	},
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The version code must be specified as an __integer__ &mdash; it cannot contain any decimal points. One possible scheme is to set `versionCode` to `"10"` for version __1.0__. The next update would be `"11"` for version __1.1__, and so forth.

</div>

<a id="permissions-android"></a>

### Permissions

The `usesPermissions` table creates <nobr>`<uses-permission>`</nobr> tags in the `AndroidManifest.xml` file:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9,10,11]" }
settings
{
	android =
	{
		usesPermissions =
		{
			"android.permission.INTERNET",
			"android.permission.WRITE_EXTERNAL_STORAGE",
			"android.permission.ACCESS_FINE_LOCATION",
			"android.permission.ACCESS_COARSE_LOCATION",
		},
	},
}
``````

In the example above, a few useful `android.permission` keys are exhibited:

* `"android.permission.INTERNET"` &mdash; permits a Corona app to access the Internet.
* `"android.permission.WRITE_EXTERNAL_STORAGE"` &mdash; allows `media.save()` and camera support.
* `"android.permission.ACCESS_FINE_LOCATION"` &mdash; allows access to GPS.
* `"android.permission.ACCESS_COARSE_LOCATION"` &mdash; allows getting the location from WiFi/cellular.

See the Android [documentation](http://developer.android.com/reference/android/Manifest.permission.html) for more information on supported values and what you can do with them.

### App Features

The `usesFeatures` table creates <nobr>`<uses-feature>`</nobr> tags in the `AndroidManifest.xml` file. These parameters tell the Android app store which hardware/software capabilities the app does or doesn't require. See the Android [features reference](http://developer.android.com/guide/topics/manifest/uses-feature-element.html#features-reference) for a list of supported values.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9,10]" }
settings
{
	android =
	{
		usesFeatures =
		{
			{ name="android.hardware.camera", required=true },
			{ name="android.hardware.location", required=false },
			{ name="android.hardware.location.gps", required=false },
		},
	},
}
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you __require__ a feature (`required=true`), devices lacking the feature will not be able to download or purchase the app. As a precaution, if your app uses the feature for some aspects but does not require it for "basic&nbsp;functionality," you should include the feature within the `usesFeatures` table but set its `required` key to `false`:

`{ name="android.hardware.camera", required=false },`

</div>

### Expansion Files

The `usesExpansionFile` boolean indicates if the app should be built with expansion files. If it's set to `true` and the build target is Google&nbsp;Play, everything in the project directory except the Lua scripts are put into the expansion file. See the Android [documentation](http://developer.android.com/google/play/expansion-files.html) for more information.

``````{ brush="lua" gutter="false" first-line="1" highlight="[6,11,12,13]" }
settings =
{
	android =
	{
		-- This tells the Corona Simulator to create an expansion file
		usesExpansionFile = true,

		-- The following permissions are required to download expansion files
		usesPermissions =
		{
			"android.permission.INTERNET",
			"com.android.vending.CHECK_LICENSE",
			"android.permission.WRITE_EXTERNAL_STORAGE",
		},
	},
}
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Using expansion files requires setup of Google licensing. Please see [here][guide.basics.configSettings#app-licensing] for details.

</div>
</div>

### Advanced Build Settings

In addition to the Android settings mentioned above, the following build options are available as outlined in the [Advanced Build Settings][guide.distribution.advancedSettings] guide:

<div class="inner-table">

Setting/Feature																					Purpose
----------------------------------------------------------------------------------------------	--------------------------------------
[Minimum SDK Version][guide.distribution.advancedSettings#minimum-sdk-version]					Allows you to exclude your app from being installed on devices with older versions of Android.
[Android TV][guide.distribution.advancedSettings#android-tv]									Required if you are deploying an app to Android&nbsp;TV.
[Screen Support][guide.distribution.advancedSettings#screen-support]							Specifies/limits which screens an Android app supports.
[Disabling File Access][guide.distribution.advancedSettings#disabling-file-access]				Used to block all access to your app's files.
[Large Heap][guide.distribution.advancedSettings#large-heap]									Requests that the Android&nbsp;OS provides your app with more heap memory.
[Android Directives][guide.distribution.advancedSettings#android-directives]					Used to <nobr>fine-tune</nobr> the `AndroidManifest.xml` in your application.
----------------------------------------------------------------------------------------------	--------------------------------------

</div>




<a id="desktopsettings"></a>

## Desktop Build Settings

For macOS desktop or Win32 desktop apps, the Corona `build.settings` file supports a `window` table for customizing the app's desktop window:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6]" }
settings =
{
	window =
	{

	},
}
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Please see the example within [Creating macOS Desktop Apps][guide.distribution.macOSBuild] or [Creating Win32 Desktop Apps][guide.distribution.win32Build] for details and a complete list of acceptable `window` parameters.

</div>
</div>




<a id="plugins"></a>

## Plugins

Corona offers several [plugins][plugin] which can be used in your projects. These plugins can be included via the `plugins` table nested within the `settings` table:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6]" }
settings =
{
	plugins =
	{

	}, 
}
``````

For example, the [Google Play Games Services][plugin.gpgs] plugin may be included as follows:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.gpgs"] =
		{
			publisherId = "com.coronalabs"
		},
	}, 
}
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Plugin key names often include punctuation, for example `plugin.gpgs`. In these cases, you must use the "brackets&nbsp;and&nbsp;quotes" method of defining the key (`["plugin.gpgs"]`).

</div>




<a id="appicons"></a>

## Custom App Icons

Before deploying an app, you should design the proper __app&nbsp;icons__ for the targeted platforms.

### iOS

For iOS, several icon files are required. Please see the [Managing Xcode Assets][guide.distribution.xcAssets] guide for a reference on the `Images.xcassets` folder and how to include/reference it within your app.

### Android

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Google has changed how Android icons are managed with Android 8 and later, using Adaptive Icons. Starting with Corona Daily Build 2019.3504 and later, icons are now handled using the `AndroidResources` folder. See our guide on [Adaptive Icons][guide.distribution.androidResources] for more information.

</div>

For Android, icon files will be copied into the `.apk` during the build, assuming they are available in your root project folder <nobr>(alongside `main.lua`)</nobr>. These icons should adhere to the standard Android icon names and sizes listed below. For detailed information on creating icons, please refer to the [Android Icon Design Guidelines](https://developer.android.com/guide/practices/ui_guidelines/icon_design.html).

<div class="inner-table">

File						Size (w&times;h)
--------------------------	--------------------------
`Icon-xxxhdpi.png`			192 &times; 192
`Icon-xxhdpi.png`			144 &times; 144
`Icon-xhdpi.png`			96 &times; 96
`Icon-hdpi.png`				72 &times; 72
`Icon-mdpi.png`				48 &times; 48
`Icon-ldpi.png`				36 &times; 36
--------------------------	--------------------------

</div>

### Desktop

Desktop apps&nbsp;&mdash; applications built for macOS or Windows&nbsp;&mdash; require additional icons as follows:

* For macOS desktop apps, you must add a <nobr>`Icon-osx.icns`</nobr> file to your project folder before performing a macOS build via the Corona&nbsp;Simulator. This file should contain multiple images at different resolutions, bundled into a single `.icns` file \([details](https://en.wikipedia.org/wiki/Apple_Icon_Image_format)\). See the [Creating macOS Desktop Apps][guide.distribution.macOSBuild] guide for more information.

* For Windows desktop apps, you must add a <nobr>`Icon-win32.ico`</nobr> file to your project folder before performing a Win32 build via the Corona&nbsp;Simulator. This file should contain multiple images at different resolutions, bundled into a single `.ico` file \([details](https://en.wikipedia.org/wiki/ICO_(file_format))\). See the [Creating Win32 Desktop Apps][guide.distribution.win32Build] guide for more information.

### tvOS / Android TV

Apps designed for TV systems require additional icons:

* For Apple's&nbsp;tvOS, several unique icons and assets are required. Please see the [Managing Xcode Assets][guide.distribution.xcAssets] guide for a reference on the `Images.xcassets` folder and how to include/reference it within your app.

* For Android TV, you should include a <nobr>`Banner-xhdpi.png`</nobr> image inside your project folder. This image should be 320&times;180 pixels in size.




<a id="launchimage"></a>

## Splash/Launch Screen

### Corona Splash Screen

By default, a Corona-branded splash screen will appear when the app opens. This splash screen can be customized or disabled with purchase of the [Splash Screen Control](https://marketplace.coronalabs.com/plugin/com.coronalabs/plugin.CoronaSplashControl) plugin. Please see the [documentation][plugin.CoronaSplashControl] for details on configuring the splash screen via `build.settings`, assuming you've purchased the plugin.

<!---

<div class="guide-notebox">
<div class="notebox-title">Note</div>

On iOS, the Corona splash screen will appear after the iOS launch screen (see&nbsp;below), assuming the splash screen is not disabled. If the Corona splash screen is disabled, the iOS launch screen will appear until the app is fully loaded, then your first screen/scene will appear.

</div>

-->

<a id="ios-launch"></a>

### iOS Launch Screen

For iOS, you must include some form of __launch&nbsp;screen__ support. Apple recommends that you utilize an <nobr>Xcode-generated</nobr> storyboard for this, since a single storyboard is flexible and adaptable for all launch screens across all devices.

<div class="docs-tip-outer" style="background-color: #ffa752;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

For your convenience, a default (blank) `LaunchScreen.storyboardc` document is automatically added to all new project templates. The same file is also bundled with the Corona application itself, in case you need to copy it over to existing projects. It&nbsp;can be found within the CORONA_CORE_PRODUCT application folder here:

<nobr>`/Applications/Corona/Resources/Resource Library/iOS/LaunchScreen.storyboardc`</nobr>

</div>
</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

The Xcode storyboard document can be customized with your own images/layout&nbsp;&mdash; see our [guide][guide.distribution.launchFile] for instructions.

</div>
</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you use the default `LaunchScreen.storyboardc` file in an existing project, you __must__ include the `UILaunchStoryboardName` key within the `plist` table so that iOS recognizes the existence of the file. Notice that the key's value (`"LaunchScreen"`) matches the name of the file itself, minus the file extension:

``````{ brush="lua" gutter="false" first-line="1" highlight="[7]" }
settings =
{
	iphone =
	{
		plist =
		{
			UILaunchStoryboardName = "LaunchScreen",  -- Required!
		},
	},
}
``````

</div>




<a id="excludingfiles"></a>

## Excluding Files

More sophisticated apps may have files which are needed on one platform but not another. For example, the icon files for each platform are different and you might want to include only the appropriate files on each platform. This is not something CORONA_CORE_PRODUCT handles automatically, since file naming may vary and unique situations can't be predicted. Most developers will not need to specify files which should be excluded from builds, but the option is available if necessary.

Files to be excluded are specified <nobr>per-platform &mdash;</nobr> `ios`, `android`, `macos`, `win32`, `tvos`, <nobr>or `all` &mdash;</nobr> using simple pattern matching where `*` means any string of characters, sometimes including `/`. In other words, these patterns match the path names of files in the app bundle as strings. This generally only matters if you have an elaborate directory structure with multiple instances of directories with the same name at different levels, for example `a/music`, `a/b/music`, `a/b/c/music`, etc. Note that the directory separator character is always a forward slash `/`, even if building on Windows.

File exclusion is a powerful facility and it's possible to corrupt your app bundle if you use this procedure unwisely and accidentally exclude files critical to its operation. After making any changes to the `excludeFiles` setup, monitor the console carefully during the next build and watch for any issues. You should also examine the contents of your app bundle carefully and check exactly which files are included.

Consider these examples on how to exclude various file names and types:

``````{ brush="lua" gutter="false" first-line="1" highlight="[6]" }
settings =
{
	excludeFiles =
	{
		-- Exclude unnecessary icon assets from all builds
		all = { "Icon*.png", "Images.xcassets", "Icon*.ico", "Icon*.icns" },
	},
}
``````

``````{ brush="lua" gutter="false" first-line="1" highlight="[6]" }
settings =
{
	excludeFiles =
	{
		-- Exclude iOS launch screen bundle on Android devices
		android = { "LaunchScreen.storyboardc" },
	},
}
``````

``````{ brush="lua" gutter="false" first-line="1" highlight="[6]" }
settings =
{
	excludeFiles =
	{
		-- Exclude all files at all paths which end with "secret.txt"
		all = { "*secret.txt" },
	},
}
``````

``````{ brush="lua" gutter="false" first-line="1" highlight="[6,8]" }
settings =
{
	excludeFiles =
	{
		-- Exclude all .aac files in the "music" directory on Android devices
		android = { "music/*.aac" },
		-- Exclude all .ogg files in the "music" directory on iOS devices
		ios = { "music/*.ogg" },
	},
}
``````

``````{ brush="lua" gutter="false" first-line="1" highlight="[6,8]" }
settings =
{
	excludeFiles =
	{
		-- Exclude unnecessary assets from macOS desktop apps
        macos = { "Icon*.ico" },
		-- Exclude unnecessary assets from Win32 desktop apps
		win32 = { "Icon*.icns" },
	},
}
``````

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Excluding files is a feature of CORONA_CORE_PRODUCT&nbsp;&mdash; it does not work for CORONA_NATIVE_PRODUCT builds.

</div>
</div>
