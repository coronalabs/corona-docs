# CoronaCards: Project Integration — Android

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          CoronaCards, Android
> __See also__          [Getting Started — Android][coronacards.android]
>								[Native/Lua Communication — Android][coronacards.android.communication]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This guide explains how to integrate CoronaCards with a native Android project.


## System Requirements

* Android SDK level 15+
* Android SDK tools 24.4.1 or higher
* Android device running __Android 4.0.3__ or higher
* Android device with an __ARMv7__ processor


## CoronaCards Installation

Get the desired CoronaCards framework from the [download page](http://developer.coronalabs.com/downloads/coronacards) and follow the instructions to install it.


## Classes

`com.ansca.corona.CoronaView` is the main entry point &mdash; this is the view that should be added to your layout.


## Usage/Assets

To use CoronaCards in the designer, you need to copy the `.jar` files into the `[Project Directory]/[Application Name]/libs` folder and the `.so` files into the `[Project Directory]/[Application Name]/src/main/jniLibs/armeabi-v7a` folder. A sample folder structure can be found on [GitHub](https://github.com/CoronaCards/sample-android-ChildView). Android Studio will show the `CoronaView` as a custom view in the designer.

### Eclipse

To use CoronaCards in Eclipse, copy the `.jar` files into the `[Project Directory]/libs` folder and the `.so` files into the `[Project Directory]/libs/armeabi-v7a` folder.

### Manifest

Nothing needs to be added to the manifest.

### Corona Project

Place your Corona assets (i.e. `main.lua`) into the `assets` folder of your project. The `CoronaView` should then use this path:

``````
CoronaView coronaView = new CoronaView(context);
coronaView.init("");
``````

##### Example

``````
CoronaView coronaView = new CoronaView(context);
// Assuming 'main.lua' and all of its assets are in a folder named 'Fishies' in the 'assets' directory:
coronaView.init("Fishies/")
``````


### Licensing File

The licensing file needs to be put in every directory which houses a CoronaCards project or the `CoronaView` that is pointing to that project will not run. This file ensures that you are authorized to use CoronaCards. Obtain a trial licensing file [here](https://developer.coronalabs.com/downloads/coronacards).