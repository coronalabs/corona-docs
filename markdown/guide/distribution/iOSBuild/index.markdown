# Provisioning and Building &mdash; iOS

This guide explains how to set up your system and devices in the [Apple Developer](https://developer.apple.com/) portal. It also explains how to build your apps for testing or distribution.

<div class="guides-toc">

* [Creating Certificates](#certificate)
* [Registering Devices](#devices)
* [Creating App IDs](#appID)
* [Creating Provisioning Profiles](#provisioning)
* [Build Process](#building)
* [Device Installation](#installapp)
* [Refreshing Profiles](#refresh)

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you are on a Non-Apple Computer (i.e Windows or Linux) and want to build for iOS, check this [Solar2D tool](https://github.com/solar2d/demo-app-store-automation)

</div>

<a id="certificate"></a>

## Creating Certificates

1. You must have an [Apple Developer](https://developer.apple.com/) account to install/test apps on iOS devices and publish to the App&nbsp;Store. Once registered and logged in, enter the __Member&nbsp;Center__, navigate to the __Certificates,&nbsp;Identifiers&nbsp;&amp;&nbsp;Profiles__ dashboard, and click on __Certificates__ within the __iOS&nbsp;Apps__ column. Alternatively, if you've already entered the __iOS&nbsp;Apps__ section from another page within the portal, click the __All__ button under __Certificates__ in the left column.

2. In the upper-right corner, click the \[__+__\] button to create a new certificate.

3. You'll be prompted to choose which type of certificate to create. There are two types which pertain to this guide:

	* __Development__ &rarr; __iOS App Development__ &mdash; use this during development to test on your own devices.

	* __Production__ &rarr; __App Store and Ad Hoc__ &mdash; use this only for submission to the App Store or to install your app on a limited number of registered devices.

4. Select the type and click __Continue__ at the bottom. You'll be prompted to generate a new certificate. As indicated in the instructions, open the __Keychain&nbsp;Access__ tool from the __Applications__ &rarr; __Utilities__ folder.

5. From the main __Keychain Access__ menu, select __Certificate&nbsp;Assistant__ &rarr; __Request&nbsp;a&nbsp;Certificate From a&nbsp;Certificate&nbsp;Authority__. You will be presented with a form containing the following fields:

	* __User Email Address__ &mdash; enter the email address associated with your Apple Developer account.

	* __Common Name__ &mdash; enter your name or company/team name.

	* __CA Email Address__ &mdash; this field is __not__ required, since you will save the certificate to disk.

	* __Request is:__ &mdash; select __Saved to disk__.

6. Click __Continue__ and then specify where to save the file (Desktop&nbsp;is&nbsp;fine). This will generate the certificate signing request. Click __Done__ in the next window.

7. Back in the developer portal, proceed to the next step, titled __Generate&nbsp;your&nbsp;certificate__. Near the bottom, under __Upload&nbsp;CSR&nbsp;file__, click the __Choose&nbsp;File...__ button and select the file you just created. Click the __Generate__ button to confirm.

8. The final step is to download and install the certificate on your local keychain. Follow the instructions provided on the screen.

9. Back in the __Certificates__ section of the developer portal, the new certificate should appear.




<a id="devices"></a>

## Registering Devices

Some guides begin with creating App IDs, but we recommend that you register your devices first. This will save you the task of modifying and <nobr>re-downloading</nobr> the provisioning profiles later.

1. Connect the device, open Xcode, and then open the __Devices__ window by selecting __Window__ &rarr; __Devices__.

2. In the left column, select the device. If this is the first time you're using the device for development purposes, you may need to enable it for development by selecting __Use&nbsp;device&nbsp;for&nbsp;development__ in the main pane.

3. Back in the developer portal, click the __All__ button under __Devices__ in the left column.

4. In the upper-right corner, click the \[__+__\] button to register a new device.

5. You'll be prompted to register either one device or multiple devices. If you choose the first option, enter the following information:

	* __Name__ &mdash; this name is only visible to you and helps to identify the device.

	* __UDID__ &mdash; this 40-character hexadecimal value is the Unique&nbsp;Device&nbsp;Identifier for the device. You can locate this by opening the Xcode __Devices__ window, selecting the device in the left column, looking for __Identifier__ in the information panel, <nobr>right-clicking</nobr> the value, and selecting __Copy__.

6. Click __Continue__ to register the device. Back in the __Devices__ section of the developer portal, the new device should appear.

7. Repeat this process for all of your additional devices.




<a id="appID"></a>

## Creating App IDs

Next, you must create a new __App&nbsp;ID__ for your Corona app.

1. In the developer portal, click the __App&nbsp;IDs__ button under __Identifiers__ in the left column.

2. In the upper-right corner, click the \[__+__\] button to create a new App&nbsp;ID.

3. Fill in the information:

	* __App ID Description__ &mdash; only you will see this; it helps you identify the app.

	* __App ID Prefix__ &mdash; this should be set to the __Team&nbsp;ID__ that's associated with your developer account.

	* __App ID Suffix__ &mdash; this is not visible to consumers, but it must be unique. Apple recommends that you specify the __Bundle&nbsp;ID__ in <nobr>reverse-domain</nobr> format, for example `com.domainname.myapp`.

	* __App Services__ &mdash; select the services you would like to enable.

4. Click __Continue__. This should lead to a screen where you can confirm the App&nbsp;ID details. Click __Submit__ to complete the creation of the App&nbsp;ID. Back in the __App&nbsp;IDs__ section of the developer portal, the new ID should appear.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Do __not__ specify `CFBundleIdentifier` in the <nobr>`iphone` &rarr; `plist`</nobr> section of `build.settings`. Corona will use the ID from the provisioning profile for this purpose.

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you configure an App ID __without__ additional services like Push&nbsp;Notifications, and later __add__ those features to the App&nbsp;ID, you must reinstall the provisioning profile by repeating all of the download and installation steps outlined in the next section. Thus, it's best to select all of the services which you intend to utilize in the app.

</div>




<a id="provisioning"></a>

## Creating Provisioning Profiles

All iOS apps require that you use provisioning profiles during development. You cannot run an app on a device until you provision that device for development.

1. In the developer portal, click the __All__ button under __Provisioning&nbsp;Profiles__ in the left column.

2. In the upper-right corner, click the \[__+__\] button to create a new provisioning profile.

3. You'll be prompted to choose which type of provisioning profile to create.

	* __Development: iOS App Development__ &mdash; use this during development to test on your own devices.

	* __Distribution: App Store__ &mdash; use this only for submission to the App Store.

	* __Distribution: Ad Hoc__ &mdash; use this to install your app on a limited number of registered devices.

4. Select the type you want to create and click __Continue__. On the next screen, you'll be prompted to select the __App&nbsp;ID__ to associate with the profile. Assuming you've created at least one App&nbsp;ID, select it from the list and click __Continue__. If you haven't created any App&nbsp;IDs, please see [Creating&nbsp;App&nbsp;IDs](#appID) above.

5. Next, you must associate at least one __certificate__ with the provisioning profile. Select the appropriate certificate(s) from the list and click __Continue__. Note that the provisioning profile must be associated with a matching certificate type. For example, if you want to create a provisioning profile for distribution, you must first create a distribution certificate. If no certificates exist for the type of profile you wish to create, the system will prompt you to create one&nbsp;&mdash; in this case, please see [Creating Certificates](#certificate) above.

6. Now proceed to the proper section below, since the steps vary for each profile type.

### Development

1. You must associate at least one __device__ with the development provisioning profile. Select the device(s) from the list and click __Continue__. If you haven't registered any devices, please see [Registering&nbsp;Devices](#devices) above.

2. On the next screen, you must provide a __Profile&nbsp;Name__ for the provisioning profile. This will be used to identify the profile in the developer portal. Also, confirm the settings that you made in the previous steps. When you're ready, click __Generate__ to create the profile.

3. Next, download and install the provisioning profile (click the __Download__ button and then <nobr>double-click</nobr> the file).

4. Back in the developer portal, click __Done__. The new profile should appear in the list, marked as __Active__ in the __Status__ column.

5. Now you must install the profile on each device that you selected during the profile creation. Connect the device to your computer and __Sync__ it from within __iTunes__. When it's done, open the Xcode __Devices__ window, <nobr>right-click</nobr> the device image in the left column, and select __Show&nbsp;Provisioning&nbsp;Profiles...__ from the contextual menu. The new profile should appear in the list.

6. Finally, to associate the new profile with Corona, restart the Corona Simulator. The profile should appear as a __Code&nbsp;Signing&nbsp;Identity__ in the build window. See [Build&nbsp;Process](#building) below for more details.

### Distribution: App Store

1. You must provide a __Profile&nbsp;Name__ for the provisioning profile. This will be used to identify the profile in the developer portal. Also, confirm the settings that you made in the previous steps. When you're ready, click __Generate__ to create the profile.

2. Next, download and install the provisioning profile (click the __Download__ button and then <nobr>double-click</nobr> the file).

3. Back in the developer portal, click __Done__. The new profile should appear in the list, marked as __Active__ in the __Status__ column.

4. Finally, to associate the new profile with Corona, restart the Corona Simulator. The profile should appear as a __Code&nbsp;Signing&nbsp;Identity__ in the build window. See [Build&nbsp;Process](#building) below for more details.

### Distribution: Ad Hoc

1. You must associate at least one __device__ with the ad hoc provisioning profile. Select the device(s) from the list and click __Continue__. If you haven't registered any devices, please see [Registering&nbsp;Devices](#devices) above.

2. On the next screen, you must provide a __Profile&nbsp;Name__ for the provisioning profile. This will be used to identify the profile in the developer portal. Also, confirm the settings that you made in the previous steps. When you're ready, click __Generate__ to create the profile.

3. Next, download and install the provisioning profile (click the __Download__ button and then <nobr>double-click</nobr> the file).

4. Back in the developer portal, click __Done__. The new profile should appear in the list, marked as __Active__ in the __Status__ column.

5. Now you must install the profile on each device that you selected during the profile creation. Connect the device to your computer and __Sync__ it from within __iTunes__. When it's done, open the Xcode __Devices__ window, <nobr>right-click</nobr> the device image in the left column, and select __Show&nbsp;Provisioning&nbsp;Profiles...__ from the contextual menu. The new profile should appear in the list.

6. Finally, to associate the new profile with Corona, restart the Corona Simulator. The profile should appear as a __Code&nbsp;Signing&nbsp;Identity__ in the build window. See [Build&nbsp;Process](#building) below for more details.




<a id="building"></a>

## Build Process

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you aren't familiar with the available [build settings][guide.distribution.buildSettings#iOSsettings] for an app, please review them before proceeding with this section.

</div>

Building your app is a simple process once you have your certificate and provisioning profiles installed. You can build your application for testing in the Xcode iOS Simulator or on a device.

1. From the Corona Simulator, select __File__ &rarr; __Open...__ to load the project you wish to build.

2. Select __File__ &rarr; __Build__ &rarr; __iOS...__

3. Fill in the information:

	* __Application Name__ &mdash; by default, this will match your project folder; keep this name or specify another.

	* __Version__ &mdash; specify a version name for your app.

	* __Supported Devices__ &mdash; select either <nobr>__iPhone&nbsp;+&nbsp;iPad (Universal)__</nobr>, __iPhone&nbsp;only__, or __iPad&nbsp;only__ depending on your target device(s).

	* __Provisioning Profile__ &mdash; select the appropriate provisioning profile for either __development__ or __distribution__.

	* __iOS SDK__ &mdash; select the version of iOS to build for.

	* __Save to Folder__ &mdash; specify where to save the compiled app.

	* __After Build__ &mdash; select which action should be performed after the app is successfully built.

	* __Create Live Build__ &mdash; check this box to create a live build for <nobr>lightning-fast</nobr> testing. See [Generating Live Builds][guide.distribution.liveBuild] for details.

4. Click __Build__ and Corona will compile the app. You will then have an application file that can be loaded on a device or submitted to the App Store, depending on which provisioning profile you selected.




<a id="installapp"></a>

## Device Installation

There are three methods to install an app on an iOS device, as outlined below.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

You can __not__ test an app built for __App&nbsp;Store&nbsp;Distribution__ on a device. Apps built for distribution are intended for submission to Apple.

</div>
</div>

### Copy to Device

1. Connect your device.

2. Follow the steps outlined in [Build Process](#building) above, ensuring that you select <nobr>__Copy to device__</nobr> for the __After&nbsp;Build__ option.

### Xcode

1. Connect your device, open __Xcode__, and then open the __Devices__ window by selecting <nobr>__Window__ &rarr; __Devices__</nobr>.

2. In the left column, select the device.

3. In the main pane, look for the __Installed&nbsp;Apps__ section which shows the currently installed apps (this&nbsp;list may be empty initially). Below the list, click the \[__+__\] button and navigate to the location of the `.app` file which was generated by Corona. Select the file and click __Open__. Assuming there are no provisioning/certificate errors, the app should install on the device.

### iTunes

1. Connect your device and ensure that __iTunes__ is open.

2. Select __File__ &rarr; __Add to Library...__ <nobr>(⌘-O)</nobr> and navigate to the `.app` file that was generated by Corona. Alternatively, drag the file over the iTunes dock icon and release.

3. The view should change to the device's info screen and show all installed apps. Confirm that your app is listed in the __Apps__ menu on the left.

4. __Sync__ the device and the app should install. Note that iTunes can be particular about app versions&nbsp;&mdash; if you repeatedly test new versions of your app, you should remove the previous version from the device before installing the new version. This will ensure that the most current version is installed.




<a id="refresh"></a>

## Refreshing Profiles

On occasion, you may need to refresh the provisioning profiles via Xcode. This can be accomplished as follows:

1. In Xcode, open the __Preferences__ window by selecting __Xcode__ &rarr; __Preferences...__.

1. Select __Accounts__ from the upper tab bar.

1. Select the desired account under __Apple&nbsp;IDs__ in the left pane.

1. In the lower-right section, click the __View&nbsp;Details...__ button.

1. A panel should open, showing the associated provisioning profiles. In the <nobr>lower-right</nobr> section of this panel, click on the small "refresh" button.

1. Quit and restart both Xcode and the Corona Simulator and proceed with the [build&nbsp;process](#building).
