# Installing CORONA_CORE_PRODUCT &mdash; Windows

This guide will help you get up and running with CORONA_CORE_PRODUCT for Windows.

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

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

You do not need to install the Android SDK to use CORONA_CORE_PRODUCT. However, to create device builds to test on actual Android devices, you will need the __Java&nbsp;Development&nbsp;Kit__. The installation process is described below.

</div>
</div>

We'll assume you've already downloaded [CORONA_CORE_PRODUCT](REVISION_URL). Now, double click the `.msi` installer file and follow the steps in the installation wizard.


<a id="jdk"></a>

## Java Development Kit

Installing CORONA_CORE_PRODUCT lets you create and test apps locally on your PC. If you intend to build apps for testing on Android devices, you will need to install the <nobr>__Java Development Kit__</nobr> (JDK). We&nbsp;suggest that you follow these instructions:

1. Go to [JDK8 download](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html) page.
2. Click the __JDK__ download link to obtain the corresponding <nobr>Java Platform (JDK)</nobr>.
3. On the next page, read the license agreement and click the option to accept it if you agree.
4. Locate the <nobr>__Windows x86__</nobr> link and click it to download the file. This file will be named approximately <nobr>`jdk-8u261-windows-i586.exe`</nobr>.
5. When the download is complete, run the installer. Be sure to install the <nobr>Java Runtime Environment</nobr> (JRE) as part of the installation.




<!---

<a id="coronaeditor"></a>

## CORONA_CORE_PRODUCT Editor (IDE)

[CORONA_CORE_PRODUCT Editor](https://github.com/coronalabs/CoronaSDK-SublimeText) offers developers a very capable and lightweight IDE. CORONA_CORE_PRODUCT Editor streamlines development and includes the following:

* __Debugger__ &mdash; set breakpoints and inspect variables.
* __Snippets__ &mdash; get help with syntax and coding conventions.
* __Code completion__ &mdash; save time for all APIs and constants.
* __Docs__ &mdash; bring up APIs directly from your code.
* __Launch__ &mdash; run the current app in the CORONA_CORE_PRODUCT Simulator from [Sublime Text](http://www.sublimetext.com).

For more information, please see the [CORONA_CORE_PRODUCT Editor](https://github.com/coronalabs/CoronaSDK-SublimeText) page.

-->




<a id="editor"></a>

## Text Editors

You'll need a text editor or IDE to write code for your CORONA_CORE_PRODUCT projects. If you don't already have a favorite text editor, the following options are recommended:

<div class="inner-table">

Editor																Add-On Package
------------------------------------------------------------------	---------------------------------------------
[Sublime Text](http://www.sublimetext.com)							[CORONA_CORE_PRODUCT Editor](https://github.com/coronalabs/CoronaSDK-SublimeText)
[Atom](https://atom.io)												[autocomplete-corona](https://atom.io/packages/autocomplete-corona)
[Visual Studio Code](https://code.visualstudio.com/)				[CORONA_CORE_PRODUCT-companion](https://marketplace.visualstudio.com/items?itemName=M4adan.solar2d-companion)
[Notepad++](http://notepad-plus-plus.org)
[ZeroBrane Studio](https://studio.zerobrane.com)
[Vim](http://www.vim.org)
------------------------------------------------------------------	---------------------------------------------

</div>




<a id="environment"></a>

## Development Environment

The CORONA_CORE_PRODUCT development environment consists of two aspects: the __Solar2D Simulator__ and the __Solar2D Console__ window.

* The __Solar2D Simulator__ is a visual representation and test environment for your app. What you see in the Simulator is generally what your app will look like — and how it will function — when deployed to an actual device. CORONA_CORE_PRODUCT Simulator is an essential tool because it allows you to view changes to your code instantly in an active, responsive environment that closely mimics the device.

* The __Solar2D Simulator Console__ is where you can view diagnostic messages about what's happening in your program. This window is automatically displayed when you launch the CORONA_CORE_PRODUCT Simulator.




<a id="simoptions"></a>

## Simulator Options

The CORONA_CORE_PRODUCT Simulator for Windows features the following basic menu items:

* The __File__ menu is where projects (applications) are created or opened. This is also where you __build__ your apps for distribution or testing on devices. Finally, this menu provides access to the Simulator __Preferences__.

* The __Hardware__ menu is used to simulate physical device actions such as rotating the screen.

* The __View__ menu lets you open the __Welcome&nbsp;Screen__ which provides quick access to recent projects, CORONA_CORE_PRODUCT developer resources, and more. This menu also lets you access the CORONA_CORE_PRODUCT Simulator Console (__Console__). Finally, this menu includes options to manipulate the Simulator window or change the skin <nobr>(__View__ &rarr; __View&nbsp;As__)</nobr>.




<!---

### Building Apps

When you want to build your app for distribution or to test on a device, choose __File__&nbsp;&rarr;&nbsp;__Build__ and select the desired build option. The entire process for each OS is outlined in the following guides:

* [Signing and Building — Android][guide.distribution.androidBuild]
* [Creating Win32 Desktop Apps][guide.distribution.win32Build]

-->


<a id="cmdusage"></a>

## Command Line Usage

To start a particular app in the CORONA_CORE_PRODUCT Simulator without double-clicking it, use a command like this:

```
"C:\Program Files\Corona Labs\Corona\Corona Simulator.exe" "C:\Documents and Settings\MyAccount\My Documents\Corona Apps\My App\main.lua"
```

If you don't want the CORONA_CORE_PRODUCT Simulator Console window to automatically appear, use the `/no-console` option:

```
"C:\Program Files\Corona Labs\Corona\Corona Simulator.exe" /no-console
```

After using the `/no-console` option above, all Lua `print()` functions and CORONA_CORE_PRODUCT log messages can be received via the standard output stream (`stdout`).

One additional flag is allowed (`/debug`) which allows an IDE to connect a debugger to the Simulator session. It should come immediately after the `.exe`.


## Getting Started

If you're new to CORONA_CORE_PRODUCT, the most fun way to learn is to [create a simple game][guide.programming.01]. Don't worry if you've never created a mobile app or programmed before&nbsp;&mdash; the chapters in the guide will walk you through the entire process from start to finish!

<div class="walkthrough-nav">

[Chapter 1 &mdash; Creating an App][guide.programming.01] __&rang;__

</div>
