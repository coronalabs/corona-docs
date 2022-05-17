# facebook.* (v4a)

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook
> __Platforms__			Android, iOS
> __See also__          [Facebook Portal Setup][guide.social.setupFacebook] _(guide)_
>						[Implementing Facebook][guide.social.usingFacebook] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

This documentation is for the Facebook __v4a__ plugin, an updated version of the [v4][plugin.facebook-v4] plugin. This updated version is asynchronous and includes a new [facebook.init()][plugin.facebook-v4a.init] API which gives you a chance to define a specific function that will be called when initialization completes.

Facebook now requires you to include a Client Token from your App Page (Under App Settings>Advanced>Security), <nobr>(see [Project Settings](#settings) for where to put the Token)</nobr>

To utilize this version, you should update your `build.settings` to include `"plugin.facebook.v4a"` <nobr>(see [Project Settings](#settings))</nobr>, require `"plugin.facebook.v4a"` in all Lua modules which use Facebook <nobr>(see [Syntax](#syntax))</nobr>, and integrate [facebook.init()][plugin.facebook-v4a.init] into your existing project code.

</div>
</div>


## Overview

The Facebook plugin provides a set of APIs for accessing the Facebook social network. The functions allow a user to login/logout, post messages and images, retrieve the status of users, send game invites, and more.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Your app must work properly with <nobr>single-sign-on</nobr> (SSO). Please read the [Facebook Portal Setup][guide.social.setupFacebook] guide for more information on how to implement <nobr>single-sign-on</nobr> in your <nobr>Facebook-enabled</nobr> apps.

</div>


<!---

## Changes / Updates 

The Facebook platform evolves very quickly and changes frequently. Because of this, the Facebook plugin must also evolve, and sometimes these changes will alter the behavior of your apps. Consult our [Facebook Versioning/Upgrading][plugin.facebook-v4a.fbUpgrade] guide for more info on moving between different versions of the Facebook plugin.

-->


## Registration

Developing for Facebook requires that you register in the [Facebook Developer Portal](https://developers.facebook.com/).


## Syntax

	local facebook = require( "plugin.facebook.v4a" )


## Functions

#### [facebook.getCurrentAccessToken()][plugin.facebook-v4a.getCurrentAccessToken]

#### [facebook.init()][plugin.facebook-v4a.init]

#### [facebook.isFacebookAppEnabled()][plugin.facebook-v4a.isFacebookAppEnabled]

#### [facebook.login()][plugin.facebook-v4a.login]

#### [facebook.logout()][plugin.facebook-v4a.logout]

#### [facebook.publishInstall()][plugin.facebook-v4a.publishInstall]

#### [facebook.request()][plugin.facebook-v4a.request]

#### [facebook.setFBConnectListener()][plugin.facebook-v4a.setFBConnectListener]

#### [facebook.showDialog()][plugin.facebook-v4a.showDialog]


## Properties

#### [facebook.isActive][plugin.facebook-v4a.isActive]


## Events

#### [fbconnect][plugin.facebook-v4a.event.fbconnect]

#### [fbinit][plugin.facebook-v4a.event.fbinit]


<a name="settings"></a>

## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings = {

	plugins =
	{
		["plugin.facebook.v4a"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

### iOS

If your app is for iOS, you must also include the following code in `build.settings` to ensure that the native Facebook app functions properly:

``````lua
settings = {

	iphone =
	{
		plist =
		{
			UIApplicationExitsOnSuspend = false,
			FacebookAppID = "XXXXXXXXXX",  -- Replace XXXXXXXXXX with your Facebook App ID
			CFBundleURLTypes =
			{
				{ CFBundleURLSchemes = { "fbXXXXXXXXXX", } }  -- Replace XXXXXXXXXX with your Facebook App ID
			},
			FacebookClientToken = "XXXXXXXXXX",  -- Replace XXXXXXXXXX with your Facebook Client ID
			-- Whitelist Facebook apps
			LSApplicationQueriesSchemes =
			{
				"fb",  -- Needed for the facebook-v4a.isFacebookAppEnabled() API
				"fbapi",
				"fbauth2",
				"fb-messenger-api",
				"fbshareextension"
			},
		},
	},
}
``````

Notice that there are several critical parts which must be specified:

* `UIApplicationExitsOnSuspend` &mdash; To ensure that Facebook can resume your app properly, you must include `UIApplicationExitsOnSuspend = false`. If you've set this parameter to `true` for some other reason, you must revert it to `false` (default).

* `FacebookAppID` &mdash; Set this key to `FacebookAppID = "XXXXXXXXXX"` and replace `XXXXXXXXXX` with your unique Facebook App&nbsp;ID.

* `CFBundleURLTypes` &mdash; The `CFBundleURLTypes` table must be declared exactly as shown and it must include a table named `CFBundleURLSchemes`. Inside this, include your Facebook&nbsp;App&nbsp;ID and prefix it with `fb`. Thus, if your App&nbsp;ID is __1234567890__, you should specify: `"fb1234567890"`.

* `LSApplicationQueriesSchemes` &mdash; This table of whitelisted URL schemes ensures that your app and the Facebook&nbsp;SDK run properly together.

### Android

If your app is for Android, you must also include a <nobr>Facebook App ID</nobr> in `build.settings`:

``````lua
settings =
{
	android =
	{
		facebookAppId = "XXXXXXXXXX",  -- Replace XXXXXXXXXX with your Facebook App ID
		applicationChildElements =
        {
            -- Array of strings
            [[
                <provider android:authorities="com.facebook.app.FacebookContentProviderXXXXXXXXXX"
                          android:name="com.facebook.FacebookContentProvider" android:exported="true"/>
            ]],
						[[
                <meta-data android:name="com.facebook.sdk.ClientToken" android:value="YYYYYYYYYYYYYYYYYYYYY"/>
            ]],
        }, -- Replace XXXXXXXXXX with your Facebook App ID and YYYYYYYYYYYYYYYYYYYYY with Facebook Client Token
	},
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`

</div>


## CORONA_NATIVE_PRODUCT

### iOS

If you're using CORONA_NATIVE_PRODUCT for iOS, you should ensure that the following static libraries are linked:

* `libBolts.a`

* `libFBSDKCoreKit.a`

* `libFBSDKLoginKit.a`

* `libFBSDKShareKit.a`

* `libfacebook.a`

In addition, you'll need to add several properties to your `Info.plist`. Open the file in an external text editor and add the following XML code into it:

``````xml
<key>UIApplicationExitsOnSuspend</key>
<false/>
<key>FacebookAppID</key>
<!-- Replace XXXXXXXXXX with your Facebook App ID -->
<string>XXXXXXXXXX</string>
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleURLSchemes</key>
		<array>
			<!-- Replace XXXXXXXXXX with your Facebook App ID -->
			<string>fbXXXXXXXXXX</string>
		</array>
	</dict>
</array>
<key>LSApplicationQueriesSchemes</key>
<array>
	<string>fb</string>
	<string>fbapi</string>
	<string>fbauth2</string>
	<string>fb-messenger-api</string>
	<string>fbshareextension</string>
</array>
<key>CoronaDelegates</key>
<array>
	<string>CoronaFacebookDelegate</string>
</array>
``````

This has all of the same critical pieces as the `build.settings` additions for <nobr>non-CORONA_NATIVE_PRODUCT</nobr> implementation, plus the addition of the `CoronaDelegates` key with `CoronaFacebookDelegate` in its array. This allows Facebook login to work as well as suspending/resuming your app while Facebook is active.

### Android

<!-- TODO: REWRITE WITH LINKING IN SOURCE CODE OPTIONAL -->

If you're using CORONA_NATIVE_PRODUCT for Android, there are several configuration changes you'll need to make to your Android&nbsp;Studio project. Be sure to follow this procedure carefully as even minor mistakes can result in debugging headaches.

1. Locate the plugin binaries package that accommodates your build of CORONA_NATIVE_PRODUCT and copy __only__ the `"plugin.facebook.v4a.jar"` file into your project's `"libs"` directory.

<div class="code-indent">
<div class="guide-notebox">
<div class="notebox-title">Note</div>

The rest of the binaries in the Facebook plugin package will be copied/rebuilt for you later when the Facebook&nbsp;SDK is linked to your Android&nbsp;Studio project.

</div>
</div>

2. Add the following permission to your `AndroidManifest.xml`:

<div class="code-indent">

``````xml
<uses-permission android:name="android.permission.INTERNET"/>
``````

</div>

3. In the `application` element of your `AndroidManifest.xml`, add a <nobr>`meta-data`</nobr> tag containing your Facebook&nbsp;App&nbsp;ID and Facebook&nbsp;Client&nbsp;Token.

<div class="code-indent">

``````xml
<!-- Replace XXXXXXXXXX with your Facebook App ID -->
<meta-data android:name="com.facebook.sdk.ApplicationId" android:value="\ XXXXXXXXXX"/>
<!-- Replace XXXXXXXXXX with your Facebook ClientToken-->
<meta-data android:name="com.facebook.sdk.ClientToken" android:value="\ XXXXXXXXXX"/>
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Since your Facebook App ID is a number that needs to be converted to a string for Android, the <nobr>`\ `</nobr> in the assignment of `android:value` is required.

</div>
</div>

<a id="displayname"></a>

4. Similarly, add a <nobr>`meta-data`</nobr> tag containing the __Display&nbsp;Name__ as posted in the [Facebook Developer Portal](https://developers.facebook.com/). This can be found under <nobr>__Settings__ &rarr; __Basic__ &rarr; __Display Name__</nobr>.

<div class="code-indent">

``````xml
<!-- Replace XXXXXXXXXX with your Facebook Display Name from the Facebook Developer Portal -->
<meta-data android:name="com.facebook.sdk.ApplicationName" android:value="XXXXXXXXXX"/>
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The `ApplicationName` <nobr>`meta-data`</nobr> tag is required for using the [Share Dialog](https://developers.facebook.com/docs/sharing/reference/share-dialog).

</div>
</div>

5. Next, add the following activities to your `AndroidManifest.xml`:

<div class="code-indent">

``````xml
<activity android:name="com.facebook.FacebookActivity"
		android:configChanges="keyboard|keyboardHidden|screenLayout|screenSize|orientation"
		android:theme="@android:style/Theme.Translucent.NoTitleBar" />
<activity android:name="plugin.facebook.v4a.FacebookFragmentActivity"
		android:theme="@android:style/Theme.NoTitleBar.Fullscreen"
		android:configChanges="keyboardHidden|screenSize|orientation"/>
``````

</div>

6. Download Corona's fork of the Facebook&nbsp;SDK for Android available [here](https://github.com/coronalabs/plugins-sdk-facebook-android).

<div class="code-indent">
<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Since Facebook v4 uses a modified version of the Facebook&nbsp;SDK on Android, it's important that you make a library reference to the version of the Facebook&nbsp;SDK that is provided on GitHub.

</div>
</div>

<!-- TODO: MAKE LINKING IN THE SOURCE CODE OPTIONAL! -->

7. Link in the source code for the Facebook&nbsp;SDK via <nobr>__File__ &rarr; __New__ &rarr; __Import Module__</nobr> in Android&nbsp;Studio. Once you're at the __New&nbsp;Module__ screen, select the [__...__] button next to the __Source&nbsp;Directory__ field and browse to the downloaded Facebook&nbsp;SDK noted in the step above.

8. Find the `facebook` directory in the downloaded Facebook&nbsp;SDK. Confirm selection of that Gradle project and then click __Finish__ on the __New&nbsp;Module__ screen to import the Facebook&nbsp;SDK as a module for your CORONA_NATIVE_PRODUCT project.

9. In the downloaded Facebook SDK, locate the `gradle.properties` file in the root directory and copy its contents to your Android&nbsp;Studio project's `gradle.properties` file.

10. Back in Android Studio, open the <nobr>`build.gradle (Module: app)`</nobr> file and add this line to the bottom of the `dependencies` block:

<div class="code-indent">

``````gradle
compile project(':facebook')
``````

</div>
