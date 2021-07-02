# system.getInfo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      various
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system info
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns information about the system on which the application is running.

## Syntax

	system.getInfo( property )

##### property ~^(required)^~
_[String][api.type.String]._ The name of the property corresponding to the desired information &mdash; see the reference lists below.


## General

### appName

`"appName"` returns the application's name that is displayed to the end user.

### appVersionString

`"appVersionString"` returns the application's version as a string.

* Android &mdash; Returns the app's __Version Name__.
* iOS &mdash; Returns the app's __CFBundleVersionString__.
* Solar2D Simulator &mdash; (not supported)
* Windows desktop app &mdash; Returns the version entered into the build window.

### architectureInfo

`"architectureInfo"` returns a string describing the underlying CPU architecture of the device you are running on. This API is mostly for internal debugging but may have uses. Strings may be subject to changes in the future depending on the changing landscape of devices and CPUs.

* Android on ARM devices will return `ARM` <nobr>(typically for ARMv6)</nobr> or <nobr>`ARM Neon` (ARMv7)</nobr>.
* iOS will return values such as `iPhone6,1` or `iPad5,3`.
* macOS may return `i386`, `x86_64`, `ppc`, or `ppc64`.
* Windows Desktop can return `x86`, `x64`, `IA64`, or `ARM`.

### build

`"build"` returns the Solar2D build string as it appears in the __About__ box of the Solar2D Simulator.

### bundleID

`"bundleID"` returns bundle/package identifier of the app or `nil` if not applicable.

`"build"` returns the Solar2D build string as it appears in the __About__ box of the Solar2D Simulator.

### darkMode
`"darkMode"` returns either `true` or `false` on platforms that support Dark Mode.

### deviceID

`"deviceID"` returns a "unique" ID for the device, with the following caveats:

* On iOS, returns a MD5 hash of the device's `"identifierForVendor"`.

* On Android, if your app uses the `"android.permission.READ_PHONE_STATE"` permission, this will return `IMEI` for GSM phones, `MEID` or `ESN` for CDMA phones, or the operating system's unique ID for devices that are not phones. If your Android app does __not__ use the `"android.permission.READ_PHONE_STATE"` permission, the operating system's unique ID will be returned for all devices. Note that the operating system's unique ID may change after <nobr>re-installing</nobr> the operating system on the device.

