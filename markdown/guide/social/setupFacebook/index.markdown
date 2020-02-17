# Facebook Portal Setup

This guide explains how to integrate your app with Facebook using the [Facebook Developer Portal](https://developers.facebook.com/) for both iOS and Android.

<div class="guides-toc">

* [Developer Registration](#register)
* [App Integration](#app-integration)
* [Testing Restrictions](#testing)
* [Implementing Functionality](#implementing)

</div>


<a id="register"></a>

## Developer Registration

If you haven't already done so, sign in to the [Facebook Developer Portal](https://developers.facebook.com/) and register as a developer. This is a simple process and it doesn't involve downloading or installing any software.

Once registered, you must set up your app with Facebook to receive a unique __App&nbsp;ID__. You can do this even if your app isn't yet complete.




<a id="app-integration"></a>

## App Integration

There are many settings involved in configuring your app for Facebook. Locate the proper section within the portal and note the following important settings:

### General

* __Display Name__ &mdash; This __must__ be the same as the __Application&nbsp;Name__ entered into Corona's build window. On Android, failure to match this may result in being unable to share links from your app.

### iOS

* __Bundle ID__ &mdash; This must match the __App&nbsp;ID&nbsp;Suffix__ that you use to build your app; it can be retrieved in the __App&nbsp;IDs__ submenu for __iOS&nbsp;Apps__ within the [Apple Developer](https://developer.apple.com/) portal. Here, use the same <nobr>reverse-domain</nobr> format, for example `com.mycompany.myapp`. Do __not__ attempt to use a wildcard App&nbsp;ID.

* __URL Suffix Schemes__ &mdash; Specify these if you want to use specific URL scheme suffixes when publishing your iOS apps. See [here][REFLINK 1] for details on how to configure this in `build.settings`.

* __iPhone Store ID__ / __iPad Store ID__ &mdash; These are received when you add your app to the __iTunes&nbsp;Connect__ portal, even prior to uploading the binary. If you haven't yet configured the app within the iTunes store, you can use any existing app ID — just don't forget to change it to the proper ID before you submit the binary to Apple.

<div class="code-indent">
<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

An iPhone Store ID or iPad Store ID must be provided to receive game requests sent from the [Game Request Dialog][REFLINK 2].

</div>
</div>

* __Single Sign On__ &mdash; Set this to <span class="small-bold">YES</span>.

* __Deep Linking__ &mdash; Set this to <span class="small-bold">YES</span> to enable URL schemes to perform specific actions when your app opens. For instance, when the Facebook mobile app launches your app from a link, you will get a `launchArgs` parameter in your Corona app from which you can parse an `id` string.

### Android

* __Google Play Package Name__ &mdash; Use the same package name that you've entered into Corona's build window.

* __Class Name__ &mdash; This is used for native linking, that is, if someone taps a link to your app in Facebook, it will automatically launch the app. This field __must__ be set to `com.ansca.corona.CoronaActivity`. Facebook on Android will then launch your app via an Android ["intent"](https://developer.android.com/guide/components/intents-filters.html) using the package name and class name that you've entered on the developer page. The package name (above) is your app's unique string ID and it tells the Android system which app to launch the activity from. As such, there won't be a conflict if more than one Corona app is installed on the same device.

* __Key Hashes__ &mdash; These are required to integrate Facebook single sign on in your Android app. Instructions on how to generate a key hash can be found [here](https://developers.facebook.com/docs/android/getting-started) or, alternatively, you can obtain the key hash from Facebook itself. If you enter an incorrect key hash into the Facebook&nbsp;Developer&nbsp;Portal, have a Facebook app installed, and try to run your app, Facebook will produce an error and print the key hash it expects. You can then add this new key hash to the Facebook&nbsp;Developer&nbsp;Portal.

* __Single Sign On__ &mdash; Set this to <span class="small-bold">YES</span>.

* __Deep Linking__ &mdash; Set this to <span class="small-bold">YES</span> to enable URL schemes to perform specific actions when your app opens. For instance, when the Facebook mobile app launches your app from a link, you will get a `launchArgs` parameter in your Corona app, from which you can parse an `id` string.

### Advanced

* __Client Token__ &mdash; This should be generated. On iOS, failing to do so may result in login attempts failing.


<a id="testing"></a>

## Testing Restrictions

While your Facebook-integrated app is in development, it's important that you interact with and test your app using only registered Facebook accounts. See the __Roles__ section of the [Facebook Developer Portal](https://developers.facebook.com/) for more info.

Similarly, your app should __not__ be in the "Live" state while testing. If your app uses permissions that require review by Facebook, those permissions will not be granted to your app until the review from Facebook takes place. Leaving your app in the "In&nbsp;Development" state will allow you to test using permissions that fall into this category.

To ensure your app is in the "In Development" state, go to the __App&nbsp;Review__ section of the developer portal and ensure that the <nobr>__Make \[YOUR_APP\] public?__</nobr> option is set to <span class="small-bold">NO</span>.


<a id="implementing"></a>

## Implementing Functionality

Assuming everything is set up as indicated, please proceed to the [Implementing Facebook][guide.social.usingFacebook] guide which discusses how to implement common Facebook tasks and processes in your app.

<!--- REFERENCE LINKS -->

[REFLINK 1]: ../../../guide/social/usingFacebook/index.html#ios-requirements
[REFLINK 2]: ../../../plugin/facebook-v4/showDialog.html#gamerequestdialog
