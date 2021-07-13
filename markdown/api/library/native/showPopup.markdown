
# native.showPopup()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          email, sms, text message, store, social, showPopup
> __See also__          [native.canShowPopup()][api.library.native.canShowPopup]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays the operating system's default popup window for a specified service. Displaying this popup suspends the app on both iOS and Android.

This function returns `true` or `false` indicating whether the popup was displayed or not. If it returns `false`, then the popup was not available or the service was not available for the device.


## Syntax

	native.showPopup( name )
	native.showPopup( name, options )

##### name ~^(required)^~
_[String][api.type.String]._ The string name of the popup to be shown. It can be one of the following:

* `"mail"` &mdash; Displays a popup window for composing an email.
* `"sms"` &mdash; Displays a popup window for composing an SMS message.
* `"appStore"` &mdash; Displays a popup window from the app store that the application was downloaded from. It will display the app's details such as the summary, an option to purchase (if&nbsp;not already&nbsp;done), and an option to write a review. This can be used to display the details of the currently running app or another app that you wish to advertise to the user. Currently, these app stores are supported: iTunes&nbsp;App&nbsp;Store, Google&nbsp;Play, and Amazon&nbsp;App&nbsp;Store. If you pass in `"appStore"`, the iTunes&nbsp;App&nbsp;Store requires the `iOSAppId` to be set in the `options` table.
* `"requestAppPermission"` &mdash; Displays a popup window for requesting an app permission.
* `"activity"` &mdash; This setting pertains to the [Activity][plugin.CoronaProvider_native_popup_activity] plugin.
* `"social"` &mdash; This setting pertains to the [Social][plugin.CoronaProvider_native_popup_social] plugin.
* `"addressbook"` &mdash; This setting pertains to the [Address Book][plugin.CoronaProvider_native_popup_addressbook] plugin.
* `"quickLook"` &mdash; This setting pertains to the [Quick Look][plugin.CoronaProvider_native_popup_quickLook] plugin.

##### options ~^(optional)^~
_[Table][api.type.Table]._ A table that specifies the optional properties for the popup — see the section below which corresponds to the `name` parameter.


## mail

The following <nobr>key-value</nobr> pairs apply within the `options` table if `name` is set to `"mail"`:

