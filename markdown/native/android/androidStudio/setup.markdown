# Android Studio Integration


## Setup/Preparation

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* This guide assumes that you have already set up a development environment for CORONA_ENTERPRISE_PRODUCT. If not, please see the [CORONA_ENTERPRISE_PRODUCT &mdash; Android Setup][native.android.androidSetup] and return to this guide once you've finished installing the Android Tools.

* Before starting, download and install [Android Studio](https://developer.android.com/studio). Run Android&nbsp;Studio for the first time and set it up (select&nbsp;a theme, update the Android&nbsp;SDK as desired,&nbsp;etc.).

</div>


1. If you haven't already, copy the `CoronaEnterprise/ProjectTemplates/App/` project directory to the desired location on your machine.

2. Open the `[PATH_TO_PROJECT_TEMPLATE]/App/` project directory in __Finder__ and rename the `android` directory to `android_old`. This is so the old Ant version stays out of the way.

3. From with Android&nbsp;Studio, select <nobr>__Start a new Android&nbsp;Studio project__</nobr>.

4. Specify an __Application&nbsp;name__ that describes your project. If you already have an Android __package&nbsp;name__ <nobr>(and a keystore)</nobr>, make sure to specify the correct values. Also make sure that __Project&nbsp;location__ is exactly <nobr>`[PATH_TO_PROJECT_TEMPLATE]/App/android/` &mdash;</nobr> this is so you just replace the Android structure of the CORONA_ENTERPRISE_PRODUCT project without breaking other portions.

<div class="image-indent" style="width:60%;">

![][images.enterprise.as-prep2]

</div>

5. When finished, click __Next__.

6. On the next screen, in the __Phone&nbsp;and&nbsp;Tablet__ section, choose a __Minimum&nbsp;SDK__ version of <nobr>`API 15: Android 4.0.3 (IceCreamSandwich)`</nobr>. Specifying an SDK version lower than 15 is unsupported.

<div class="image-indent" style="width:60%;">

![][images.enterprise.as-prep3]

</div>

7. When ready, click __Next__.

8. On the next screen, select __Add&nbsp;No&nbsp;Activity__ and then click __Finish__. Android&nbsp;Studio will then create your project.

<div class="image-indent" style="width:60%;">

![][images.enterprise.as-prep4]

</div>

9. Now that the new `android` directory is created, open the __Terminal__ application and `cd` to the <nobr>`[PATH_TO_PROJECT_TEMPLATE]/App/android/`</nobr> directory. Then, make a symbolic link to `CoronaEnterprise` directory:

<div class="code-indent">

``````bash
cd [PATH_TO_PROJECT_TEMPLATE]/App/android/
ln -s /Applications/CoronaEnterprise CoronaEnterprise
``````

</div>

10. Verify that your symbolic link works by <nobr>`cd`-ing</nobr> into it. You should see the Corona folder icon in the title bar of the __Terminal__ application.

<div class="image-indent" style="margin-top: -12px; width:90%;">

![][images.enterprise.as-prep5]

</div>




## Project Configuration

1. Return to Android&nbsp;Studio and open the `Project` sidebar on the left. Expand the `app` and <nobr>`Gradle Scripts`</nobr> modules:

<div class="image-indent" style="width:90%;">

![][images.enterprise.as-setup1]

</div>

2. Delete everything in the <nobr>`app` &rarr; `java`</nobr> modules.

<!-- * You may want to leave the code under the `app`->`java` module for later use, but in most cases (including this guide), it is not needed. -->

<div class="image-indent" style="width:90%;">

![][images.enterprise.as-setup2]

</div>

3. You'll need to add a <nobr>sub-project</nobr> for the plugin. Select <nobr>__File__ &rarr; __New__ &rarr; __New Module__</nobr> and choose __Android&nbsp;Library__, then click __Next__ to continue.

<div class="image-indent" style="width:60%;">

![][images.enterprise.as-setup3]

</div>

4. On the next screen, __Application/Library&nbsp;name__ and __Module&nbsp;name__ must be exactly `plugin`. __Package&nbsp;name__ should be in format of how a user would add the plugin to their `build.settings`, for example `plugin.flashlight`. For this project, enter simply `plugin.library` and click __Finish__. You can ignore the warning about the casing of the application name.

<div class="image-indent" style="width:60%;">

![][images.enterprise.as-setup4]

</div>

5. In the __Project__ sidebar, locate the <nobr>`plugin` &rarr; `java`</nobr> module and delete <nobr>`plugin.library` (`androidTest`)</nobr> and <nobr>`plugin.library` (`test`)</nobr> module.

<div class="image-indent" style="width:90%;">

![][images.enterprise.as-setup5]

</div>

6. Now you need to create a `LuaLoader.java` file for the plugin. From within Finder, copy the file from `[PATH_TO_PROJECT_TEMPLATE]/App/android_old/src/plugin/library` and paste it into this directory:

    `[PATH_TO_PROJECT_TEMPLATE]/App/android/plugin/src/main/java/plugin/library`

<div class="image-indent" style="width:90%;">

![][images.enterprise.as-setup6]

</div>

7. While still in Finder, delete the `androidTest` and `test` directories from both `app/src/` and `plugin/src/` since you don't need them.


##

<div class="walkthrough-nav">

[Editing Gradle Scripts][native.android.androidStudio.gradle] __&rang;__

</div>
