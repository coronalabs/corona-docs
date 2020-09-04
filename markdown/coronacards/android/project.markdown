# CORONA_CARDS_PRODUCT: Project Integration — Android

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          CORONA_CARDS_PRODUCT, Android
> __See also__          [Getting Started — Android][coronacards.android]
>								[Native/Lua Communication — Android][coronacards.android.communication]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This guide explains how to integrate CORONA_CARDS_PRODUCT with a native Android project.


## System Requirements

* Android SDK level 15+
* Android SDK tools 24.4.1 or higher
* Android device running __Android 4.0.3__ or higher
* Android device with an __ARMv7__ processor


## Installation

Get the desired CORONA_CARDS_PRODUCT framework from the [download page](REVISION_URL) and follow the instructions to install it.


## Classes

`com.ansca.corona.CoronaView` is the main entry point &mdash; this is the view that should be added to your layout.


## Usage/Assets

To use CORONA_CARDS_PRODUCT in the designer, you need to copy the `.jar` files into the `[Project Directory]/[Application Name]/libs` folder and the `.so` files into the `[Project Directory]/[Application Name]/src/main/jniLibs/armeabi-v7a` folder. A sample folder structure can be found on [GitHub](https://github.com/CoronaCards/sample-android-ChildView). Android Studio will show the `CoronaView` as a custom view in the designer.

### Eclipse

To use CORONA_CARDS_PRODUCT in Eclipse, copy the `.jar` files into the `[Project Directory]/libs` folder and the `.so` files into the `[Project Directory]/libs/armeabi-v7a` folder.

### Manifest

Nothing needs to be added to the manifest.

### CORONA_CORE_PRODUCT Project

Place your CORONA_CORE_PRODUCT assets (i.e. `main.lua`) into the `assets` folder of your project. The `CoronaView` should then use this path:

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
