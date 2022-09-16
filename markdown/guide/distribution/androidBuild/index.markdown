# Signing and Building &mdash; Android

This guide explains how to sign, build, and test your app on Android devices.

<div class="guides-toc">

* [Java Package Name](#javapackage)
* [Build Process](#building)
* [Device Installation](#installapp)
* [Debugging](#debugapp)

</div>


<div class="guide-notebox">
<div class="notebox-title title-nomargin">Notes</div>

* You do not need to install the Android SDK. However, you will need to install the proper version of the __Java&nbsp;Development&nbsp;Kit__ if you're using Windows. See the [Java Development Kit][guide.start.installWin#jdk] section for details.

* The Android build process generates two files: an `.apk` and an `.aab` file. You can build and test apps on Android devices without creating a [Google&nbsp;developer&nbsp;account](https://developers.google.com), but you will need an account if you wish to publish to the [Google&nbsp;Play](https://play.google.com/store) marketplace.
	
* The [Android App Bundle](https://developer.android.com/platform/technology/app-bundle) file, `.aab`, is automatically generated when you build for Android. You can use this file to submit your apps or games to Google Play.

* We only support Android devices that run <nobr>__Android 4.0.3__</nobr> or higher with an __ARMv7__ processor. This can create some confusion because ARM processors are identified by both a __family__ and an __architecture__. Family names do not have a __"v"__ in them. For instance, the ARM7 processor is actually a ARMv3 architecture, and ARM11 is a ARMv6 architecture. See [this guide](https://en.wikipedia.org/wiki/List_of_ARM_microarchitectures) to help identify the various processors.

</div>




<a id="javapackage"></a>

## Java Package Name

When you build an Android app using Solar2D, you must specify a __package&nbsp;name__. In general, you can specify any package name you like, but it must be chosen carefully because it should be unique to your application.

The traditional Java scheme is to use the <nobr>reverse-domain</nobr> format like `com.acme`, then append the name of a division/product, and finally append the name of the app. For example, `com.acme.games.catchafish` would be a good package name, assuming you own the `acme.com` domain name.

In some cases, the package name that results from using <nobr>reverse-domain</nobr> format may not be valid, and it must be modified before Solar2D will build your Android app. This would be true in any of the following cases:

* The package name contains a hyphen or other special character (`com.three-amigos` for example). In this case, convert the special character to an underscore: `com.three_amigos`.

* One of the name components contains a digit or other invalid character at the beginning of an identifier (`com.3amigos` for example). In this case, try to convert the package name to something like `com.threeamigos`.

* One of the name components contains a keyword, for example `com.private.idaho`. In this case, suffix that part of the package name with an underscore: `com.private_.idaho`.




<a id="building"></a>

## Build Process

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* If you aren't familiar with the available [build settings][guide.distribution.buildSettings#androidsettings] for an app, please review them before proceeding with this section.

* Make sure that your Android device is enabled as a development device.

</div>

1. From the Solar2D Simulator, select __File__ &rarr; __Open...__ to load the project you wish to build.

2. Select __File__ &rarr; __Build__ &rarr; __Android...__.

3. Fill in the information:

	* __Application Name__ &mdash; by default, this will match your project folder; keep this name or specify another.

	* __Version Code__ &mdash; this value must be an __integer__. Each time you update your app, you must increase the version code. It corresponds to the `versionCode` item detailed [here](https://developer.android.com/guide/topics/manifest/manifest-element.html). It is not visible to users.

	* __Version Name__ &mdash; specify a version name for your app.

	* __Package__ &mdash; see [Java Package Name](#javapackage) above.

	* __Target App Store__ &mdash; select __Google Play__ from the pull-down list.

	* __Keystore__ / __Key Alias__ &mdash; in order to build for Android devices, you must digitally sign your app using a __keystore__. Please refer to either [Signing&nbsp;for&nbsp;Debug&nbsp;Build](#signdebug) or [Signing&nbsp;for&nbsp;Release&nbsp;Build](#signrelease) below.

	* __Save to Folder__ &mdash; specify where to save the compiled app.

	* __After Build__ &mdash; select which action should be performed after the app is successfully built.

	* __Create Live Build__ &mdash; check this box to create a live build for <nobr>lightning-fast</nobr> testing. See [Generating Live Builds][guide.distribution.liveBuild] for details.

4. Click __Build__ and Solar2D will compile the app into a standard `.apk` file.

<a id="signdebug"></a>

<div class="guide-notebox">
<div class="notebox-title">Signing for Debug Build</div>

For debug builds, Solar2D includes a `debug.keystore` for testing your app on devices. To use it, follow these steps:

1. Select __Debug__ from the __Keystore__ menu.

2. Directly to the right, __Browse...__ to the keystore file in the Solar2D SDK application folder:

<div class="code-indent">

Windows &mdash; <nobr>`C:\Program Files (x86)\Corona Labs\Corona\Resources\debug.keystore`</nobr>

macOS &mdash; <nobr>`/Applications/Corona/Resources/Resource Library/Android/debug.keystore`</nobr>

</div>

3. Select the file and enter `android` as the password.

4. In the __Key Alias__ menu, select `androiddebugkey`.

</div>

<a id="signrelease"></a>

<div class="guide-notebox">
<div class="notebox-title">Signing for Release Build</div>

For release builds, you must sign with your __private&nbsp;key__. You can generate this key using the command line program __Keytool__. Please follow these simple steps:

1. Open the __Command Prompt__ in Windows or the __Terminal__ in macOS. Once there, use the `cd` command to change to the directory where you'll keep your keystores.

2. Type the following command at the prompt, replacing `mykeystore` with the name of your application and `aliasname` with a similar or equal alias name.

<div class="code-indent">

`keytool -genkey -v -keystore mykeystore.keystore -alias aliasname -keyalg RSA -validity 999999 -deststoretype JKS`

</div>
    
3. You'll be prompted for your credentials. Supply the requested information and tap __enter__ to sign your Android app.

</div>




<a id="installapp"></a>

## Device Installation

There are four methods to install an app on an Android device. You can __not__ simply copy the `.apk` file over to the device.

### Copy to Device

If you're using the Solar2D&nbsp;Simulator for macOS, you can copy the app directly to a connected device. This feature is not supported on Windows.

1. Connect your device.

2. Follow the steps outlined in [Build Process](#building) above, ensuring that you select <nobr>__Copy to device and launch__</nobr> for the __After&nbsp;Build__ option.

### Android SDK

If you have already installed the __Android&nbsp;SDK__, use `adb install -r your-app.apk`.

### Web Server

Upload the `.apk` to a web server. Next, point your Android device's web browser to the file's URL to download the app to the device. Finally, click on the file in the __Download&nbsp;History__ to install it.

If this method fails, and the application downloads as a text file, you may need to add the following configuration line to a `.htaccess` file in the application's directory on the web server:

`AddType application/vnd.android.package-archive .apk`

Also, you should set your device to install non-Market applications if you are using `debug.keystore`. Click the __Settings__ icon on the device, select __Applications__, then check the box next to __Unknown&nbsp;Sources__.

### App Installer

Obtain an app installer from Google Play to assist with the process.




<a id="debugapp"></a>

## Debugging

Google's Android SDK provides a set of tools known as __Android&nbsp;Debug&nbsp;Bridge__ or __adb__. These tools let you look at the device's console log, install, and replace existing apps on your device. You can execute the `adb` command from the macOS __Terminal__ or from the Windows __Command&nbsp;Prompt__. A GUI tool called __monitor__ is also installed; it can be used to examine the log file and capture screen shots from your device.

For more details on Android debugging, see the [Debugging Guide][guide.basics.debugging].