* On Android devices running Android&nbsp;6 and higher, if your app uses the `READ_PHONE_STATE` permission and your device is a phone, it's possible for the user to change the value returned from <nobr>`system.getInfo( "deviceID" )`</nobr> by denying the app the `PHONE` permission. The first value that's retrieved from <nobr>`system.getInfo( "deviceID" )`</nobr> is cached and used throughout the lifetime of the current app instance. To ensure that your app gets a consistent value in this case, you'll need to check if the `PHONE` permission is granted and, if it's not, request permission. See the [example](#exampleAndroid6) below for more details.

### environment

`"environment"` returns the environment that the app is running in. These include:

* `simulator` for the Solar2D Simulator.
* `device` for iOS, the Xcode iOS Simulator, Android devices, the Android emulator, macOS desktop apps, and Windows desktop apps.
* `browser` for HTML5 apps.

### maxTextureSize

`"maxTextureSize"` returns the maximum texture width or height supported by the device.

### textureMemoryUsed

`"textureMemoryUsed"` returns the texture memory usage (in&nbsp;bytes). Texture memory for graphics/images tends to be the most sharply limited resource in mobile development since it runs out before normal memory.

### manufacturer

`"manufacturer"` returns the device's manufacturer. On Android, this returns the raw value of `android.os.Build.MANUFACTURER` ([reference](https://developer.android.com/reference/android/os/Build.html#MANUFACTURER)). Examples&nbsp;include:

* `Apple` &mdash; returned on all Apple devices, iOS, macOS, or tvOS.
* `Amazon` &mdash; returned on all <nobr>Amazon-manufactured</nobr> Android devices, Kindle tablets, Fire&nbsp;TV, and the Fire&nbsp;Phone.
* `samsung` &mdash; returned on all <nobr>Samsung-manufactured</nobr> Android devices <nobr>(note the fully-lowercase `samsung`)</nobr>.
* `HTC` &mdash; returned on all <nobr>HTC-manufacturered</nobr> Android devices <nobr>(note the fully-uppercase `HTC`)</nobr>.
* `LENOVO` &mdash; returned on Windows laptops manufactured by Lenovo <nobr>(note the fully-uppercase `LENOVO`)</nobr>.

### model

`"model"` returns the device model (as specified by the manufacturer). Note that most Android devices return a model number instead of a model name. Examples include:

* `iPhone`
* `iPad`
* `Apple TV`
* `AFTM` (Amazon&nbsp;Fire&nbsp;TV)
* `iPhone Simulator`
* `iPad Simulator`
* `Droid`
* `Galaxy Tab`

### name

`"name"` returns the human-readable model name. On iPhone, this would be the name of the phone as it appears in iTunes, for example <nobr>`"Steve's iPhone"`</nobr>. This is not supported on Android.

### platform

`"platform"` returns the operating system platform tag, which can be one of:

* `android` &mdash; all Android devices and the Android emulator.
* `ios` &mdash; all iOS devices and the Xcode iOS Simulator.
* `macos` &mdash; macOS desktop apps.
* `tvos` &mdash; Apple's tvOS (Apple TV).
* `win32` &mdash; Win32 desktop apps.
* `html5` &mdash; HTML5 apps.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

In the Solar2D Simulator, the value returned depends on the skin selected, allowing you to test <nobr>platform-dependent</nobr> logic by changing skins.

</div>

### platformName

This option is deprecated; use `"platform"` instead (see above).

### platformVersion

`"platformVersion"` returns a string representation of the platform version. This is sometimes, but not always, a number &mdash; for example, a Droid&nbsp;X currently returns <nobr>`2.1-update1`</nobr>.

### targetAppStore

`"targetAppStore"` returns the name of the app store that the application was built for:

* `apple` &mdash; always returned on iOS and macOS
* `amazon` &mdash; targets the Amazon app store (only returned on Android).
* `google` &mdash; targets Google Play (only returned on Android).
* `windows` &mdash; targets the Windows app store.
* `none` &mdash; indicates that the app is not targeting a specific app store. This is always returned by the Solar2D&nbsp;Simulator.


## Android

### androidApiLevel

`"androidApiLevel"` returns an integer indicating which [Android OS version](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels) the app is running on. For example, <nobr>API Level 23</nobr> indicates that the OS version is Android&nbsp;6.0 and <nobr>API Level 21</nobr> indicates that the OS version is Android&nbsp;5.0.

### androidAppVersionCode

`"androidAppVersionCode"` returns the application's version code as a number. Returns `nil` on all other platforms.

### androidAppPackageName

`"androidAppPackageName"` returns the application's unique dot-separated package name. Returns `nil` on all other platforms.

### androidGrantedAppPermissions

`"androidGrantedAppPermissions"` returns a table of strings representing every app permission that has been requested and granted to the app. These are in the form of standard Android permission names, such as `android.permission.WRITE_EXTERNAL_STORAGE` or `com.android.vending.BILLING`.

### androidDeniedAppPermissions

`"androidDeniedAppPermissions"` returns a table of strings representing every app permission that has been requested and __denied__ to the app. These are in the form of standard Android permission names, such as `android.permission.WRITE_EXTERNAL_STORAGE` or `com.android.vending.BILLING`.

### grantedAppPermissions

`"grantedAppPermissions"` returns a table of strings representing every app permission that has been requested and granted to this app. This may contain a mix of <nobr>platform-agnostic</nobr> app permission names, like `Calendars`, and standard Android permission names, like `android.permission.INTERNET`.

### deniedAppPermissions

`"deniedAppPermissions"` returns a table of strings representing every app permission that has been requested and __denied__ to the app. This may contain a mix of <nobr>platform-agnostic</nobr> app permission names, like `Calendars`, and standard Android permission names, like `android.permission.INTERNET`.

### androidDisplayApproximateDpi

`"androidDisplayApproximateDpi"` returns the approximate DPI (dots&nbsp;per&nbsp;inch) of the screen as a number. This DPI value is based on the device's assigned density name, such as `hdpi` or `xhdpi`, which provide standardized DPI values on Android. This value is typically not the actual DPI of the display, which you can fetch using `"androidDisplayXDpi"` and `"androidDisplayYDpi"`.

The following table lists the DPI values that will be returned for each display density type. Returns `nil` on all other platforms.

<div class="inner-table">

Density			 DPI
--------------	------
`ldpi`			 120
`mdpi`			 160
`hdpi`			 240
`xhdpi`			 320
`xxhdpi`		 480
`xxxhdpi`		 640
`tvdpi`			 213
--------------	------

</div>

### androidDisplayDensityName

`"androidDisplayDensityName"` returns the device's screen density as a string, which can be `ldpi`, `mdpi`, `hdpi`, `xhdpi`, `xxhdpi`, `xxxhdpi`, `tvdpi`, or `unknown`. Returns `nil` on all other platforms.

### androidDisplayWidthInInches

`"androidDisplayWidthInInches"` returns the width of the application window in inches, relative to the orientation of the application. Returns `nil` on all other platforms.

### androidDisplayHeightInInches

`"androidDisplayHeightInInches"` returns the height of the application window in inches, relative to the orientation of the application. Returns `nil` on all other platforms.

### androidDisplayXDpi

`"androidDisplayXDpi"` returns the DPI (dots&nbsp;per&nbsp;inch) of the screen along the __x__ axis, relative to the orientation of the application. This can be used to convert pixels to inches and vice-versa. Returns `nil` on all other platforms.

### androidDisplayYDpi

`"androidDisplayYDpi"` returns the DPI (dots&nbsp;per&nbsp;inch) of the screen along the __y__ axis, relative to the orientation of the application. This can be used to convert pixels to inches and vice-versa. Returns `nil` on all other platforms.


## iOS

### iosIdentifierForVendor

`"iosIdentifierForVendor"` returns the value of `"identifierForVendor"` (see [here](https://developer.apple.com/documentation/uikit/uidevice)).

<!---

### isoCountryCode

`"isoCountryCode"` returns the "ISO 3166-1 alpha-2" 2-character country code currently selected under the system's regional settings.

### isoLanguageCode

`"isoLanguageCode"` returns the "ISO 639-1" language code currently selected under the system's regional settings, for example the display language.

-->


## Graphics

### gpuSupportsHighPrecisionFragmentShaders

`"gpuSupportsHighPrecisionFragmentShaders"` returns a boolean indicating whether `HIGHP` is supported in fragment shaders on this device.

### GL_VENDOR

`"GL_VENDOR"` returns the company responsible for the GL implementation on this device. See [here](https://www.khronos.org/registry/OpenGL-Refpages/es2.0/xhtml/glGetString.xml) for details.

### GL_RENDERER

`"GL_RENDERER"` returns the name of the GL renderer. See [here](https://www.khronos.org/registry/OpenGL-Refpages/es2.0/xhtml/glGetString.xml) for details.

### GL_VERSION

`"GL_VERSION"` returns the GL version. See [here](https://www.khronos.org/registry/OpenGL-Refpages/es2.0/xhtml/glGetString.xml) for details.

### GL_SHADING_LANGUAGE_VERSION

`"GL_SHADING_LANGUAGE_VERSION"` returns the GL version or release number for the GLSL shading language. See [here](https://www.khronos.org/registry/OpenGL-Refpages/es2.0/xhtml/glGetString.xml) for details.

### GL_EXTENSIONS

`"GL_EXTENSIONS"` returns the list of extensions supported on this device. See [here](https://www.khronos.org/registry/OpenGL-Refpages/es2.0/xhtml/glGetString.xml) for details.


## Examples

##### Checking App Environment

`````lua
if ( system.getInfo( "environment" ) == "simulator" ) then
	print( "You're in the Solar2D Simulator." )
end
`````

<a id="exampleAndroid6"></a>

##### Handling Android 6 Device ID

`````lua
local storedDeviceID = ""

local function hasPhonePermission()

	-- Check to see if the user has previouslly granted permissions
	local grantedPermissions = system.getInfo( "grantedAppPermissions" )
	local hasPhonePermission = false

	-- Check for the "Phone" group permission
	for i = 1,#grantedPermissions do
		if ( "Phone" == grantedPermissions[i] ) then
			hasPhonePermission = true
			break
		end
	end
	return hasPhonePermission
end

local function appPermissionsListener( event )

	local phonePermissionGranted = hasPhonePermission()
	if not phonePermissionGranted then
		-- We can't continue, exit the app
		native.requestExit()
	else
		-- Safe to get the device ID
		storedDeviceID = system.getInfo( "deviceID" )
	end
end

-- This only matters for Android 6 or later
if ( system.getInfo( "platform" ) == "android" and system.getInfo( "androidApiLevel" ) >= 23 ) then

	local phonePermissionGranted = hasPhonePermission()

	if not phonePermissionGranted then
		-- If phone permission is not yet granted, prompt for it
		local permissionOptions =
		{
			appPermission = "Phone",
			urgency = "Critical",
			listener = appPermissionsListener,
			rationaleTitle = "Read phone state required",
			rationaleDescription = "This app needs this state to retrieve previously saved data. Re-request now?",
			settingsRedirectTitle = "Alert",
			settingsRedirectDescription = "Without the ability to access your device's unique ID, it can't function properly. Please grant phone access within Settings."
		}
		native.showPopup( "requestAppPermission", permissionOptions )
	else
		-- We already have the needed permission
		storedDeviceID = system.getInfo( "deviceID" )
	end
end
`````
