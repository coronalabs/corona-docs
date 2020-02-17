# Installing CORONA_CORE_PRODUCT &mdash; Windows

This guide will help you get up and running with CORONA_CORE_PRODUCT for Windows.

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

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

You do not need to install the Android SDK to use CORONA_CORE_PRODUCT. However, to create device builds to test on actual Android devices, you will need the __Java&nbsp;Development&nbsp;Kit__. The installation process is described below.

</div>
</div>

We'll assume you've already [downloaded](http://developer.coronalabs.com/downloads/coronasdk/) CORONA_CORE_PRODUCT. Now, double click the `.msi` installer file and follow the steps in the installation wizard.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

There are two ways to stay current with releases/builds of Corona:

* [Public Release](https://developer.coronalabs.com/downloads/coronasdk) &mdash; The latest stable release of CORONA_CORE_PRODUCT, providing maximum reliability for your projects. This is updated several times a year.

* [Daily Builds](https://developer.coronalabs.com/downloads/daily-builds/) &mdash; The bleeding edge. Daily builds contain the latest features as they are integrated into Corona.

</div>




<a id="activate"></a>

## Product Activation

In order to use CORONA_CORE_PRODUCT, you must be connected to the Internet and perform a simple <nobr>one-time</nobr> authorization process.

1. Open the __Corona Simulator__ from the folder where you installed it. The first time you launch, you will be presented with a <nobr>License Agreement (EULA)</nobr>. Read the license terms and click __Agree__.

2. If you've already registered for a Corona account, simply enter your account <nobr>e-mail</nobr> and password to activate the product. Otherwise, click __Register__ to create an account.

<!---

<div class="code-indent">

![][images.simulator.install-win-login1]

</div>

-->

3. Upon successful login, you will receive a confirmation dialog. You're ready to get started!

<!---

<div class="code-indent">

![][images.simulator.install-win-login2]

</div>

-->




<a id="jdk"></a>

## Java Development Kit

Installing CORONA_CORE_PRODUCT lets you create and test apps locally on your PC. If you intend to build apps for testing on Android devices, you will need to install the <nobr>__Java Development Kit__</nobr> (JDK). We&nbsp;suggest that you follow these instructions:

1. Go to the [JDK download](http://www.oracle.com/technetwork/java/javase/downloads/index.html) page.
2. Click the __JDK__ download link to obtain the current <nobr>Java Platform (JDK)</nobr>.
3. On the next page, read the license agreement and click the option to accept it if you agree.
4. Locate the <nobr>__Windows x86__</nobr> link and click it to download the file. This file will be named approximately <nobr>`jdk-8u131-windows-i586.exe`</nobr>.
5. When the download is complete, run the installer. Be sure to install the <nobr>Java Runtime Environment</nobr> (JRE) as part of the installation.




<!---

<a id="coronaeditor"></a>

## Corona Editor (IDE)

[Corona Editor](http://coronalabs.com/products/editor/) offers developers a very capable and lightweight IDE. Corona Editor streamlines development and includes the following:

* __Debugger__ &mdash; set breakpoints and inspect variables.
* __Snippets__ &mdash; get help with syntax and coding conventions.
* __Code completion__ &mdash; save time for all APIs and constants.
* __Docs__ &mdash; bring up APIs directly from your code.
* __Launch__ &mdash; run the current app in the Corona Simulator from [Sublime Text](http://www.sublimetext.com).

For more information, please see the [Corona Editor](http://coronalabs.com/products/editor/) page.

-->




<a id="editor"></a>

## Text Editors

You'll need a text editor or IDE to write code for your CORONA_CORE_PRODUCT projects. If you don't already have a favorite text editor, the following options are recommended:

<div class="inner-table">

Editor																Add-On Package
------------------------------------------------------------------	---------------------------------------------
[Atom](https://atom.io)												[autocomplete-corona](http://bit.ly/1SA5cXv)
[Visual Studio Code](https://code.visualstudio.com/)				[Corona Tools](http://bit.ly/1SHiqgK)
[Sublime Text](http://www.sublimetext.com)							[Corona Editor](http://bit.ly/1QGh44H)
[Notepad++](http://notepad-plus-plus.org)
[ZeroBrane Studio](https://studio.zerobrane.com)
[Vim](http://www.vim.org)
------------------------------------------------------------------	---------------------------------------------

</div>




<a id="environment"></a>

## Development Environment

The CORONA_CORE_PRODUCT development environment consists of two aspects: the __Corona&nbsp;Simulator__ and the __Corona&nbsp;Simulator&nbsp;Console__ window.

* The __Corona Simulator__ is a visual representation and test environment for your app. What you see in the Simulator is generally what your app will look like — and how it will function — when deployed to an actual device. The Corona Simulator is an essential tool because it allows you to view changes to your code instantly in an active, responsive environment that closely mimics the device.

* The __Corona Simulator Console__ is where you can view diagnostic messages about what's happening in your program. This window is automatically displayed when you launch the Corona Simulator.




<a id="simoptions"></a>

## Simulator Options

The Corona Simulator for Windows features the following basic menu items:

* The __File__ menu is where projects (applications) are created or opened. This is also where you __build__ your apps for distribution or testing on devices. Finally, this menu provides access to the Simulator __Preferences__.

* The __Hardware__ menu is used to simulate physical device actions such as rotating the screen.

* The __View__ menu lets you open the __Welcome&nbsp;Screen__ which provides quick access to recent projects, Corona developer resources, and more. This menu also lets you access the Corona&nbsp;Simulator&nbsp;Console (__Console__). Finally, this menu includes options to manipulate the Simulator window or change the skin <nobr>(__View__ &rarr; __View&nbsp;As__)</nobr>.




<!---

### Building Apps

When you want to build your app for distribution or to test on a device, choose __File__&nbsp;&rarr;&nbsp;__Build__ and select the desired build option. The entire process for each OS is outlined in the following guides:

* [Signing and Building — Android][guide.distribution.androidBuild]
* [Creating Win32 Desktop Apps][guide.distribution.win32Build]

-->




## Getting Started

If you're new to Corona, the most fun way to learn is to [create a simple game][guide.programming.01]. Don't worry if you've never created a mobile app or programmed before&nbsp;&mdash; the chapters in the guide will walk you through the entire process from start to finish!

<div class="walkthrough-nav">

[Chapter 1 &mdash; Creating an App][guide.programming.01] __&rang;__

</div>




## Command Line Usage

To start a particular app in the Corona Simulator without double-clicking it, use a command like this:

```
"C:\Program Files\Corona Labs\CORONA_CORE_PRODUCT\Corona Simulator.exe" "C:\Documents and Settings\MyAccount\My Documents\Corona Apps\My App\main.lua"
```

If you don't want the Corona Simulator Console window to automatically appear, use the `/no-console` option:

```
"C:\Program Files\Corona Labs\CORONA_CORE_PRODUCT\Corona Simulator.exe" /no-console
```

After using the `/no-console` option above, all Lua `print()` functions and Corona log messages can be received via the standard output stream (`stdout`).

One additional flag is allowed (`/debug`) which allows an IDE to connect a debugger to the Simulator session. It should come immediately after the `.exe`.
