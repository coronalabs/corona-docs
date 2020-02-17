# CORONA_NATIVE_PRODUCT &mdash; Android&nbsp;SDK&nbsp;Manager

This guide describes which components need to be installed from the __Android&nbsp;SDK&nbsp;Manager__ for CORONA_NATIVE_PRODUCT development.

<div class="guides-toc">

* [Tools](#tools)
* [SDK Versions](#versions)
* [Installing the Packages](#installing)

</div>


<a id="tools"></a>

## Tools

The Android SDK contains three fundamental toolsets which can be found under the `Tools` folder of the Android&nbsp;SDK&nbsp;Manager. The minimum supported versions of these tools are provided below:

<div class="inner-table">

Toolset							Version
------------------------------	--------------
Android SDK Tools				24.4.1
Android SDK Platform-tools		23.1
Android SDK Build-tools			23.0.2
------------------------------	--------------

</div>

Confirm that you have at least these versions installed and, if not, check the box to the left to get the latest version.




<a id="versions"></a>

## SDK Versions

The Android SDK versions and API levels you need to install varies based on what you're building. You should install at least the minimum and target SDK versions defined by Corona:

<div class="inner-table">

Version							API&nbsp;Level
------------------------------	------------------
Minimum&nbsp;SDK&nbsp;Version	Android 4.0.3 &nbsp;(API&nbsp;15)
Target SDK Version				Android 6.0 &nbsp;(API&nbsp;23)
------------------------------	------------------

</div>

In addition, you must install the minimum and target SDK versions for any library that you plan to use. If you can't find all of the SDK versions you need, checking the `Obsolete` checkbox will reveal all versions. While it may seem easier to just install everything, these SDKs take up disk space and they also take time to download/unpack. If you download them all, expect a long wait.




<a id="installing"></a>

## Installing the Packages

Once you have the necessary items selected, confirm that only __your__ items are selected. The Android&nbsp;SDK&nbsp;Manager will often make recommendations of items to install by <nobr>pre-checking</nobr> them which can lead to unnecessary bloat on your machine if you aren't paying attention. After verifying that only your items are selected, click the __install&nbsp;packages__ button. On the next screen, accept the license agreements and sit back while everything installs.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you haven't yet completed every step outlined in the [CORONA_NATIVE_PRODUCT Setup][native.android#setup] section, please return there and continue through the entire process.

</div>