* `to` &mdash; Single [string][api.type.String] or an [array][api.type.Array] of strings where each string is an email address of a recipient.
* `cc` &mdash; Single [string][api.type.String] or an [array][api.type.Array] of strings where each string is an email address of a cc'd recipient.
* `bcc` &mdash; Single [string][api.type.String] or an [array][api.type.Array] of strings where each string is an email address of a bcc'd recipient.
* `attachment` &mdash; [Table][api.type.Table] in the form `{ baseDir=, filename= [, type=] }`. For the `type` property, use an appropriate [MIME type](https://en.wikipedia.org/wiki/Media_type) such as `"image/png"`, `"image/jpeg"`, `"application/pdf"`, etc. To send multiple attachments, you must create an array of these tables.
* `body` &mdash; [String][api.type.String] for the main body of the email.
* `isBodyHtml` &mdash; [Boolean][api.type.Boolean] indicating whether the email is HTML. By default, plain text is assumed.
* `subject` &mdash; [String][api.type.String] for the subject of the email.


## sms

The following <nobr>key-value</nobr> pairs apply within the `options` table if `name` is set to `"sms"`:

* `to` &mdash; Single [string][api.type.String] or an [array][api.type.Array] of strings where each string is a phone number of the recipient.
* `body` &mdash; [String][api.type.String] for the SMS message content.


## appStore / rateApp

The following <nobr>key-value</nobr> pairs apply within the `options` table if `name` is set to `"appStore"` or `"rateApp"`:

* `iOSAppId` &mdash; [String][api.type.String] ID assigned to the app by the iTunes App Store.
* `tvOSAppId` &mdash; [String][api.type.String] If specified, this will be used on tvOS instead of `iOSAppId`.
* `androidAppPackageName` &mdash; [String][api.type.String] indicating the unique package name of the Android app to be displayed by the Google Play or Amazon app stores. This property is optional. If you do not provide a package name, Solar2D will use the currently running app's package name by default. You should only set this if you want to display the app store details of another app.
* `supportedAndroidStores` &mdash; [Array][api.type.Array] of strings indicating which app stores are supported on Android. This is needed in case the app was not installed by an app store so that Solar2D knows which app store to display the popup from. This is especially needed while testing and debugging the app. Currently, string names of `"amazon"` and `"google"` are supported.


<a id="requestAppPermission"></a>

## requestAppPermission

Currently this option is only available on Android. The following <nobr>key-value</nobr> pairs apply within the `options` table if `name` is set to `"requestAppPermission"`:

* `appPermission` &mdash; Single [string][api.type.String] or an [array][api.type.Array] of strings where each string is an app permission to request. Valid options include the following <nobr>platform-agnostic</nobr> types:

	* `"BodySensors"` &mdash; Corresponds to the `SENSORS` [permission group](https://developer.android.com/reference/android/Manifest.permission_group) on Android. Only available on Android devices running version 4.4W and above. <!--Corresponds to the "Motion and Fitness" privacy setting on iOS.-->

	* `"Calendars"` &mdash; Corresponds to the `CALENDAR` [permission group](https://developer.android.com/reference/android/Manifest.permission_group#CALENDAR) on Android.

	* `"Camera"` &mdash; Corresponds to the `CAMERA` [permission group](https://developer.android.com/reference/android/Manifest.permission_group#CAMERA) on Android.

	* `"Contacts"` &mdash; Corresponds to the `CONTACTS` [permission group](https://developer.android.com/reference/android/Manifest.permission_group#CONTACTS) on Android.

	* `"Location"` &mdash; Corresponds to the `LOCATION` [permission group](https://developer.android.com/reference/android/Manifest.permission_group#LOCATION) on Android.

	* `"Microphone"` &mdash; Corresponds to the `MICROPHONE` [permission group](https://developer.android.com/reference/android/Manifest.permission_group#MICROPHONE) on Android.

	* `"Phone"` &mdash; Corresponds to the `PHONE` [permission group](https://developer.android.com/reference/android/Manifest.permission_group#PHONE) on Android.

	* `"SMS"` &mdash; Corresponds to the `SMS` [permission group](https://developer.android.com/reference/android/Manifest.permission_group#SMS) on Android.

	* `"Storage"` &mdash; Corresponds to the `STORAGE` [permission group](https://developer.android.com/reference/android/Manifest.permission_group#STORAGE) on Android.

    On Android, this can also be the name of anything in the `usesPermissions` table of `build.settings`, such as `"android.permission.READ_SMS"` or `"com.android.voicemail.permission.ADD_VOICEMAIL"`. The full name of an Android [permission group](https://developer.android.com/reference/android/Manifest.permission_group) such as `"android.permission-group.STORAGE"` or `"android.permission-group.PHONE"` is also valid.

    To properly use app permissions on Android, you'll need to add __at&nbsp;least&nbsp;one__ of the Android permissions corresponding to a <nobr>platform-agnostic</nobr> type to the `usesPermissions` table of `build.settings`. See __Table&nbsp;1__ of Android's [dangerous permission group documentation](https://developer.android.com/guide/topics/permissions/overview#permission-groups) for more information on which Android permissions correspond with which <nobr>platform-agnostic</nobr> types.

* `urgency` &mdash; [String][api.type.String] representing how urgent this permission request is to running the app. Must be one of the following values:

	* `"Low"` &mdash; This is the default urgency level. It indicates that something minor is dependent on the app permission, but most features of the app can be experienced without this permission. These requests simply ask for the permission and, if the request is denied, no additional effort is made to change the user's decision. For example, the `"Location"` permission is not a mandatory aspect of using the camera.

	* `"Normal"` &mdash; A worthwhile feature of this app is dependent on the app permission. While the app can work without the permission, a significant part of the experience will be missing. With `"Normal"` urgency, if the user denies the app permission request, the app permission rationale dialog will be presented to explain the reasoning behind the permission request. For example, access to `"Contacts"` for a social media app is useful for sending friend requests to your contacts, but the app can function without it.

	* `"Critical"` &mdash; The basic functionality of this app is dependent on the app permission and getting access is necessary. For example, `"Camera"` access is critical to a QR&nbsp;code reader. This urgency level has all of the same behaviors as `"Normal"`, but if the "Never&nbsp;Ask&nbsp;Again" option is selected, upon the next occasion this permission is requested, the settings redirect dialog will appear which prompts the user to grant the permission in __Settings__.

* `listener` &mdash; [Listener][api.type.Listener] which supports basic [popup events][api.event.popup]. In addition, for `"requestAppPermission"`, it supports the following properties:

	* `event.grantedAppPermissions` &mdash; [Table][api.type.Table] containing the [string][api.type.String] representation of each app permission that was just granted to the app. On Android, the `usesPermission` names are used for any app permissions that don't have a <nobr>platform-agnostic</nobr> representation. Because of this, table contents can be a mix of <nobr>platform-agnostic</nobr> types and Android `usesPermission` names.

	* `event.deniedAppPermissions` &mdash; [Table][api.type.Table] containing the [string][api.type.String] representation of each app permission that was just requested and __denied__ to the app. On Android, the `usesPermission` names are used for any app permissions that don't have a <nobr>platform-agnostic</nobr> representation. Because of this, table contents can be a mix of <nobr>platform-agnostic</nobr> types and Android `usesPermission` names.

	* `event.neverAskAgain` &mdash; [Boolean][api.type.Boolean] value which corresponds to the "Never&nbsp;Ask&nbsp;Again" checkbox that's presented if an app permission is requested multiple times. This value is on a <nobr>per-permission</nobr> basis, so it may be `true` for one permission but `false` for another.

* `rationaleTitle` &mdash; [String][api.type.String] containing the title for the app permission rationale dialog. If `urgency` is set to `"Low"`, this option will be ignored.

* `rationaleDescription` &mdash; [String][api.type.String] containing the description for the app permission rationale dialog. If `urgency` is set to `"Low"`, this option will be ignored.

* `settingsRedirectTitle` &mdash; [String][api.type.String] containing the title for the settings redirect dialog. This option only applies if `urgency` is set to `"Critical"`.

* `settingsRedirectDescription` &mdash; [String][api.type.String] containing the description for the settings redirect dialog. This option only applies if `urgency` is set to `"Critical"`.


## activity

The `name` value of `"activity"` pertains to the [Activity][plugin.CoronaProvider_native_popup_activity] plugin.


## social

The `name` value of `"social"` pertains to the [Social][plugin.CoronaProvider_native_popup_social] plugin.


## addressbook

The `name` value of `"addressbook"` pertains to the [Address Book][plugin.CoronaProvider_native_popup_addressbook] plugin.


## quickLook

The `name` value of `"quickLook"` pertains to the [Quick Look][plugin.CoronaProvider_native_popup_quickLook] plugin.


## safariView

The `name` value of `"safariView"` pertains to the [Safari View][plugin.CoronaProvider_native_popup_safariView] plugin.


## Examples

##### Email Popup

`````lua
-- Email popup with one file attachment
local options =
{
   to = "john.doe@somewhere.com",
   subject = "My High Score",
   body = "I scored over 9000!!! Can you do better?",
   attachment = { baseDir=system.DocumentsDirectory, filename="Screenshot.png", type="image/png" }
}
native.showPopup( "mail", options )
`````

##### HTML Email Popup

`````lua
-- Email popup with multiple correspondents and attachments
local options =
{
   to = { "john.doe@somewhere.com", "jane.doe@somewhere.com" },
   cc = { "john.smith@somewhere.com", "jane.smith@somewhere.com" },
   subject = "My High Score",
   isBodyHtml = true,
   body = "<html><body>I scored over <b>9000</b>!!! Can you do better?</body></html>",
   attachment =
   {
      { baseDir=system.DocumentsDirectory, filename="Screenshot.png", type="image/png" },
      { baseDir=system.ResourceDirectory, filename="MyLogo.png", type="image/png" }
   }
}
native.showPopup( "mail", options )
`````

##### SMS Popup (Simple)

`````lua
local options =
{
   body = "I scored over 9000!!! Can you do better?"
}
native.showPopup( "sms", options )
`````

##### SMS Popup (Multiple Recipients)

`````lua
local options =
{
   to = { "1234567890", "9876543210" },
   body = "I scored over 9000!!! Can you do better?"
}
native.showPopup( "sms", options )
`````

##### Store Details

`````lua
local options =
{
   iOSAppId = "1234567890",
   supportedAndroidStores = { "google", "amazon" }
}
native.showPopup( "appStore", options )
`````

##### Store Details for Another App

`````lua
local options =
{
   iOSAppId = "1234567890",
   androidAppPackageName = "my.other.app.",
   supportedAndroidStores = { "google", "amazon" }
}
native.showPopup( "appStore", options )
`````


##### Simple App Permission Request

`````lua
local options =
{
   appPermission = "Calendars"
}
native.showPopup( "requestAppPermission", options )
`````

##### Critical App Permission Request

`````lua
local function appPermissionsListener( event )
	for k,v in pairs( event.grantedAppPermissions ) do
		if ( v == "Camera" ) then
			print( "Camera permission granted!" )
		end
	end
end

local options =
{
	appPermission = "Camera",
	urgency = "Critical",
	listener = appPermissionsListener,
	rationaleTitle = "Camera access required",
	rationaleDescription = "Camera access is required to take photos. Re-request now?",
	settingsRedirectTitle = "Alert",
	settingsRedirectDescription = "Without the ability to take photos, this app cannot properly function. Please grant camera access within Settings."
}
native.showPopup( "requestAppPermission", options )
`````
