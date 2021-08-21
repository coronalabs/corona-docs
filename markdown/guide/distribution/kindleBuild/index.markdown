# Signing and Building &mdash; Kindle&nbsp;Fire

This guide explains how to sign, build, and test your app on Amazon's Kindle&nbsp;Fire devices.

<div class="guides-toc">

* [Preparing for Kindle Fire](#specs)
* [Java Package Name](#javapackage)
* [Build Process](#signing)
* [Installation and Debugging](#installapp)

</div>


<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* You do not need to install the Android SDK. However, you will need to install the proper version of the __Java&nbsp;Development&nbsp;Kit__ if you're using Windows. See the [Java Development Kit][guide.start.installWin#jdk] section for details.

* As with Android, the Kindle&nbsp;Fire build process generates a standard `.apk` file.

</div>


<a id="specs"></a>

## Preparing for Kindle Fire

You don't need to do anything different to prepare your app for release on Kindle&nbsp;Fire, but you should note the following device specifications and design your app content accordingly. Specifications listed below are in pixels.

<div class="inner-table">

Model					Resolution (w&times;h)		 Status Bar (top)	 Soft Keys Bar (bottom)
----------------------	--------------------------	------------------	------------------------
Kindle Fire				600 &times; 1024					27					60
Kindle Fire HD 7"		800 &times; 1280					35					78
Kindle Fire HD 8.9"		1200 &times; 1920					40					90
----------------------	--------------------------	------------------	------------------------

</div>

Also, note that Amazon prefers apps to occupy the entire screen. If you set the scale to `letterbox` in `config.lua`, make sure that you fill the "empty" space with actual content. See [here][guide.basics.configSettings#contentscaling] for more information on content and scaling.




<a id="javapackage"></a>

## Java Package Name

When you build a Kindle Fire app using Solar2D, you must specify a __package&nbsp;name__. In general, you can specify any package name you like, but it must be chosen carefully because it should be unique to your application.

The traditional Java scheme is to use the <nobr>reverse-domain</nobr> format like `com.acme`, then append the name of a division/product, and finally append the name of the app. For example, `com.acme.games.catchafish` would be a good package name, assuming you own the `acme.com` domain name.

In some cases, the package name that results from using <nobr>reverse-domain</nobr> format may not be valid, and it must be modified before Solar2D will build your Kindle&nbsp;Fire app. This would be true in any of the following cases:

* The package name contains a hyphen or other special character (`com.three-amigos` for example). In this case, convert the special character to an underscore: `com.three_amigos`.

* One of the name components contains a digit or other invalid character at the beginning of an identifier (`com.3amigos` for example). In this case, try to convert the package name to something like `com.threeamigos`.

* One of the name components contains a keyword, for example `com.private.idaho`. In this case, suffix that part of the package name with an underscore: `com.private_.idaho`.




<a id="signing"></a>

## Build Process

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you aren't familiar with the available [build settings][guide.distribution.buildSettings#androidsettings] for an app, please review them before proceeding with this section.

</div>

1. From the Solar2D Simulator, select __File__ &rarr; __Open...__ to load the project you wish to build.

2. Select __File__ &rarr; __Build__ &rarr; __Android...__.

3. Fill in the information:

	* __Application Name__ &mdash; by default, this will match your project folder; keep this name or specify another.

	* __Version Code__ &mdash; this value must be an __integer__. Each time you update your app, you must increase the version code. It corresponds to the `versionCode` item detailed [here](https://developer.android.com/guide/topics/manifest/manifest-element.html). It is not visible to users.

	* __Version Name__ &mdash; specify a version name for your app.

	* __Package__ &mdash; see [Java Package Name](#javapackage) above.

	* __Target App Store__ &mdash; select __Amazon__ from the pull-down list.

	* __Keystore__ / __Key Alias__ &mdash; in order to build for Android devices, you must digitally sign your app using a __keystore__. Please refer to either [Signing&nbsp;for&nbsp;Debug&nbsp;Build](#signdebug) or [Signing&nbsp;for&nbsp;Release&nbsp;Build](#signrelease) below.

	* __Save to Folder__ &mdash; specify where to save the compiled app.

	* __After Build__ &mdash; select which action should be performed after the app is successfully built.

	*__Create Live Build__ &mdash; check this box to create a live build for <nobr>lightning-fast</nobr> testing. See [Generating Live Builds][guide.distribution.liveBuild] for details.

4. Click __Build__ and Solar2D will compile the app into a standard `.apk` file.

<a id="signdebug"></a>

<div class="guide-notebox">
<div class="notebox-title">Signing for Debug Build</div>

For debug builds, Solar2D includes a `debug.keystore` for testing your app on devices. To use it, follow these steps:

1. Select __Debug__ from the __Keystore__ menu.

2. Directly to the right, __Browse...__ to the keystore file in the Solar2D application folder:

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

`keytool -genkey -v -keystore mykeystore.keystore -alias aliasname -keyalg RSA -validity 999999`

</div>
    
3. You'll be prompted for your credentials. Supply the requested information and tap __enter__ to sign your Android app.

</div>




<a id="installapp"></a>

## Installation and Debugging

Once your app is compiled via Solar2D, the next step is to register as an [Amazon Developer](https://developer.amazon.com/home.html), configure your Kindle&nbsp;Fire for testing, and test/debug the app on a Kindle&nbsp;Fire device or the <nobr>Kindle Fire Emulator</nobr>.

1. If you haven't already signed up for an [Amazon Developer](https://developer.amazon.com/home.html) account, please do so first.

2. Next, you'll need to set up your Kindle&nbsp;Fire tablet for testing. You can use <nobr>__Android Debug Bridge__</nobr> to connect your Kindle&nbsp;Fire tablet to a development computer for testing and debugging. Please refer to Amazon's [instructional guide](https://developer.amazon.com/appsandservices/resources/development-tools/ide-tools/tech-docs/05-setting-up-your-kindle-fire-tablet-for-testing) for details.

3. Finally, you can refer to [this guide](https://developer.amazon.com/appsandservices/resources/development-tools/ide-tools/tech-docs/06-testing-your-app-on-an-emulator-or-tablet) for details on testing your app.
