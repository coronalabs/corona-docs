# Installing CORONA_CORE_PRODUCT &mdash; macOS

This guide will help you get up and running with CORONA_CORE_PRODUCT for macOS.

<div class="guides-toc">

* [Installing CORONA_CORE_PRODUCT](#install)
* [Product Activation](#activate)
* [Java Development Kit](#jdk)
* [Text Editors](#editor)
* [Development Environment](#environment)
* [Simulator Options](#simoptions)

</div>


<a id="install"></a>

## Installing CORONA_CORE_PRODUCT

<div class="docs-tip-outer docs-tip-color-alert" style="width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Before proceeding, ensure that your system meets the [core requirements][guide.start.systemReqs#macos] to install Corona.

</div>
</div>

<div class="docs-tip-outer" style="background-color: #ffa752; width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

We'll assume you've already [downloaded](http://developer.coronalabs.com/downloads/coronasdk/) CORONA_CORE_PRODUCT. If not, please do so before continuing.

<a href="http://developer.coronalabs.com/downloads/coronasdk/" target="_blank" class="cta-button">Download CORONA_CORE_PRODUCT</a>

</div>
</div>

1. Locate the application disk image, for example <nobr>`Corona-CURRENT_RELEASE.dmg`</nobr>, and double click it. This should mount the disk image and, once you agree to the terms of service, present you with a disk image window:

<div class="code-indent" style="max-width: 619px;">

![][images.simulator.install-mac-1]

</div>

2. Drag the __Corona__ folder into the __Applications__ folder alias. This will copy the contents of the folder into `/Applications`.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

You can use CORONA_CORE_PRODUCT without installing Apple's Developer Kit or the Android&nbsp;SDK. Later, if you want to build and test your code on a iOS device, you will need to sign up as an [Apple&nbsp;Developer](https://developer.apple.com/devcenter/ios/) and create the necessary certificates and provisioning profiles \([guide][guide.distribution.iOSBuild]\).

</div>
</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

There are two ways to stay current with releases/builds of CORONA_CORE_PRODUCT:

* [Public Release](https://developer.coronalabs.com/downloads/coronasdk) &mdash; The latest stable release of CORONA_CORE_PRODUCT, providing maximum reliability for your projects. This is updated several times a year.

* [Daily Builds](https://developer.coronalabs.com/downloads/daily-builds/) &mdash; The bleeding edge. Daily builds contain the latest features as they are integrated into Corona.

</div>




<a id="activate"></a>

## Product Activation

In order to use CORONA_CORE_PRODUCT, you must be connected to the Internet and perform a simple <nobr>one-time</nobr> authorization process.

1. Open the __Corona Simulator__ from the folder where you installed it.

<div class="code-indent" style="max-width: 320px;">

![][images.simulator.install-mac-2]

</div>

2. The first time you launch, you will be presented with a <nobr>License Agreement (EULA)</nobr>. Read the license terms and click __Agree__.

3. If you've already registered for a Corona account, simply enter your account <nobr>e-mail</nobr> and password to activate the product. Otherwise, click __Register__ to create an account.

4. Upon successful login, you will receive a confirmation dialog. You're ready to get started!




<a id="jdk"></a>

## Java Development Kit

Installing CORONA_CORE_PRODUCT lets you create and test apps locally on your Mac. If you intend to build apps for testing on Android devices, you will need to install the <nobr>__Java Development Kit__</nobr> (JDK). If you try to build an Android app without the JDK installed, the Corona&nbsp;Simulator will help you install it. Alternatively, if you want to install it manually, you can follow these instructions:

1. Go to the [JDK download](http://www.oracle.com/technetwork/java/javase/downloads/index.html) page.
2. Click the __JDK__ download link to obtain the current <nobr>Java Platform (JDK)</nobr>.
3. On the next page, read the license agreement and click the option to accept it if you agree.
4. Locate the <nobr>__Mac OS X__</nobr> link and click it to download the file. This file will be named approximately <nobr>`jdk-8u131-macosx-x64.dmg`</nobr>.
5. When the download is complete, open the `.dmg` and run the installer.




<!---

<a id="coronaeditor"></a>

## Corona Editor (IDE)

[Corona Editor](http://coronalabs.com/products/editor/) offers developers a very capable and lightweight IDE. Corona Editor streamlines development and includes the following:

* __Debugger__ &mdash; set breakpoints and inspect variables.
* __Snippets__ &mdash; get help with syntax and coding conventions.
* __Code completion__ &mdash; save time for all APIs and constants.
* __Docs__ &mdash; bring up APIs directly from your code.
* __Launch__ &mdash; run the current app in the Corona Simulator from Sublime.

For more information, please see the [Corona Editor](http://coronalabs.com/products/editor/) page.

-->




<a id="editor"></a>

## Text Editors

You'll need a text editor or IDE to write code for your CORONA_CORE_PRODUCT projects. If you don't already have a favorite text editor, the following options are recommended:

<div class="inner-table">

Editor																Add-On Package
------------------------------------------------------------------	---------------------------------------------
[Xcode](https://developer.apple.com/xcode/)							[Corona Plugin for Xcode](https://marketplace.coronalabs.com/asset/corona-plugin-for-xcode)
[Atom](https://atom.io)												[autocomplete-corona](http://bit.ly/1SA5cXv)
[Visual Studio Code](https://code.visualstudio.com/)				[Corona Tools](http://bit.ly/1SHiqgK)
[Sublime Text](http://www.sublimetext.com)							[Corona Editor](http://bit.ly/1QGh44H)
[TextMate](http://macromates.com)
[TextWrangler](http://www.barebones.com/products/textwrangler/)
[ZeroBrane Studio](https://studio.zerobrane.com)
[Vim](http://www.vim.org)
------------------------------------------------------------------	---------------------------------------------

</div>




<a id="environment"></a>

## Development Environment

The CORONA_CORE_PRODUCT development environment consists of two aspects: the <nobr>__Corona Simulator__</nobr> and the <nobr>__Corona Simulator Console__</nobr>.

* The __Corona Simulator__ is a visual representation and test environment for your app. What you see in the Simulator is generally what your app will look like&nbsp;— and how it will function&nbsp;— when deployed to an actual device. The Corona&nbsp;Simulator is an essential tool because it allows you to view changes to your code instantly in an active, responsive environment that closely mimics the device.

* The __Corona Simulator Console__ is where you can view diagnostic messages about what's happening in your program.




<a id="simoptions"></a>

## Simulator Options

The Corona Simulator for macOS features the following basic menu items:

* The standard macOS application menu provides access to the Simulator __Preferences__. It also lets you manually open/run __Corona&nbsp;Live&nbsp;Server__ for doing [Live Builds][guide.distribution.liveBuild] on actual devices.

* The __File__ menu is where projects (applications) are created or opened. This is also where you __build__ your apps for distribution or testing on devices. 

* The __Hardware__ menu is used to simulate physical device actions such as rotating the screen.

* The __Window__ menu lets you open the __Welcome&nbsp;Window__ which provides quick access to recent projects, Corona developer resources, and more. This menu also lets you access the Corona&nbsp;Simulator&nbsp;Console (__Console__). Finally, this menu includes options to manipulate the Simulator window or change the skin <nobr>(__Window__ &rarr; __View&nbsp;As__)</nobr>.




<!---

## Building Apps

When you want to build your app for distribution or to test on a device, choose __File__&nbsp;&rarr;&nbsp;__Build__ and select the desired build option. The entire process for each OS is outlined in the following guides:

* [Provisioning and Building — iOS][guide.distribution.iOSBuild]
* [Signing and Building — Android][guide.distribution.androidBuild]
* [Creating macOS Desktop Apps][guide.distribution.osxBuild]

-->




## Getting Started

If you're new to Corona, the most fun way to learn is to [create a simple game][guide.programming.01]. Don't worry if you've never created a mobile app or programmed before&nbsp;&mdash; the chapters in the guide will walk you through the entire process from start to finish!

<div class="walkthrough-nav">

[Chapter 1 &mdash; Creating an App][guide.programming.01] __&rang;__

</div>




## Command Line Usage

To start a particular app in the Corona Simulator without double-clicking it, use a command like this:

```
"/Applications/Corona/Corona Simulator.app/Contents/MacOS/Corona Simulator" ~/CoronaApps/MyApp
```

If the specified directory doesn't contain a `main.lua` file, an error is displayed. Optionally `-project` can be specified (note&nbsp;that this suppresses any error messages if the directory is&nbsp;invalid).

If you don't want the Simulator Console window to automatically appear use the `-no-console` option:

```
"/Applications/Corona/Corona Simulator.app/Contents/MacOS/Corona Simulator" -no-console YES
```

Output from the Simulator will appear on standard output.

If you never want the Simulator to automatically start a console window, but for some reason cannot use the command line, you can run the following command in a Terminal window:

```
defaults write com.coronalabs.Corona_Simulator no-console -bool yes
```

Use this command to turn the Simulator Console back on again:

```
defaults delete com.coronalabs.Corona_Simulator no-console
```

One additional flag is allowed `-debug YES` which allows an IDE to connect a debugger to the Simulator session. Specify it before the directory/file argument.
