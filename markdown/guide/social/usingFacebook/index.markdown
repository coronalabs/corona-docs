# Implementing Facebook

This guide discusses how to implement common Facebook tasks and processes in your Corona app.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you just need to perform basic tasks like posting a Facebook user's status update, the [Social Popup][plugin.CoronaProvider_native_popup_social] plugin (Android) or the [Activity Popup][plugin.CoronaProvider_native_popup_activity] plugin (iOS) is the easiest method. However, if you need to perform more advanced tasks or create a more complete integration of Facebook within an app, please proceed with the instructions in this guide.

</div>

<div class="guides-toc">

* [Including the Plugin](#plugin)
* [User Experience](#user-experience)
* [iOS Requirements](#ios-requirements)
* [Android Requirements](#android-requirements)
* [Logging In/Out](#login-logout)
* [Facebook Listener](#listener)
* [Making Requests](#requests)
* [Using Dialogs](#dialogs)
* [Published Installs](#published-installs)

</div>


<a id="plugin"></a>

## Including the Plugin

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

To begin using the [Facebook][plugin.facebook-v4a] plugin, you must first [register](https://developers.facebook.com/) as a Facebook developer and configure your app in the [Facebook Developer Portal](https://developers.facebook.com/). Please see the [Facebook Portal Setup][guide.social.setupFacebook] guide for assistance with this process&nbsp;&mdash; it requires some __very__ precise information and it's imporant to follow every step carefully.

</div>

As with all Corona plugins, you must include the [Facebook][plugin.facebook-v4a] plugin within the `plugins` table of `build.settings`:

``````lua
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

Then, you must `require()` the plugin in any module where you need to access its methods and properties:

``````lua
local facebook = require( "plugin.facebook.v4a" )
``````




<a id="user-experience"></a>

## User Experience

The user experience for different components of the Facebook plugin vary depending on the presence of a native Facebook app. In many cases, if a native Facebook app is on the device, operations like logging in or presenting the [Share Dialog](https://developers.facebook.com/docs/sharing/reference/share-dialog) may try to redirect the heavy lifting to the Facebook app. The cases where a redirect to the Facebook app occurs has changed a lot throughout the history of the Facebook&nbsp;SDK, so your app should be prepared for a Facebook operation to suspend and then resume your app after the Facebook operation completes.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

On Android, a native Facebook app could be the standard [Facebook app](https://play.google.com/store/apps/details?id=com.facebook.katana&hl=en) or the [Facebook Lite app](https://play.google.com/store/apps/details?id=com.facebook.lite&hl=en). Each native app may result in a different user experience.

</div>

### Login Considerations

Before the Facebook Graph API can be used, the app must successfully log in to Facebook. Then, it must gather the required authentication information and the specific permissions required by the app.

* If the mobile device has a native Facebook app installed, your app will launch it and ask for the necessary permissions. When this happens, your app is temporarily suspended and placed into the background while the native Facebook app runs. When complete (the&nbsp;user has either granted permission or has&nbsp;cancelled), the Facebook app will try to restore your app and put it in the foreground, bringing with it the information about your permission request.

* If the mobile device does __not__ have a native Facebook app installed, it will use Facebook's website to log in. This happens through a web view, so your app is never actually suspended to the background. In general, the <nobr>web-based</nobr> login method is very reliable, but you (the&nbsp;developer) cannot control if your app's user does or doesn't have the native Facebook app installed. Therefore, you must support both methods.

* Facebook encourages developers to delay logging in to Facebook until necessary, and at the user's choosing. Automatically logging the user in within `main.lua` is discouraged.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The Facebook&nbsp;v4 plugin uses a [SFSafariViewController](https://developer.apple.com/reference/safariservices/sfsafariviewcontroller) to log in on iOS&nbsp;9 and above.

* On low-end Android devices, it's more likely that a Facebook app will fail to restore your app when used for logging in. This may be caused by the Android&nbsp;OS terminating your app because it's running low on memory.

</div>




<a id="ios-requirements"></a>

## iOS Requirements

If your app is for iOS, you must include specific aspects within your `build.settings` file to ensure that the native Facebook app functions properly. Please see the [plugin documentation][plugin.facebook-v4a#ios] for details.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you want to publish multiple iOS apps that use the same Facebook&nbsp;App&nbsp;ID, for example a trial version and full version of the same app, this can be accomplished via a `FacebookUrlSchemeSuffix` key in the <nobr>`iphone` &rarr; `plist`</nobr> table of `build.settings`, along with other minor edits as noted below. See Facebook's [iOS SDK FAQ](https://developers.facebook.com/docs/ios/troubleshooting) for more info.

``````lua
settings = {

	iphone =
	{
		plist =
		{
			FacebookUrlSchemeSuffix = "suffix",
			["URL types"] =
			{
				item =
				{
					["URL Schemes"] = { ["Item 0"] = "fbXXXXXXXXXXsuffix" },  -- Replace XXXXXXXXXX with your Facebook App ID
				},
			},

			MinimumOSVersion = "8.0",
			UIApplicationExitsOnSuspend = false,
			FacebookAppID = "XXXXXXXXXX",  -- Replace XXXXXXXXXX with your Facebook App ID
			CFBundleURLTypes =
			{
				{ CFBundleURLSchemes = { "fbXXXXXXXXXXsuffix", } }  -- Replace XXXXXXXXXX with your Facebook App ID
			},
		}
	}
}
``````

</div>




<a id="android-requirements"></a>

## Android Requirements

On Android, Facebook uses your app __Package&nbsp;Name__, for example `com.yoursite.yourapp`. To ensure that the native Facebook app functions properly, you must provide Facebook's portal with two important pieces of information&nbsp;&mdash; these include the __Class&nbsp;Name__ of `com.ansca.corona.CoronaActivity` and the __Key&nbsp;Hash__ gathered from the keystore you built your app with. These are discussed in the [Facebook Portal Setup][guide.social.setupFacebook] guide.

Furthermore, the Facebook v4 plugin needs to know about your unique Facebook&nbsp;App&nbsp;ID&nbsp;(`facebookAppId`):

``````lua
settings =
{
	android =
	{
		facebookAppId = "XXXXXXXXXX",  -- Replace XXXXXXXXXX with your Facebook App ID
	},
}
``````




<a id="Initialization"></a>

## Initialization

The Facebook plugin begins initializing when you require the plugin the first time. Depending on network conditions, this could take several seconds. In your `main.lua` file, you can create a listener function to notify you when initialization is complete and reference that function within [facebook.init()][plugin.facebook-v4a.init]:

``````lua
local function facebookListener( event )

	if ( "fbinit" == event.name ) then

		print( "Facebook initialized" )

		-- Initialization complete; call "facebook.publishInstall()"
		facebook.publishInstall()

	elseif ( "fbconnect" == event.name ) then

		if ( "session" == event.type ) then
			-- Handle login event and try to share the link again if needed
		elseif ( "dialog" == event.type ) then
			-- Handle dialog event
		end
	end
end

-- Set the "fbinit" listener to be triggered when initialization is complete
facebook.init( facebookListener )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This listener function can be the same function that you'll use for Facebook requests, dialogs, and logging in, but if you prefer to use a different function for those aspects, simply specify that function reference within [facebook.login()][plugin.facebook-v4a.login].

</div>




<a id="login-logout"></a>

## Logging In/Out

Logging in to Facebook is accomplished through [facebook.login()][plugin.facebook-v4a.login]. If you didn't already set a [listener][api.type.Listener] function via [facebook.init()][plugin.facebook-v4a.init] or  [facebook.setFBConnectListener()][plugin.facebook-v4a.setFBConnectListener], you can set it by passing the listener reference as the first argument to [facebook.login()][plugin.facebook-v4a.login].

Secondly, via [facebook.login()][plugin.facebook-v4a.login], you can request an array of [permissions](https://developers.facebook.com/docs/facebook-login/permissions). Both <nobr>__read-only__</nobr> and __publishable__ permissions can be specified, with some caveats which are outlined in the [facebook.login()][plugin.facebook-v4a.login] documentation.

Putting these two aspects together, a login call might look like this:

``````lua
facebook.login( facebookListener, { "email", "user_birthday" } )
``````

Logging the user out is even easier. To disconnect the app from Facebook's services, simply call [facebook.logout()][plugin.facebook-v4a.logout]. Note, however, that this does __not__ log the device's user out of Facebook entirely&nbsp;&mdash; if the user is logged into Facebook through a native Facebook app or the device's browser, they will remain logged in via those means.

``````lua
facebook.logout()
``````




<a id="listener"></a>

## Facebook Listener

All Facebook requests will call the listener function you passed to [facebook.init()][plugin.facebook-v4a.init], [facebook.login()][plugin.facebook-v4a.login], or set via [facebook.setFBConnectListener()][plugin.facebook-v4a.setFBConnectListener]. For&nbsp;example:

``````lua
local function facebookListener( event )

	if ( "fbinit" == event.name ) then

		print( "Facebook initialized" )

	elseif ( "fbconnect" == event.name ) then

		-- Event type of "session" covers various login/logout events
		if ( "session" == event.type ) then
			-- Handle login event and try to share the link again if needed

		-- Event.type of "request" handles calls to various Graph API functionalities
		elseif ( "request" == event.type ) then
			if not event.isError then
				-- Process response data here
			end

		-- Event.type of "dialog" indicates standard popup boxes that can be displayed
		elseif ( "dialog" == event.type ) then
			-- Handle dialog event
		end
	end
end
``````




<a id="requests"></a>

## Making Requests

To make different Graph API requests, use the [facebook.request()][plugin.facebook-v4a.request] call. By default, this call makes <nobr>`HTTP GET`</nobr> requests to Facebook. If you wish to use another method, set the second parameter (`httpMethod`) to a value outlined in the [facebook.request()][plugin.facebook-v4a.request] documentation.

``````
facebook.request( path [, httpMethod] [, params] )
``````

The only required parameter is `path` which is based on the [Facebook Graph API](https://developers.facebook.com/docs/graph-api) path. This will typically be the REST object that you want to access. For example, the following command will retrieve the latest posts from the user's account feed:

``````lua
facebook.request( "me/feed" )
``````

Some Graph API calls also require parameters to be passed to [facebook.request()][plugin.facebook-v4a.request]. This is done via the optional `params` table, for instance:

``````lua
facebook.request( "me/feed", "POST", { message="Hello Facebook" } )
``````

To upload a photo to your Facebook photo album, the `params` table can be filled in based on the standard Graph&nbsp;API parameters found [here](https://developers.facebook.com/docs/graph-api/reference/photo#Creating):

``````lua
local attachment = {
	caption = "Corona icon file",
	url = "http://www.coronalabs.com/links/demo/Corona90x90.png",
}
facebook.request( "me/photos", "POST", attachment )
``````

When [facebook.request()][plugin.facebook-v4a.request] calls complete, your Facebook listener function will be called with an `event.type` of `"request"`. Facebook generally returns your data as `event.response`, a <nobr>JSON-encoded</nobr> table of data. To convert this into a Lua table, call [json.decode()][api.library.json.decode], remembering to first `require()` the JSON library.

To learn more about which requests, parameters, and data Facebook provides, please see the [Facebook Graph API](https://developers.facebook.com/docs/graph-api) documentation.




<a id="dialogs"></a>

## Using Dialogs

Facebook requires that some tasks be done through dialogs they control. To use a dialog, call the [facebook.showDialog()][plugin.facebook-v4a.showDialog] function:

	facebook.showDialog( action, params )

For this call, the `action` parameter specifies the dialog type:

* The [Share Dialog](https://developers.facebook.com/docs/sharing/reference/share-dialog) displays the Facebook dialog for sharing content. For example, if you wanted to post a link to your Facebook wall and send a message along with it, you could do something like:

<div class="code-indent">

``````lua
facebook.showDialog( "link",
{
	name = "Implementing Facebook with Corona",
	link = "https://docs.coronalabs.com/guide/social/usingFacebook/index.html"
})
``````

</div>

* The [Game Request Dialog](https://developers.facebook.com/docs/games/services/gamerequests) displays a native view which allows the user to send game requests to their choice of friends. For&nbsp;instance:

<div class="code-indent">

``````lua
facebook.showDialog( "requests",
{
	message = "You should download this game!",
	filter = "APP_NON_USERS"
})
``````

</div>

Observe how the `params` argument is a table of key/value pairs which gets passed to the Facebook&nbsp;API call. The keys that you pass correspond to specific options which are available for the dialog. See the [facebook.showDialog()][plugin.facebook-v4a.showDialog] documentation for details.




<a id="published-installs"></a>

## Published Installs

While not part of the Graph API, __Published&nbsp;Installs__ is a way for apps to participate in Facebook's mobile ad campaign which can report (to&nbsp;Facebook) that the app has been installed. This process is simple and there is no callback information or need to call [facebook.login()][plugin.facebook-v4a.login]&nbsp;&mdash; just call [facebook.publishInstall()][plugin.facebook-v4a.publishInstall]:

``````lua
facebook.publishInstall()
``````
