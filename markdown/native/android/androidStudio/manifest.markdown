# Android Studio Integration


## Editing the Manifest

1. From the `Project` sidebar in Android&nbsp;Studio, open the `AndroidManifest.xml` file located under <nobr>`app` &rarr; `manifests`</nobr>:

<div class="image-indent" style="width:90%;">

![][images.enterprise.as-manifest1]

</div>

2. Normal content of this file should be as follows (this&nbsp;is almost an exact copy of `AndroidManifest.xml` from `android_old`). The final content is up to you&nbsp;&mdash; some of these tags are optional and not required for every app, while other apps will require additional tags.

<div class="code-indent">

``````xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.coronalabs.apptemplate"
    android:installLocation="auto">

    <!-- Permissions required by this app. -->
    <uses-permission android:name="android.permission.INTERNET"/>

    <!-- Informs the app store that this app requires OpenGL ES 2.0 as a minimum. Required by Corona. -->
    <uses-feature android:glEsVersion="0x00020000"/>

    <!-- Informs the app store what features are required or are optional for this app. -->
    <!-- Setting the telephony feature to not required allows this app to be installed by devices that are not phones. -->
    <uses-feature android:name="android.hardware.telephony" android:required="false"/>

    <!--
     Provides information about this app.
     The "name" attribute should be set to the name of the class that extends/inherits from the Application class.
     The "label" attribute sets the name of the application as how it is shown to the end-user.
     -->
    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:supportsRtl="true"
        android:theme="@style/AppTheme"
        android:fullBackupContent="false"
        android:hardwareAccelerated="true"
        tools:targetApi="honeycomb">

        <!-- The main Corona activity that runs the Corona project. -->
        <activity android:name="com.ansca.corona.CoronaActivity"
            android:screenOrientation="portrait"
            android:configChanges="keyboard|keyboardHidden|navigation|screenSize|orientation"
            android:label="@string/app_name"
            android:launchMode="singleTask"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>

        <!-- Other Corona activities that can be launched by the main Corona activity. -->
        <activity android:name="com.ansca.corona.CameraActivity"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen"
            android:configChanges="keyboardHidden|orientation|screenSize"
            android:screenOrientation="portrait" />
        <activity android:name="com.ansca.corona.VideoActivity"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen"
            android:configChanges="keyboardHidden|orientation|screenSize" />
        <activity android:name="com.ansca.corona.purchasing.StoreActivity"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen"
            android:configChanges="keyboardHidden|screenSize|orientation" />

        <!-- Corona content provider required by the video player and mail app to access this app's local files. -->
        <provider android:name="com.ansca.corona.storage.FileContentProvider"
            android:authorities="com.coronalabs.apptemplate.files"
            android:exported="true"
            tools:ignore="ExportedContentProvider" />

        <!-- Corona service used to perform background operations such as managing notifications. -->
        <service android:name="com.ansca.corona.CoronaService" />

        <!--
         Receiver which automatically starts this application after the Android device starts up.
         This is needed to show this application's active status bar notifications and reschedule pending
         notifications after the device boots up, because they will only be shown if the app is running.
         This receiver only works if the "android.permission.RECEIVE_BOOT_COMPLETED" permission has been set.
        -->
        <receiver android:name="com.ansca.corona.SystemStartupBroadcastReceiver">
            <intent-filter>
                <action android:name="android.intent.action.BOOT_COMPLETED" />
            </intent-filter>
        </receiver>

        <!-- Handles local/scheduled notification events. -->
        <receiver android:name="com.ansca.corona.notifications.AlarmManagerBroadcastReceiver" />
        <receiver android:name="com.ansca.corona.notifications.StatusBarBroadcastReceiver" />

        <!-- Listens for Google Cloud Messaging push notifications and registration messages. -->
        <receiver android:name="com.ansca.corona.notifications.GoogleCloudMessagingBroadcastReceiver"
            android:permission="com.google.android.c2dm.permission.SEND" >
            <intent-filter>
                <action android:name="com.google.android.c2dm.intent.RECEIVE" />
                <action android:name="com.google.android.c2dm.intent.REGISTRATION" />
                <category android:name="com.coronalabs.apptemplate" />
            </intent-filter>
        </receiver>

    </application>
</manifest>
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Don't forget to change the following attributes to match your application. They should contain your app's package name instead of `com.coronalabs.apptemplate`.

* The `package` value at the top of the file.
* The value of `android:authorities` inside the <nobr>`<provider />`</nobr> tag.
* The value of `android:name` inside the <nobr>`<category />`</nobr> tag of the <nobr>`<intent-filter />`</nobr> for the `GoogleCloudMessagingBroadcastReceiver`.

</div>
</div>

2. If/when you copy the entire Android&nbsp;Studio project to make a new app or a plugin, change the application name inside <nobr>`app` &rarr; `res` &rarr; `values` &rarr; `strings.xml`</nobr>:


<div class="image-indent" style="width:90%;">

![][images.enterprise.as-manifest2]

</div>


## Conclusion

Assuming you've completed every step, migration is complete. However, remember that you still need to manually prepare store submission of the plugin, for example prepare dependency `.jar` files (some&nbsp;can be copied from `build/intermediates/exploded-aar`) and prepare any additional resources files.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* When you are sure everything works, you can delete the `android_old` directory.

* At this point, you can build the project in `Debug` or `Release` mode. Select <nobr>`Build` &rarr; `Build APK`</nobr>. Once completed, a successful message should appear with a link to see the `.apk` in Finder. You can install this on a device via the usual methods \([guide][guide.distribution.androidBuild]\). If you want to change from `Debug` mode to `Release` mode, open <nobr>`Build` &rarr; `Select Build Variant…`</nobr> and choose `release` for both `app` and `plugin`.

* Alternatively, you can connect a device and press the __Run__ button in Android&nbsp;Studio. This will automatically build the project, copy the `.apk`, and install/run it on your device.

</div>


##

<div class="walkthrough-nav">

__&lang;__ [Editing Gradle Scripts][native.android.androidStudio.gradle] _|_ [Guide Index][native.android.androidStudio]

</div>
