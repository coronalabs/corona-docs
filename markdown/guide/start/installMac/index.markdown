# Installing CORONA_CORE_PRODUCT &mdash; macOS

This guide will help you get up and running with CORONA_CORE_PRODUCT for macOS.

<div class="guides-toc">

* [Installing CORONA_CORE_PRODUCT](#install)
* [Java Development Kit](#jdk)
* [Text Editors](#editor)
* [Development Environment](#environment)
* [Simulator Options](#simoptions)
* [Command Line Usage](#cmdusage)

</div>


<a id="install"></a>

## Installing CORONA_CORE_PRODUCT

<div class="docs-tip-outer docs-tip-color-alert" style="width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Before proceeding, ensure that your system meets the [core requirements][guide.start.systemReqs#macos] to install CORONA_CORE_PRODUCT.

</div>
</div>

<div class="docs-tip-outer" style="background-color: #ffa752; width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-check-square" style="font-size: 34px; padding-left: 1px; padding-top: 4px;"></div>
</div>
<div class="docs-tip-inner-right">

We'll assume you've already downloaded [CORONA_CORE_PRODUCT](REVISION_URL). If not, please do so before continuing.

<a href="https://github.com/coronalabs/corona/releases" target="_blank" class="cta-button">Download CORONA_CORE_PRODUCT</a>

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




<a id="jdk"></a>

## Java Development Kit

<div class="docs-tip-outer docs-tip-color-alert" style="width: 100%;">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Installing JDK is no longer required for CORONA_CORE_PRODUCT 2020.3629 and later.

</div>
</div>

Installing CORONA_CORE_PRODUCT lets you create and test apps locally on your Mac. If you intend to build apps for testing on Android devices, you will need to install the <nobr>__Java Development Kit__</nobr> (JDK). If you try to build an Android app without the JDK installed, the CORONA_CORE_PRODUCT Simulator will help you install it. Alternatively, if you want to install it manually, you can follow these instructions:

1. Go to [JDK8 download](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html) page.
2. Click the __JDK__ download link to obtain the corresponding <nobr>Java Platform (JDK)</nobr>.
3. On the next page, read the license agreement and click the option to accept it if you agree.
4. Locate the <nobr>__Mac OS X__</nobr> link and click it to download the file. This file will be named approximately <nobr>`jdk-8u261-macosx-x64.dmg`</nobr>.
5. When the download is complete, open the `.dmg` and run the installer.




<!---

<a id="coronaeditor"></a>

## Corona Editor (IDE)

[Corona Editor](https://github.com/coronalabs/CoronaSDK-SublimeText) offers developers a very capable and lightweight IDE. Corona Editor streamlines development and includes the following:

* __Debugger__ &mdash; set breakpoints and inspect variables.
* __Snippets__ &mdash; get help with syntax and coding conventions.
* __Code completion__ &mdash; save time for all APIs and constants.
* __Docs__ &mdash; bring up APIs directly from your code.
* __Launch__ &mdash; run the current app in the Corona Simulator from Sublime.

For more information, please see the [Corona Editor](https://github.com/coronalabs/CoronaSDK-SublimeText) page.

-->




<a id="editor"></a>

## Text Editors

You'll need a text editor or IDE to write code for your CORONA_CORE_PRODUCT projects. If you don't already have a favorite text editor, the following options are recommended:

<div class="inner-table">

Editor																Add-On Package
------------------------------------------------------------------	---------------------------------------------
[Sublime Text](https://www.sublimetext.com)							[Solar2D Editor](https://github.com/coronalabs/CoronaSDK-SublimeText)
[Visual Studio Code](https://code.visualstudio.com/)				[Solar2d-companion](https://marketplace.visualstudio.com/items?itemName=M4adan.solar2d-companion)
[Xcode](https://developer.apple.com/xcode/)							[Xcode Editor](https://github.com/jcbnlsn/Xcode-Corona-Editor)
[ZeroBrane Studio](https://studio.zerobrane.com)
[TextMate](https://macromates.com)
[Vim](https://www.vim.org)
------------------------------------------------------------------	---------------------------------------------

</div>




<a id="environment"></a>

## Development Environment

The CORONA_CORE_PRODUCT development environment consists of two aspects: the <nobr>__Solar2D Simulator__</nobr> and the <nobr>__Solar2D Simulator Console__</nobr>.

* The __Solar2D Simulator__ is a visual representation and test environment for your app. What you see in the Simulator is generally what your app will look like&nbsp;— and how it will function&nbsp;— when deployed to an actual device. The CORONA_CORE_PRODUCT Simulator is an essential tool because it allows you to view changes to your code instantly in an active, responsive environment that closely mimics the device.

* The __Solar2D Simulator Console__ is where you can view diagnostic messages about what's happening in your program.




<a id="simoptions"></a>

## Simulator Options

The CORONA_CORE_PRODUCT Simulator for macOS features the following basic menu items:

* The standard macOS application menu provides access to the Simulator __Preferences__. It also lets you manually open/run __Corona&nbsp;Live&nbsp;Server__ for doing [Live Builds][guide.distribution.liveBuild] on actual devices.

* The __File__ menu is where projects (applications) are created or opened. This is also where you __build__ your apps for distribution or testing on devices.

* The __Hardware__ menu is used to simulate physical device actions such as rotating the screen.

* The __Window__ menu lets you open the __Welcome&nbsp;Window__ which provides quick access to recent projects, CORONA_CORE_PRODUCT developer resources, and more. This menu also lets you access the Simulator&nbsp;Console (__Console__). Finally, this menu includes options to manipulate the Simulator window or change the skin <nobr>(__Window__ &rarr; __View&nbsp;As__)</nobr>.




<!---

## Building Apps

When you want to build your app for distribution or to test on a device, choose __File__&nbsp;&rarr;&nbsp;__Build__ and select the desired build option. The entire process for each OS is outlined in the following guides:

* [Provisioning and Building — iOS][guide.distribution.iOSBuild]
* [Signing and Building — Android][guide.distribution.androidBuild]
* [Creating macOS Desktop Apps][guide.distribution.osxBuild]

-->

<a id = "cmdusage"></a>

## Command Line Usage

To start a particular app in the CORONA_CORE_PRODUCT Simulator without double-clicking it, use a command like this:

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



## Getting Started

If you're new to CORONA_CORE_PRODUCT, the most fun way to learn is to [create a simple game][guide.programming.01]. Don't worry if you've never created a mobile app or programmed before&nbsp;&mdash; the chapters in the guide will walk you through the entire process from start to finish!

<div class="walkthrough-nav">

[Chapter 1 &mdash; Creating a project][guide.programming.01] __&rang;__

</div>
