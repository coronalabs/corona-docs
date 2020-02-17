# Apple TV / tvOS

This guide discusses setup, features, and development for Apple&nbsp;TV and tvOS in Corona. 

<div class="guides-toc">

* [Developing for tvOS](#developing)
* [Build Process](#building)
* [Installation](#installapp)
* [Feature Comparison](#comparison)
* [CORONA_NATIVE_PRODUCT](#native)

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Before you proceed with experimentation and tvOS development, remember to evaluate various design aspects including deployment to a much larger screen and a pure <nobr>controller-based</nobr> interaction model. Converting an existing mobile app to tvOS will typically require thorough consideration of how the layout, UI, and controls will be affected.

</div>




<a id="developing"></a>

## Developing for tvOS

### Sample Project

We recommend that you start with the [Pew Pew!](https://github.com/coronalabs/PewPew) demo because the primary interaction model requires controllers (there is no touch interface on a TV). This sample is available in our [GitHub](https://github.com/coronalabs/PewPew) repository.

### Orientation

Apple TV does not have the concept of portrait versus landscape orientation. All Corona tvOS projects are run in the `"landscapeRight"` orientation. An app must support landscape orientation to be built through the Corona Simulator.

<a id="tvOS-icons"></a>

### Icons / Launch Image / Top Shelf

Apple's Human Interface Guidelines on [Icons and Images](https://developer.apple.com/tvos/human-interface-guidelines/icons-and-images/) defines how your app should present itself on the Apple&nbsp;TV. This means that you'll need a new type of icon, at least one static Top&nbsp;Shelf image, and a launch image.

All assets provided must be `.png` files of specific sizes. The Top&nbsp;Shelf image, displayed when your app is one of the first on the user's home screen, is a 1920&times;720 static `.png` file, and the launch image is a 1920&times;1080 static `.png` file.

App icons are not simply one image file, but multiple images stacked as layers. Additionally, you must provide both small (home&nbsp;screen) and large (app&nbsp;store) assets. Small assets are 400&times;240, while large assets are 1280&times;768. The <nobr>bottom-most</nobr> image in the stack must not have any transparency and it should serve as a background for the icon.

By editing your `build.settings` file, Corona will create the required bundles for you. Below is an example of what the `tvos` section of `build.settings` should look like:

``````lua
settings =
{
	tvos =
	{
		-- Apple TV app icons consist of multiple "layers" in both small and large sizes
		icon =
		{
			-- A collection of 400x240 images, in order from top to bottom
			small =
			{
				"Icon-tvOS-Small-4.png",
				"Icon-tvOS-Small-3.png",
				"Icon-tvOS-Small-2.png",
				"Icon-tvOS-Small-1.png",
			},
			-- A collection of 1280x768 images, in order from top to bottom
			large =
			{
				"Icon-tvOS-Large-4.png",
				"Icon-tvOS-Large-3.png",
				"Icon-tvOS-Large-2.png",
				"Icon-tvOS-Large-1.png",
			}
		},

		-- A 1920x720 image file, displayed when your app is on the "top shelf"
		topShelfImage = "Icon-tvOS-TopShelf.png",

		-- A 2320x720 image file, displayed when your app is on the "top shelf" of a widescreen TV
		topShelfImageWide = "Icon-tvOS-TopShelfWide.png",

		-- A 1920x1080 image file, displayed briefly as your app loads
		launchImage = "Icon-tvOS-Launch.png",
	},
}
``````

### Interaction Model

The interaction model for Apple&nbsp;TV is centered around the Apple&nbsp;TV Remote. This remote operates like a game controller but in the "micro&nbsp;gamepad" profile, meaning that it has a limited set of buttons. In contrast, traditional game controllers like those for Xbox or PlayStation offer more buttons and thus have a more extended profile.

For more information on interaction, see the [Game Controllers][guide.hardware.gameControllers] and [MFi Controllers][guide.hardware.mfiControllers] guides.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* Touch events don't apply to tvOS &mdash; this platform revolves around [relativeTouch][api.event.relativeTouch], [axis][api.event.axis], and [key][api.event.key] events. Adapt your game accordingly!

* All tvOS games are expected to work with the Apple&nbsp;TV Remote's "micro&nbsp;gamepad" profile.

* You can connect a [MFi Controller][guide.hardware.mfiControllers] to your Mac to send controller events to your app running in the Corona&nbsp;Simulator.

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

The menu button on controllers <nobr>(`keyName` of `"menu"`)</nobr> is expected to pause the app or move the user to the previous screen. Once the user is at the main menu, the app must use <nobr>`system.activate( "controllerUserInteraction" )`</nobr> \([documentation][api.library.system.activate]\) and <nobr>`system.deactivate( "controllerUserInteraction" )`</nobr> \([documentation][api.library.system.deactivate]\) to tell the operating system that a menu button press should back out of the app.

Note that a long press of the menu button will always exit your app, and is the default method to exit the app unless changed as described above.

</div>

### Idle Timer

Your tvOS app should __disable__ the screen idle timer via [system.setIdleTimer()][api.library.system.setIdleTimer]:

``````lua
system.setIdleTimer( false )
``````

### Widget Focus

Corona [widgets][api.library.widget] do not have <nobr>built-in</nobr> support for focus. In order to interact with widgets on Apple&nbsp;TV, you will need to write custom code to handle focus. See the [Pew Pew!](https://github.com/coronalabs/PewPew) sample for a demonstration of how to control widgets when they receive focus and how game controller events change focus.

### Native Display Objects

The following native object functions are supported and, unlike widgets, these objects automatically support both focus and controller interaction:

* [native.showAlert()][api.library.native.showAlert]
* [native.cancelAlert()][api.library.native.cancelAlert]
* [native.newTextField()][api.library.native.newTextField]
* [native.newTextBox()][api.library.native.newTextBox]
* [native.newVideo()][api.library.native.newVideo]

### Checklist for tvOS

Apple provides a [checklist](https://developer.apple.com/library/tvos/documentation/ServicesDiscovery/Conceptual/GameControllerPG/Appendix/Appendix.html#//apple_ref/doc/uid/TP40013276-CH6-DontLinkElementID_1) for games on tvOS. Please consult it to make sure your game adheres to their requirements.




<a id="building"></a>

## Build Process

Building your tvOS app is a simple process once you have your certificate and provisioning profiles installed.

1. From the Corona Simulator, select __File__ &rarr; __Open...__ to load the project you wish to build.

2. Select __File__ &rarr; __Build__ &rarr; __tvOS...__

3. Fill in the information:

	* __Application Name__ — by default, this will match your project folder; keep this name or specify another.

	* __Version__ — specify a version name for your app.

	* __Provisioning Profile__ — select the appropriate provisioning profile for either __development__ or __distribution__.

	* __tvOS SDK__ — select the version of tvOS to build for.

	* __Save to Folder__ — specify where to save the compiled app.

	* __After Build__ — select which action should be performed after the app is successfully built.

4. Click __Build__ and Corona will compile the app. You will then have an application file that can be loaded on an Apple&nbsp;TV or submitted to the App&nbsp;Store, depending on which provisioning profile you selected.




<a id="installapp"></a>

## Installation

There are two methods to install your app on an Apple&nbsp;TV, as outlined below.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

You can __not__ test an app built for __App&nbsp;Store&nbsp;Distribution__ on an Apple&nbsp;TV. Apps built for distribution are intended for submission to Apple.

</div>
</div>

### Copy to Device

1. Connect the Apple&nbsp;TV to your computer.

2. Follow the steps outlined in [Build Process](#building) above, ensuring that you select <nobr>__Copy to device__</nobr> for the __After&nbsp;Build__ option.

### Xcode

1. Connect your Apple&nbsp;TV, open __Xcode__, and then open the __Devices__ window by selecting <nobr>__Window__ &rarr; __Devices__</nobr>.

2. In the left column, select the Apple&nbsp;TV.
    
3. In the main pane, look for the __Installed&nbsp;Apps__ section which shows the currently installed apps (this&nbsp;list may be empty initially). Below the list, click the \[__+__\] button and navigate to the location of the `.app` file which was generated by Corona. Select the file and click __Open__. Assuming there are no provisioning/certificate errors, the app should install on the device.




<a id="comparison"></a>

## Feature Comparison

In general, tvOS contains a subset of the APIs available for iOS. See [here](https://developer.apple.com/library/prerelease/tvos/releasenotes/General/tvOS90APIDiffs/) for more details.

### Libraries

<div class="inner-table vert-compact percent33">

Supported													Unsupported
----------------------------------------------------------	----------------------------------------------------------
[audio.*][api.library.audio]								[ads.*][api.library.ads]
[composer.*][api.library.composer]							[facebook.*][api.library.facebook]						
[crypto.*][api.library.crypto]								[licensing.*][api.library.licensing]
[display.*][api.library.display]							[native.*][api.library.native], except as noted above
[easing.*][api.library.easing]								[media.*][api.library.media]
[(globals)][api.library.global]								[store.*][api.library.store]
[graphics.*][api.library.graphics]
[io.*][api.library.io]
[json.*][api.library.json]
[lfs.*][api.library.lfs]
[math.*][api.library.math]
[network.*][api.library.network]
[os.*][api.library.os], except `os.exit`
[package.*][api.library.package]
[physics.*][api.library.physics]
[socket.*][api.library.socket]
[sqlite3.*][api.library.sqlite3]
[string.*][api.library.string]
[system.*][api.library.system]
[table.*][api.library.table]
[timer.*][api.library.timer]
[transition.*][api.library.transition]
[widget.*][api.library.widget]
----------------------------------------------------------	----------------------------------------------------------

</div>

### Events

<div class="inner-table vert-compact percent33">

Supported													Unsupported
----------------------------------------------------------	----------------------------------------------------------
[accelerometer][api.event.accelerometer]					[colorSample][api.event.colorSample]
[audio][api.event.audio]									[gyroscope][api.event.gyroscope]				
[axis][api.event.axis]										[heading (compass)][api.event.heading]
[collision][api.event.collision]							[inputDeviceStatus][api.event.inputDeviceStatus]
[completion][api.event.completion]							[licensing][api.event.licensing]
[enterFrame][api.event.enterFrame]							[location (GPS)][api.event.location]
[finalize][api.event.finalize]								[mapAddress][api.event.mapAddress]
[memoryWarning][api.event.memoryWarning]					[mapLocation][api.event.mapLocation]
[networkRequest][api.event.networkRequest]					[mapMarker][api.event.mapMarker]
[networkStatus][api.event.networkStatus]					[mouse][api.event.mouse]
[particleCollision][api.event.particleCollision]			[notification][api.event.notification]
[postCollision][api.event.postCollision]					[orientation][api.event.orientation]
[preCollision][api.event.preCollision]						[popup][api.event.popup]
[relativeTouch][api.event.relativeTouch]					[resize][api.event.resize]
[scene][api.event.scene]									[tap][api.event.tap]
[sprite][api.event.sprite]									[touch][api.event.touch]
[system][api.event.system]									[userInput][api.event.userInput]
[timer][api.event.timer]
[unhandledError][api.event.unhandledError]
[urlRequest][api.event.urlRequest]
[video][api.event.video]
----------------------------------------------------------	----------------------------------------------------------

</div>




<a id="native"></a>

## CORONA_NATIVE_PRODUCT

The `App` project template contains Xcode projects under the `tvOS` subdirectory. Note that the plugin itself doesn't do much.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

The virtual remote in the tvOS/Xcode&nbsp;Simulator can not be used to send controller events. Please test on a device or connect a [MFi Controller][guide.hardware.mfiControllers].

</div>

### Plugins / Frameworks

Plugins on tvOS are packaged as dynamic frameworks. Dynamic frameworks provide more flexibility, allowing code and resource files to be packaged together.

The `App` project template for tvOS contains an embedded `Plugin` project that you can modify. This project contains two targets:

1. `Corona_plugin_library` &mdash; This is the target where you should add additional source files and frameworks that the plugin depends on (this is different from iOS plugins where dependencies are specified in `metadata.lua`).
2. `Corona_plugin_library.framework` &mdash; This is the target to use if you want to publish/distribute your plugins to the Corona Store. It builds a universal framework (Apple&nbsp;TV device and tvOS/Xcode simulator).

When renaming your plugin frameworks, be sure to follow these conventions:

* All frameworks must begin with the prefix `Corona_` followed by the name of the library (the string passed to `require()`).
* Change each dot (`.`) to an underscore (`_`).

For example:

`require "plugin.myCoolLibrary"` &rarr; `Corona_plugin_myCoolLibrary.framework`
