# Plugin Submission Guide

<style>

.faq p, .faq ul { padding-left: 20px; }
.faq p em { margin-left: -20px; font-size: 110%; font-weight: 600; font-style: normal; }

</style>

This guide is for third party developers who are ready to [submit a plugin](https://marketplace.coronalabs.com/product-submit) for availability in the [Corona Marketplace](https://marketplace.coronalabs.com).

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you are new to the concept of plugins and how to create them, please see our [Plugins][native.plugin] guide.

</div>
</div>

<div class="guides-toc">

* [Distribution](#distribution)
* [Packaging for Submission](#packaging)
* [Version Targeting](#version)
* [FAQ](#faq)

</div>


<a id="distribution"></a>

## Distribution

Plugins are distributed differently depending on the product for which it will be used.

### CORONA_CORE_PRODUCT

Your plugins will be hosted live on Corona's build servers, immediately available to all CORONA_CORE_PRODUCT developers. When a CORONA_CORE_PRODUCT developer creates a project that requires your plugin, the build server automatically integrates the plugin during the build process.

### CORONA_NATIVE_PRODUCT

The CORONA_NATIVE_PRODUCT developer will have to include the plugin in the native project. Depending on the target platform, this can take several forms: a static library (iOS), a shared library (macOS/Windows/Android), or <nobr>a `.jar` file (Android)</nobr>.




<a id="packaging"></a>

## Packaging for Submission

### Pure Lua

If you have a plugin written in __pure&nbsp;Lua__ <nobr>(Lua code only)</nobr>, please see the [Creating Lua Plugins][native.plugin.luaplugin] guide for details on how to submit it to the [Corona Marketplace](https://marketplace.coronalabs.com/).

### Native / Hybrid

If your plugin is written in native code or hybrid native+Lua, it should be submitted via a Bitbucket repo that has been shared with you (the&nbsp;structure of that repo must follow a particular&nbsp;format). Once you have an update for your repo, you can generate a pull request.

To help you get started, we have created a [plugin submission template](https://github.com/coronalabs/plugins-submission-template) that contains starter files, with the exception of the `plugins` binary directory. Essentially, you should package up your native/hybrid plugin files with the following structure:

<div class="tree">

* `metadata.json` &mdash; Core information about your plugin; see [metadata.json](#metadata-json) below.
* `plugins/`&nbsp;
	- `${VERSION}/` &mdash; Build version, for example `CURRENT_RELEASE`; see [Version Targeting](#version) below.
		- `android/`&nbsp;
			- `.jar` or `.so` binary.
			- `metadata.lua` &mdash; See [metadata.lua](#metadata-lua) below.
			- `resources/`&nbsp;
				- `package.txt` &mdash; Contains the name of the package for which to generate a `R` file.
				- `assets/` &mdash; This folder contains files to be added to the assets folder and can be retrieved via the assets manager.
				- `res/` &mdash; This folder contains files you want to put in the `res` folder and can be accessed via [getIdentifier](https://developer.android.com/reference/android/content/res/Resources.html) or by accessing the `R` file of the package under `package.txt`. The structure of the subfolder is exactly the same as the `res` folder.
		- `iphone/`&nbsp;
			- `.a` binary (ARMv7).
			- `metadata.lua` &mdash; See [metadata.lua](#metadata-lua) below.
			- `resources/` This folder will contain all the resources you want in the app.  It is relative to the root app directory.
		- `iphone-sim/`&nbsp;
			- `.a` binary (i386).
			- `metadata.lua` &mdash; See [metadata.lua](#metadata-lua) below.
			- `resources/` &mdash; This folder will contain all of the resources you want in the app. It's relative to the root app directory.
		- `mac-sim/`&nbsp;
			- `.dylib` binary or Lua plugin.
		- `win32-sim/`&nbsp;
			- `.dll` binary or Lua plugin.

</div>

<a id="metadata-json"></a>

### metadata.json

This JSON file contains information about the publisher, the name of the plugin as it appears in Lua, and other related information, for example:

``````json
{
    "contact": "me@mycompany.com",
    "url": "http://www.mycompany.com",
    "pluginName": "plugin.mylibrary",
    "publisherId": "com.mycompany"
}
``````

<a id="metadata-lua"></a>

### metadata.lua

For __native/hybrid__ plugins, the <nobr>per-platform</nobr> `metadata.lua` file describes properties of the plugin binary. This file is required for Android, iOS, and the iOS&nbsp;Simulator.

* For __Android__, you need to specify the format of the binary. Currently, `.jar` and `.so` are supported. In addition, you can specify elements in the `AndroidManifest.xml` file that need to be modified in order to accommodate the plugin.

<div class="code-indent">
<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

If you're [developing a plugin][native.plugin] that depends on the [Android Support Libraries](https://developer.android.com/topic/libraries/support-library/index.html) or [Google Play Services](https://developers.google.com/android/guides/overview), please read our [Android Dependency Integration][native.android.dependencies] guide.

</div>
</div>
</div>

* For __iOS__ and the __iOS&nbsp;Simulator__, the `metadata.lua` files should be the same. In both, you specify the format of the binary. Currently, only static libraries (`.a`) are supported.

* You can declare dependencies through the `coronaManifest` section. These plugins will be downloaded and bundled with your own during a Corona&nbsp;Simulator build.
	
* The [plugin submission template](https://github.com/coronalabs/plugins-submission-template) provides stub versions. Here are some examples:

<div class="code-indent">

``````lua
-- Android
local metadata =
{
	plugin =
	{
		format = "jar",
		manifest = 
		{
			permissions = {},
			usesPermissions =
			{
				"android.permission.INTERNET",
				"android.permission.ACCESS_NETWORK_STATE",
				"android.permission.READ_PHONE_STATE",
			},
			usesFeatures = {},
			applicationChildElements =
			{
				-- Array of strings
				[[
					<activity android:name="com.mycompany.MyActivity"
					android:configChanges="keyboard|keyboardHidden"/>
				]],
			},
		},
	},
	coronaManifest = {
		dependencies = {
			["shared.memoryBitmap"] = "com.coronalabs",
		},
	},
}

return metadata
``````

``````lua
-- iOS / iOS Simulator
local metadata =
{
	plugin =
	{
		format = "staticLibrary",

		-- This is the name without the "lib" prefix
		-- In this case, the static library is called "libplugin_openudid.a"
		staticLibs = { "plugin_openudid", },

		frameworks = {},
		frameworksOptional = {},
	},
	coronaManifest = {
		dependencies = {
			["shared.memoryBitmap"] = "com.coronalabs",
		},
	},
}

return metadata
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

In regards to iOS frameworks, Corona automatically links to the following frameworks. If you need to link against additional frameworks, you can specify them as either required inside the `frameworks` table or optional (weak&nbsp;linking) inside the `frameworksOptional` table. When you specify them, please __omit__ the `.framework` extension.

<div style="float: left; margin-right: 25px; margin-bottom: 4px;">

* `AddressBook`
* `AddressBookUI`
* `AssetsLibrary`
* `AudioToolbox`
* `AVFoundation`
* `CFNetwork`
* `CoreGraphics`

</div>
<div style="float: left; margin-right: 25px;">

* `CoreLocation`
* `CoreMedia`
* `CoreMotion`
* `Foundation`
* `GameKit`
* `iAd`
* `ImageIO`

</div>
<div style="float: left; margin-right: 25px;">

* `MapKit`
* `MediaPlayer`
* `MessageUI`
* `MobileCoreServices`
* `OpenAL`
* `OpenGLES`
* `Photos`

</div>
<div style="float: left;">

* `QuartzCore`
* `Security`
* `StoreKit`
* `SystemConfiguration`
* `UIKit`

</div>
<div style="clear: both;"></div>

Additionally, for backward compatibility, Corona weak links against the `Accounts`, `AdSupport`, `Social`, and `Twitter` frameworks.

</div>

</div>

### Android Resources

For Android, resources can be included into the `assets` or the `res` directory in the resulting `.apk` after a build.

To package resources into the `assets` directory, put the resources into the `assets` folder indicated below. The directory structure will be persist through the build process.

<div class="tree">

* `plugins/`&nbsp;
	- `${VERSION}/` &mdash; Build version, for example `CURRENT_RELEASE`; see [Version Targeting](#version) below.
		- `android/`&nbsp;
			- `resources/`&nbsp;
				- `assets/` &mdash; This folder contains files to be added to the assets folder and can be retrieved via the assets manager.

</div>

To package resources into the `res` directory, put the resources into the `res` folder indicated below. This `res` folder can contain subfolders which are the same folders as a native Android build, for example `drawable`, `layout`, etc.

<div class="tree">

* `plugins/`&nbsp;
	- `${VERSION}/` &mdash; Build version, for example `CURRENT_RELEASE`; see [Version Targeting](#version) below.
		- `android/`&nbsp;
			- `resources/`&nbsp;
				- `res/` &mdash; This folder contains files you want to put in the `res` folder and can be accessed via [getIdentifier](https://developer.android.com/reference/android/content/res/Resources.html) or by accessing the `R` file of the package under `package.txt`. The structure of the subfolder is exactly the same as the `res` folder.

</div>

### iOS Resources

To include resources in the `.app` bundle, put them into the `resources` folder indicated below. These resources will be added to the bundle relative to the base directory. For example, if you put `example.png` into the `resources` folder, it will be included like `example.app/example.png`.

<div class="tree">

* `plugins/`&nbsp;
	- `${VERSION}/` &mdash; Build version, for example `CURRENT_RELEASE`; see [Version Targeting](#version) below.
		- `iphone/`&nbsp;
			- `resources/` This folder will contain all the resources you want in the app.  It is relative to the root app directory.
		- `iphone-sim/`&nbsp;
			- `resources/` &mdash; This folder will contain all of the resources you want in the app. It's relative to the root app directory.

</div>




<a id="version"></a>

## Version Targeting

When a plugin is published to Corona's servers, you must specify a <nobr>__minimum build version__</nobr> of CORONA_CORE_PRODUCT for the plugin you're deploying. This build version controls the availability of your plugin&nbsp;&mdash; specifically, developers will need to use that version (or&nbsp;later) of CORONA_CORE_PRODUCT in order to use the plugin for a device build and, if&nbsp;available, within the Corona&nbsp;Simulator. 

For example, if you want your plugin to be supported in build CURRENT_RELEASE or later, you should use `CURRENT_RELEASE` for `${VERSION}` per the directory structures shown above. Then, in your documentation or elsewhere, you would tell developers to install CORONA_CORE_PRODUCT version CURRENT_RELEASE or later to access the plugin.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

When you build your plugin binary, you should use the corresponding version of CORONA_NATIVE_PRODUCT.

</div>
</div>

### Choosing a Version

For new plugins, we highly recommend that you support the most recent public release. This ensures that your plugin is available to the broadest audience possible.

### Multiple Versions

Normally, when you update a plugin binary, you simply <nobr>re-submit</nobr> the plugin. However, there may be occasions when a newer version of the plugin breaks backwards compatibility, or your updated plugin relies on new functionality available in a more recent [daily build](https://developer.coronalabs.com/downloads/daily-builds/) of Corona.

In this situation, you should deploy a separate plugin binary. This binary will correspond to a different/newer build version of CORONA_CORE_PRODUCT. A developer can then simply obtain that version to access the newer version of the plugin. In this manner, you can keep the legacy plugin binary around to preserve backwards compatibility.




<a id="faq"></a>

## FAQ

<div class="faq">

###### __Do I need to create plugins for platforms that are not yet supported, such as Windows and macOS?__

At a minimum, you will need to supply a Lua plugin stub for all platforms, including versions for Windows and macOS. These stubs should allow CORONA_CORE_PRODUCT developers to make calls as they would on a <nobr>fully-supported</nobr> platform.  A sample Lua stub can be found [here](https://github.com/coronalabs/plugins-submission-template/blob/master/plugins/VERSION/mac-sim/plugin_PLUGIN_NAME.lua).

###### __I have uploaded a plugin for a specific platform. Where do I add plugins for the additional platforms?__

Under the build version of the plugin folder, you should supply your plugin implementations within the folders named `android`, `iphone`, <nobr>`iphone-sim`</nobr>, <nobr>`mac-sim`</nobr>, and <nobr>`win32-sim`</nobr>.

###### __How do I produce `.dll` and `.dylib` files for the Corona&nbsp;Simulator?__

If the plugin does not have an implementation for Windows or macOS, we recommend creating Lua stub files (see&nbsp;above).

If you wish to provide Simulator plugin implementations, you will need to use Visual&nbsp;Studio (Windows) or Xcode (macOS). Some useful guidelines can be found here:

* [Creating and Using a Dynamic Link Library](http://msdn.microsoft.com/en-us/library/ms235636\(v=vs.80\).aspx) (`.dll`)
* [Creating Dynamic Libraries](https://developer.apple.com/library/mac/documentation/DeveloperTools/Conceptual/DynamicLibraries/100-Articles/CreatingDynamicLibraries.html#//apple_ref/doc/uid/TP40002073-SW1) (`.dylib`)

###### __Why is there both an `iphone` and `iphone-sim` folder?__

When you submit a plugin, two versions should be submitted. The `iphone` folder should contain the __ARMv7__ plugin and the <nobr>`iphone-sim`</nobr> folder should contain the __i386__ plugin. This ensures that there is a plugin available for both the iOS&nbsp;Simulator and physical devices.

###### __Which version of the Android NDK should I be using for native library (`.so`) plugin creation?__

The native library (`.so`) plugin should be built with the Android NDK labeled `android-ndk-r10d`.

###### __How can I test my plugin?__

The plugin can be tested using CORONA_NATIVE_PRODUCT by linking the static library (iOS) or through including the library in your project's `libs` directory (Android). After initial testing, you will need to submit the binaries to Corona&nbsp;Labs to test with CORONA_CORE_PRODUCT.

</div>
