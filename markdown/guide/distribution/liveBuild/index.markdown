# Generating Live Builds

<div class="guide-intro">

Corona __live builds__ are a powerful and efficient way to see exactly how your <nobr>in-development</nobr> Corona app will appear on real devices. Benefits include:

</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-bolt" style="margin-left: 1px;"></div>
</div>
<div class="docs-tip-inner-right">

Build and deploy your app just once and then see code/assets update almost instantly on your devices.

</div>
</div>

<div class="docs-tip-outer" style="background-color: #93b0ec;">
<div class="docs-tip-inner-left">
<div class="fa fa-arrows-alt" style="font-size: 31px; margin-top: 2px;"></div>
</div>
<div class="docs-tip-inner-right">

Improve your workflow by testing on multiple devices and different platforms concurrently, all from a single Corona code base.

</div>
</div>

<div class="docs-tip-outer" style="background-color: #a6b0ea;">
<div class="docs-tip-inner-left">
<div class="fa fa-clock-o" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Iterate on projects faster without rebuilding them to see the final result, even if they use native plugins like [ad providers][plugin#ads-monetization] or [game networking][plugin#gaming].

</div>
</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

To use Corona live builds on Windows, you must install [iTunes](https://www.apple.com/itunes/download/).

</div>

<div class="guides-toc">

* [Live Build Creation](#create)
* [Corona Live Server](#cls)
* [Live Build File](#live-build-file)
* [Troubleshooting](#troubleshooting)

</div>


<a id="create"></a>

## Live Build Creation

To create a live build, simply follow these steps:

1. In the Corona&nbsp;Simulator, open the __Build__ dialog window <nobr>(__File__ &rarr; __Build__)</nobr> for either iOS, Android, or tvOS.

<!---

<div class="code-indent">
<div style="max-width: 568px;">

![][images.docs.sim-build-menu-mac]

</div>
</div>

-->

2. Confirm that the first several settings are correct in terms of how you typically build an app from the Corona&nbsp;Simulator. If you're not familiar with preparing/building apps for devices, please see the following guides:

	* [Provisioning and Building — iOS][guide.distribution.iOSBuild]
	* [Signing and Building — Android][guide.distribution.androidBuild]
	* [Signing and Building — Kindle Fire][guide.distribution.kindleBuild]
	* [Apple TV / tvOS][guide.distribution.tvos]

<div class="code-indent">
<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Only __Development__ provisioning profiles <nobr>(iOS or tvOS)</nobr> or __Debug__ keystores <nobr>(Android or Kindle Fire)</nobr> can be used to produce live builds.

</div>
</div>

3. Check the __Create&nbsp;Live&nbsp;Build__ option and, when you're ready, click the __Build__ button.

<style>.inner-table img{ max-width: 450px; }</style>
<div class="code-indent">
<div class="inner-table">

 macOS									 Windows
--------------------------------------	--------------------------------------
 ![][images.docs.live-build-mac]		 ![][images.docs.live-build-windows]
--------------------------------------	--------------------------------------

</div>
</div>

4. After the build is successfully completed, a `.CoronaLiveBuild` file will be created in the project's root directory and the project will be added to [Corona Live Server](#cls).

5. Install the app on your desired device(s) as usual. If you're not familiar with this process, please see the documentation for [iOS][REFLINK 3], [Android][REFLINK 4], [Kindle Fire][REFLINK 5], or [tvOS][REFLINK 6].

<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Note</div>

You can install the same compiled/built app on multiple devices. For example, if you generate a standard `.apk` for Android, you can install it on multiple <nobr>Android-powered</nobr> devices&nbsp;&mdash; you don't need to create a new live build for every device you intend to test on.

</div>
</div>

6. Run the app on the device as usual. Assuming everything is running as expected, code/asset changes that you make in your local project should be reflected almost instantly on the device.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* When you run the app, make sure that the device(s) you're using are on the same local network as the computer where [Corona Live Server](#cls) is running.

* Modifications to project configuration/setup files like `build.settings` and `config.lua` will not typically be reflected when the live build updates. Thus, you should generate a new live build and <nobr>re-install</nobr> it on the target device(s) after modifying these project files.

* If you experience any issues with project syncing, please consult the [Troubleshooting](#troubleshooting) section below.

</div>

<!--- REFERENCE LINKS -->

[REFLINK 3]: ../../../guide/distribution/iOSBuild/index.html#device-installation
[REFLINK 4]: ../../../guide/distribution/androidBuild/index.html#device-installation
[REFLINK 5]: ../../../guide/distribution/kindleBuild/index.html#installation-and-debugging
[REFLINK 6]: ../../../guide/distribution/tvos/index.html#installation




<a id="cls"></a>

## Corona Live Server

__Corona Live Server__ is an application which syncs project changes over your local network. Every time you [create a live build](#create), the Corona&nbsp;Simulator will initiate it and automatically add the built project to the Corona&nbsp;Live&nbsp;Server project list.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* In order to sync a project, Corona&nbsp;Live&nbsp;Server must find a valid `.CoronaLiveBuild` file. As outlined above, this will be created when doing a live build for the project.

* To start Corona Live Server manually, select <nobr>__Corona Simulator__ &rarr; __Corona Live Server__</nobr>.

* You can add a project by pressing [__+__] and selecting the folder containing the project, or by simply dragging and dropping a folder onto the Corona&nbsp;Live&nbsp;Server dock icon (macOS) or shortcut (Windows).

* Clicking the "close" button on the Corona Live Server window does __not__ shut it down. To exit/quit entirely, do so from its main application menu or, alternatively, from the <nobr>right-click</nobr> context menu of the dock icon (macOS) or system tray icon (Windows).
 
* Closing the project list window will not stop Corona&nbsp;Live&nbsp;Server. You can <nobr>re-open</nobr> the window from the __Window__ menu or by clicking on the Corona&nbsp;Live&nbsp;Server dock icon (macOS) or system tray icon (Windows).

</div>




<a id="live-build-file"></a>

## Live Build File

Once a live build is successfully created, the source project will contain a hidden `.CoronaLiveBuild` file in its root directory. This file contains the information required to synchronize the project between the device and the development machine.

Typically, you will __not__ need to edit the contents of this file. However, in very specific cases, it can be modified to customize the behavior of live builds and Corona&nbsp;Live&nbsp;Server:

``````
key = XXXXXXXX-YYYY-ZZZZ-WWWW-AAA0987654321
#ip =
#port =
``````

* `key` &mdash; Do __not__ modify this property. This <nobr>auto-generated</nobr> key allows the live build and Corona&nbsp;Live&nbsp;Server to properly communicate.
* `ip`/`port` &mdash; Remove the `#` from each and specify these two values to use a static address and disable automatic discovery. This will enable live builds to work on older Android devices and, potentially, resolve some network issues. The `port` value should be a number between `1025` and `65534`.




<a id="troubleshooting"></a>

## Troubleshooting

If the live build doesn't update/refresh, please proceed through the following instructions. If functionality returns to normal at any step along the way, do not proceed further.

1. Ensure that both your computer and the device are connected to the same local network.
2. Make sure your computer is running Corona&nbsp;Live&nbsp;Server with the same project you're running on the device.
3. Turn off Wi-Fi on the device, wait several seconds, and turn it back on.
4. Wait for "discoverability" to take effect. Depending on the network, this may take up to a minute.
5. Quit Corona Live Server, then completely close/exit your app on the device. Note that merely closing the window does not quit Corona&nbsp;Live&nbsp;Server &mdash; you must explicitly exit/quit the application.
6. Restart Corona Live Server and manually add your project to the list of synced projects as outlined in the [Corona Live Server](#cls) section above.
7. Remove/uninstall the live build from the device.
8. Rebuild the app and make sure that __Create&nbsp;Live&nbsp;Build__ is selected from the build dialog window. Also, remember that only __Development__ provisioning profiles <nobr>(iOS or tvOS)</nobr> or __Debug__ keystores <nobr>(Android or Kindle Fire)</nobr> can be used to produce live builds.
9. Start your app on the device and test for proper functionality. If the live build still doesn't update, experiment with modifying the `.CoronaLiveBuild` file as outlined in the [Live Build File](#live-build-file) section above.
10. If you need further assistance beyond this, please consult the [Corona Forums](https://forums.coronalabs.com/forum/658-corona-live-server/).
