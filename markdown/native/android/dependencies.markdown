# Android Dependency Integration

This guide explains how to properly integrate common Android libraries into your plugin project. Following these procedures ensures that your plugin works with the most <nobr>Corona-compatible</nobr> version of a library and also guarantees that your plugin will be compatible with other plugins that share the same dependency on a library.

<div class="guides-toc">

* [Background](#background)
* [Dependency Plugins](#dependency-plugins)
* [Base Logic Layer](#base-logic)
* [Including Dependency Plugins](#including)
* [Testing Against Dependencies](#testing)
* [Dependency Plugin Chaining](#chaining)
* [Dependency Plugins and Permissions](#permissions)

</div>


<a id="background"></a>

## Background

When Corona originally opened up the [Corona Marketplace](https://marketplace.coronalabs.com/) to accept content made by third parties, plugin developers could upload any `.jar` files needed to run their plugin. This resulted in plugins being submitted that would include versions of the [Android Support Libraries](https://developer.android.com/topic/libraries/support-library/index.html) or [Google Play Services](https://developers.google.com/android/guides/overview). The version of these `.jar` files would often be the latest version available when the plugin was initially developed, but they were not typically updated when newer versions of the plugin were released.

Essentially, with different versions of libraries floating around inside of plugins, incompatibilities would occur between a plugin needing, for&nbsp;instance, Google&nbsp;Play&nbsp;Services version 8.4 and another plugin needing Google&nbsp;Play&nbsp;Services version 4.2.




<a id="dependency-plugins"></a>

## Dependency Plugins

In Corona, __dependency plugins__ are special plugins that address version incompatibilities between dependencies which multiple plugins may have. They contain all of the resources for the latest version of a particular library that Corona supports, plus any additional resources to aid in integration and proper usage of a library.

If your project depends on a common Android library like the [Android Support Libraries](https://developer.android.com/topic/libraries/support-library/index.html) or [Google Play Services](https://developers.google.com/android/guides/overview), you'll need to include a dependency plugin to incorporate that library into your plugin submission. This is to ensure compatibility with other plugins that may be dependent on these libraries.

The following table outlines which libraries are supported by Corona as dependency plugins. While developing your plugin that meets the above criteria, you should test it against the library version encapsulated in a dependency plugin.

<div class="inner-table">

Library										Dependency Plugin Name						Version
------------------------------------------	------------------------------------------	----------
Android Support v4							`shared.android.support.v4`					27.1.1
Android Support v7 &ndash; AppCompat		`shared.android.support.v7.appcompat`		27.1.1
Android Support v7 &ndash; CardView			`shared.android.support.v7.cardview`		27.1.1
Android Support v7 &ndash; RecyclerView		`shared.android.support.v7.recyclerview`	27.1.1
Google Actions, Base Client Library			`shared.google.play.services.base`			15.0.1
Google Analytics							`shared.google.play.services.analytics`		15.0.1
Google Cloud Messaging						`shared.google.play.services.gcm`			15.0.1
Google Drive								`shared.google.play.services.drive`			15.0.1
Google Location								`shared.google.play.services.location`		15.0.1
Google Mobile Ads (AdMob)					`shared.google.play.services.ads`			15.0.1
Google Play Games Services					`shared.google.play.services.games`			15.0.1
------------------------------------------	------------------------------------------	----------

</div>

### Android Support Libraries

Any library with a dependency plugin name containing `shared.android.support` is part of Google's [Android Support Libraries](https://developer.android.com/topic/libraries/support-library/index.html). These dependency plugins encapsulate the respective components listed [here](https://developer.android.com/topic/libraries/support-library/index.html) and are analogous to adding the following to the `dependencies` block of your project's `build.gradle`:

	compile 'com.android.support:[COMPONENT_NAME]:[VERSION_NUMBER]'

### Google Play Services

Any library with a dependency plugin name containing `shared.google.play.services` is part of [Google Play Services](https://developers.google.com/android/guides/overview). These dependency plugins encapsulate the respective components listed [here](https://developers.google.com/android/guides/setup#add_google_play_services_to_your_project) and are analogous to adding the following to the `dependencies` block of your project's `build.gradle`:

	compile 'com.google.android.gms:play-services-[COMPONENT_NAME]:[VERSION_NUMBER]'




<a id="base-logic"></a>

## Base Logic Layer

The `shared.google.play.services.base` dependency plugin also includes a base logic layer that will check if the environment on the device is safe for using Google&nbsp;Play&nbsp;Services and attempt to resolve any issues with using the Google&nbsp;Play&nbsp;Services `.apk`. This is to follow Google's [guidelines](https://developers.google.com/android/guides/setup#ensure_devices_have_the_google_play_services_apk) on ensuring devices have the Google&nbsp;Play&nbsp;Services APK. Resolution attempts are made by presenting either an alert or a notification with context about the issue and how to resolve it. From an alert, the end user would then tap a button and be taken somewhere else on their device to resolve the problem. From a notification, tapping on it will launch the app and present an alert with similar context.

### Behavior Changes

When the `shared.google.play.services.base` dependency plugin is included, your app's `main.lua` will not begin to execute until any environment issues for using Google&nbsp;Play&nbsp;Services are resolved by the end user. Should an environment change affecting Google&nbsp;Play&nbsp;Services occur during your app's execution, such as the end user disabling Google&nbsp;Play&nbsp;Services on their device, the end user will be presented with an alert or notification similar to when the app was initially launched, prior to `main.lua` executing.

If the end user just re-enabled Google&nbsp;Play&nbsp;Services and they still need to download an update to Google&nbsp;Play&nbsp;Services, your app will display an alert requesting the end user reboot their device. This reboot is strictly enforced if your app includes the `"android.permission.RECEIVE_BOOT_COMPLETED"` permission. In this case, your app won't be able to get past this alert until the end user reboots the device. If the `"android.permission.RECEIVE_BOOT_COMPLETED"` permission is __not__ requested by your app, it will recommend the user reboot their device, but will have no means of enforcing it. This reboot is recommended to get around potential <nobr>DF-DLA-15</nobr> errors from the Google&nbsp;Play store while updating Google&nbsp;Play&nbsp;Services.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Limitations</div>

Note that the base logic layer does __not__ account for issues that may occur while trying to connect to Google&nbsp;Play&nbsp;Services and use Google's APIs. It will only guarantee that the app has access to the correct version of the Google&nbsp;Play&nbsp;Services `.apk` at all times. When it's time for your plugin to connect to Google&nbsp;Play&nbsp;Services, be sure to follow the [Accessing Google APIs](https://developers.google.com/android/guides/api-client) and [Runtime Permissions](https://developers.google.com/android/guides/permissions) guides.

</div>

### CORONA_NATIVE_PRODUCT Gotchas

To use the base logic layer with a CORONA_NATIVE_PRODUCT project, you will need to identify which components of Google&nbsp;Play&nbsp;Services are being used with <nobr>`<meta-data>`</nobr> tags in the `<application>` block of your application's `AndroidManifest.xml`. These tags are used to identify components of Google&nbsp;Play&nbsp;Services that may need additional process. The format for these <nobr>`<meta-data>`</nobr> tags is as follows:

``````xml
<meta-data android:name="usesGooglePlayServicesComponent[PascalCase_NAME_OF_COMPONENT]" android:value="true" />
``````

Here, `[PascalCase_NAME_OF_COMPONENT]` corresponds to the `[COMPONENT_NAME]` that would be specified in the `dependencies` block of your project's `build.gradle`. For example, if the `dependencies` block of your `build.gradle` includes <nobr>`compile 'com.google.android.gms:play-services-ads:15.0.1'`</nobr>, you would need to include the following in the `<application>` block of `AndroidManifest.xml`:

``````xml
<meta-data android:name="usesGooglePlayServicesComponentAds" android:value="true" />
``````




<a id="including"></a>

## Including Dependency Plugins

To include a dependency plugin when [submitting your plugin][native.plugin.submission], add an entry to the <nobr>`coronaManifest` &rarr; `dependencies`</nobr> table of your plugin's `android/metadata.lua`:

``````lua
local metadata =
{
	plugin =
	{
		-- ...
	},
	coronaManifest = {
		dependencies = {
			["shared.google.play.services.ads"] = "com.coronalabs",
		},
	},
}

return metadata
``````

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The publisher ID for all of the dependency plugins is `"com.coronalabs"`, so entries in the `dependencies` table should always be of the format <nobr>`["DEPENDENCY_PLUGIN_NAME"] = "com.coronalabs",`</nobr>.

* Including one dependency plugin in the `dependencies` table will also include any dependencies it has. See the [Dependency Plugin Chaining](#chaining) section for more information.

</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Need a common library that's not currently supported? When [submitting your plugin][native.plugin.submission], please let us know about any common libraries you're using that may need to be encapsulated as dependency plugins, for example other components of [Google Play Services](https://developers.google.com/android/guides/overview).

</div>
</div>




<a id="testing"></a>

## Testing Against Dependencies

Most dependency plugins simply wrap the distribution of a library accessible from the [Android SDK Manager](https://developer.android.com/studio/intro/update.html#sdk-manager). In these cases, simply including the correct version of the library in the `dependencies` block of the plugin's <nobr>`build.gradle (Module: plugin)`</nobr> file is sufficient for testing. For example, a plugin that depends on the [CardView](https://developer.android.com/topic/libraries/support-library/features.html#v7-cardview) library can be accurately tested by adding <nobr>`compile 'com.android.support:cardview-v7:27.1.1'`</nobr> to the `dependencies` block of the <nobr>`build.gradle (Module: plugin)`</nobr> file.

Other dependency plugins may require additional resources to test against. Any dependency plugin that falls in this category will have an entry in the tarball of plugins provided in the release files of CORONA_NATIVE_PRODUCT. For a dependency plugin with this requirement, be&nbsp;sure&nbsp;to:

* Include the `.jar` file with the name of the dependency plugin. For example, the `shared.google.play.services.base` dependency plugin contains a `shared.google.play.services.base.jar` file which should be included in your project.
 
* Merge the contents of the `manifest` table of `metadata.lua` into your project's `AndroidManifest.xml`. The parts that need to be merged in should have a comment identifying them as part of the dependency plugin's package name, for instance <nobr>`-- For share-google-play-services-base package`</nobr>. However, any XML block designated for a different package like <nobr>`-- From play-services-basement package`</nobr> does not need to be added manually&nbsp;&mdash; these parts will be included in the compiled app when you add <nobr>`compile 'com.google.android.gms:play-services-base:15.0.1'`</nobr> to the `dependencies` block of your <nobr>`build.gradle (Module: app)`</nobr> file.

* Add any resources for the dependency plugin's package into your project. If the dependency plugin contains multiple packages inside the `resources` folder, look for the `package.txt` file containing the dependency plugin's package name and add the contents of the `res` folder to your project's `res` folder.




<a id="chaining"></a>

## Dependency Plugin Chaining

Just as your plugin may rely upon a dependency plugin, a dependency plugin itself may depend upon other dependency plugins. The following flow chart illustrates the chaining between dependency plugins:

<div style="max-width: 800px">

![][images.simulator.dependencies]

</div>




<a id="permissions"></a>

## Dependency Plugins and Permissions

When using a dependency plugin, some permissions may be automatically added to your app. The following table illustrates which permissions are added for which dependency plugins.

<style>.inner-table table td { padding-top: 4px; padding-bottom: 2px; }</style>
<div class="inner-table">

Dependency Plugin					Permissions
----------------------------------	--------------------------
`google.play.services.ads`			`"android.permission.ACCESS_NETWORK_STATE"`<br />`"android.permission.INTERNET"`
`google.play.services.analytics`	`"android.permission.ACCESS_NETWORK_STATE"`<br />`"android.permission.INTERNET"`<br />`"android.permission.WAKE_LOCK"`
`google.play.services.gcm`			`"com.google.android.c2dm.permission.RECEIVE"`<br />`"android.permission.INTERNET"`
----------------------------------	--------------------------

</div>
