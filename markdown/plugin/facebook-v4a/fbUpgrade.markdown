# Facebook Versioning/Upgrading

The following is an overview of the differences between major versions of the Facebook&nbsp;SDK implemented via the [Facebook][plugin.facebook-v4] plugin. Some of these updates will be delivered automatically when a new device build is made, while others may require updating to a later version of Corona. Bug fixes will typically only be delivered to the latest major version available.

<div class="guides-toc">

* [Major Version History](#history)
* [Upgrade Details](#upgrades)
* [Facebook v4 Migration](#migration)

</div>


<a id="history"></a>

## Major Version History

<div class="inner-table">

Release&nbsp;Name		Release&nbsp;Date   Corona&nbsp;Compatibility	<nobr>Facebook SDK (iOS/Android)</nobr>		 Graph&nbsp;API		 Available
----------------------	------------------	--------------------------	------------------------------------------	------------------	-------------
Android Beta			07/24/2015			2015.2685 - 2016.2827		&ndash;	/ 4.4.0 (fork)						 v2.4
iOS Beta				09/01/2015			2015.2685 - 2016.2827		4.5.1 / 4.5.0 (fork)						 v2.4
11/2015&nbsp;Update		11/10/2015			2015.2685 - 2016.2827		4.5.1 / 4.5.0 (fork)						 v2.4				 &#x2713;
3/2016&nbsp;Update		03/25/2016			2015.2828 - 2016.2931		4.10.1 / 4.10.1 (fork)						 v2.5				 &#x2713;
__Stable Release__		10/27/2016			2016.2932 +					4.16.1 / 4.16.1 (fork)						 v2.8				 &#x2713;
----------------------	------------------	--------------------------	------------------------------------------	------------------	-------------

</div>




<a id="upgrades"></a>

## Upgrade Details

### 3/2016 Update &rarr; Stable Release

* The Graph API version has been updated from [v2.5](https://developers.facebook.com/docs/apps/changelog#v2_5) to [v2.8](https://developers.facebook.com/docs/apps/changelog#v2_8). See Facebook's [Graph API Upgrade Guide](https://developers.facebook.com/docs/apps/upgrading) for more information on how this may affect your [facebook.request()][plugin.facebook-v4.request] calls.

* Previously denied permissions will be <nobr>re-requested</nobr> in the login screen.

* Facebook Places and Facebook Friends have been deprecated in favor of selecting these in the [Share Dialog](https://developers.facebook.com/docs/sharing/reference/share-dialog). Please migrate to using <nobr>`facebook.showDialog( "link" )`</nobr> instead of <nobr>`facebook.showDialog( "feed" )`</nobr>, <nobr>`facebook.showDialog( "place" )`</nobr>, or <nobr>`facebook.showDialog( "friends" )`</nobr>.

* `facebook.showDialog( "link" )` now requires a `link` key in the `params` table. This means that using the [Share Dialog](https://developers.facebook.com/docs/sharing/reference/share-dialog) to let users compose a <nobr>plain-text</nobr> status update is no longer possible. For alternate means to do this, see the [Social Plugin][plugin.CoronaProvider_native_popup_social].

* The Facebook SDK is no longer distributed with CORONA_NATIVE_PRODUCT in the `Plugins/sdk-facebook` directory. For iOS, the appropriate SDK version can be downloaded [here](https://developers.facebook.com/docs/ios/downloads). For Android, Corona's fork of the Facebook&nbsp;SDK is now provided on [GitHub](https://github.com/coronalabs/plugins-sdk-facebook-android).

* A new method, [facebook.isFacebookAppEnabled()][plugin.facebook-v4.isFacebookAppEnabled], will help determine if a native Facebook app is installed and accessible on the device. See the [documentation][plugin.facebook-v4.isFacebookAppEnabled] for more info.

* [facebook.showDialog()][plugin.facebook-v4.showDialog] now supports sharing photos to a user's photo album.

* For iOS, the Facebook SDK version has been updated from [4.10.1](https://developers.facebook.com/docs/ios/change-log-4.x#4_10_1) to [4.16.1](https://developers.facebook.com/docs/ios/change-log-4.x#4_16_1) which supports iOS&nbsp;10. If you're a CORONA_NATIVE_PRODUCT user, see Facebook's [upgrade guide](https://developers.facebook.com/docs/ios/upgrading-4.x#4160to4161) for more information.

* On iOS&nbsp;9 and above, the [Share Dialog](https://developers.facebook.com/docs/sharing/reference/share-dialog) will use a [SFSafariViewController](https://developer.apple.com/reference/safariservices/sfsafariviewcontroller). This is to coincide with the default that began with Facebook&nbsp;SDK [4.6.0](https://developers.facebook.com/docs/ios/change-log-4.x#4_6_0).

* For Android, the Facebook SDK version has been updated from [4.10.1](https://developers.facebook.com/docs/android/change-log-4.x#4_10_1) to [4.16.1](https://developers.facebook.com/docs/android/change-log-4.x#4_16_1). This means that the [Facebook Lite app](https://play.google.com/store/apps/details?id=com.facebook.lite&hl=en) will be used for login if the [Facebook app](https://play.google.com/store/apps/details?id=com.facebook.katana&hl=en) for Android is not installed. If you're a CORONA_NATIVE_PRODUCT user, see Facebook's [upgrade guide](https://developers.facebook.com/docs/android/upgrading-4.x#4160to4161) for more information.

### 11/2015 Update &rarr; 3/2016&nbsp;Update

* The Graph API version has been updated from [v2.4](https://developers.facebook.com/docs/apps/changelog#v2_4) to [v2.5](https://developers.facebook.com/docs/apps/changelog#v2_5). See Facebook's [Graph API Upgrade Guide](https://developers.facebook.com/docs/apps/upgrading#v24tov25) for more information on how this may affect your [facebook.request()][plugin.facebook-v4.request] calls.

* For iOS, the Facebook SDK version has been updated from [4.5.1](https://developers.facebook.com/docs/ios/change-log-4.x#4_5_1) to [4.10.1](https://developers.facebook.com/docs/ios/change-log-4.x#4_10_1). This means that devices running iOS&nbsp;9 and above will use a [SFSafariViewController](https://developer.apple.com/reference/safariservices/sfsafariviewcontroller) to log users in. If you're a CORONA_NATIVE_PRODUCT user, see Facebook's [upgrade guide](https://developers.facebook.com/docs/ios/upgrading-4.x#490to4100) for more info.

* For Android, the Facebook SDK version has been updated from [4.5.0](https://developers.facebook.com/docs/android/change-log-4.x#4_5_0) to [4.10.1](https://developers.facebook.com/docs/android/change-log-4.x#4_10_1). This means that the target Android&nbsp;SDK version is now [API Level 23](https://developer.android.com/about/versions/marshmallow/index.html). If you're a CORONA_NATIVE_PRODUCT user, see Facebook's [upgrade guide](https://developers.facebook.com/docs/android/upgrading-4.x#4100to4101) for more information.
	
* For Android, support for API Levels 10-14 has been maintained despite the Facebook&nbsp;SDK [changing](https://developers.facebook.com/docs/android/change-log-4.x#4_7_0) the minimum SDK version to API&nbsp;Level&nbsp;15.

* On Android, Facebook Places will now prompt users for Location permission if it hasn't been granted on devices running [Android 6.0]((https://developer.android.com/about/versions/marshmallow/index.html)) and above.

### iOS Beta &rarr; 11/2015 Update

* For [facebook.request()][plugin.facebook-v4.request], `DELETE` is now supported as an `httpMethod` parameter. [facebook.request()][plugin.facebook-v4.request] can also now be used to post Open&nbsp;Graph stories.

* For [facebook.showDialog()][plugin.facebook-v4.showDialog], the Game&nbsp;Request&nbsp;Dialog now supports the `actionType` and `filter` parameters.

### Android Beta &rarr; iOS Beta

* The property [facebook.currentAccessToken][plugin.facebook-v4.currentAccessToken] has been deprecated in favor of the [facebook.getCurrentAccessToken()][plugin.facebook-v4.getCurrentAccessToken] function.

* `facebook.showDialog( "link" )` has been added in favor of <nobr>`facebook.showDialog( "feed" )`</nobr> for sharing URL content. With this, the functionality of Facebook&nbsp;Places and Facebook&nbsp;Friends is built in if the Facebook app is installed.

* For Android, the Facebook SDK version has been updated from [4.4.0](https://developers.facebook.com/docs/android/change-log-4.x#4_4_0) to [4.5.0](https://developers.facebook.com/docs/android/change-log-4.x#4_5_0). See Facebook's [upgrade guide](https://developers.facebook.com/docs/android/upgrading-4.x#441to450) for more information.




<a id="migration"></a>

## Facebook v4 Migration

If you have an older project which used Corona's [legacy][plugin.facebook] Facebook plugin, you'll need to migrate to the current [Facebook][plugin.facebook-v4] plugin. The following is an overview of the differences between Facebook&nbsp;SDK&nbsp;v3 and Facebook&nbsp;SDK&nbsp;v4, now fully implemented via the [Facebook][plugin.facebook-v4] plugin.

The updated project settings for the current plugin can be found [here][REFLINK 1].

### Additions

* [facebook.getCurrentAccessToken()][plugin.facebook-v4.getCurrentAccessToken] &mdash; This indicates the access token corresponding to which user logged in to Facebook from your app. This can be used to determine if a user is already logged in when the app starts, know when to refresh an access token, and track which permissions need to be requested.

* [facebook.isActive][plugin.facebook-v4.isActive] &mdash; This property lets you know if the <nobr>`facebook-v4`</nobr> plugin has been initialized. The initialization begins when you `require()` the plugin in your project, but it isn't guaranteed to be completed at the time when the next line of code executes.

* [facebook.setFBConnectListener()][plugin.facebook-v4.setFBConnectListener] &mdash; This function lets you set the [fbconnect][api.event.fbconnect] event listener which the <nobr>`facebook-v4`</nobr> plugin will use. It can be used to change the listener conditionally or simply to set the listener at the beginning of your app.

* There are new actions available to [facebook.showDialog()][plugin.facebook-v4.showDialog] which have the <nobr>built-in</nobr> ability to tag a place/friends and share a link to Facebook.

### Deletions

* `facebook.accessDenied` &mdash; Since logging in through __Settings__ on an iOS device is not supported, this API no longer serves a purpose.

### Differences

* To include the current Facebook plugin, use <nobr>`require( "plugin.facebook.v4" )`</nobr>. Do __not__ use <nobr>`require( "facebook" )`</nobr> as with the [legacy][plugin.facebook] plugin.

* Implementation for iOS&nbsp;9 and above requires a few additional steps detailed in the <nobr>top-level</nobr> plugin documentation [here][REFLINK 2].

* If you're using CORONA_NATIVE_PRODUCT for iOS, you'll need to add a reference to the `CoronaFacebookDelegate` in your `Info.plist` as outlined in the <nobr>top-level</nobr> plugin documentation [here][REFLINK 3].

* On Android, you must now include a Facebook App ID in `build.settings`. Previously, you also needed to specify the `android.permission.INTERNET` permission in `build.settings`, but this has been built into the plugin for CORONA_CORE_PRODUCT users. CORONA_NATIVE_PRODUCT users, however, will still need to add the `android.permission.INTERNET` permission to their `AndroidManifest.xml`.

* Passing your Facebook App ID as the first argument to [facebook.login()][plugin.facebook-v4.login] and [facebook.publishInstall()][plugin.facebook-v4.publishInstall] is no longer necessary. Doing so will result in a warning advising you to remove the argument.

* Passing a listener function reference to [facebook.login()][plugin.facebook-v4.login] is now optional. The listener function for [fbconnect][api.event.fbconnect] events can be set independently of [facebook.login()][plugin.facebook-v4.login] via the [facebook.setFBConnectListener()][plugin.facebook-v4.setFBConnectListener] API.

* [facebook.showDialog()][plugin.facebook-v4.showDialog] is more limited on combinations of valid options. This is due to the new [sharing model](https://developers.facebook.com/docs/sharing) introduced in Facebook&nbsp;SDK&nbsp;v4. Currently, only dialog types that are explicitly documented are supported.

* The `"apprequests"` action for [facebook.showDialog()][plugin.facebook-v4.showDialog] has been replaced by `"requests"` which corresponds to the [Game Requests Dialog](https://developers.facebook.com/docs/games/services/gamerequests).

* The URI responses given from [facebook.showDialog()][plugin.facebook-v4.showDialog] will be different as a result of the new [sharing model](https://developers.facebook.com/docs/sharing). For example, a `"link"` action will return only the ID of the post made, while a `"requests"` action will return the request ID and the list of recipients in the request.

* [facebook.showDialog()][plugin.facebook-v4.showDialog] now provides feedback if the user cancelled out of the dialog. If the dialog is cancelled, the [fbconnect][api.event.fbconnect] event will have contain this indication in its [response][api.event.fbconnect.response].

* On CORONA_NATIVE_PRODUCT for Android, the <nobr>`facebook-v4`</nobr> plugin uses a modified version of the Facebook&nbsp;SDK which can be found on [GitHub](https://github.com/coronalabs/plugins-sdk-facebook-android).

<!--- REFERENCE LINKS -->

[REFLINK 1]: index.html#project-settings
[REFLINK 2]: index.html#ios
[REFLINK 3]: index.html#ios-1
