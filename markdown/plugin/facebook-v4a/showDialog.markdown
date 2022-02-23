# facebook.showDialog()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, showDialog
> __See also__          [facebook.login()][plugin.facebook-v4a.login]
>						[facebook.*][plugin.facebook-v4a]
>						[fbconnect][plugin.facebook-v4a.event.fbconnect]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays an interactive Facebook UI dialog for publishing posts to a user's stream, inviting friends to your app, etc. Use [facebook.request()][plugin.facebook-v4a.request] if you need the application itself to do the posting.

The response from the dialog comes back in the form of a [fbconnect][plugin.facebook-v4a.event.fbconnect] event that is sent to the listener specified within [facebook.init()][plugin.facebook-v4a.init] or [facebook.setFBConnectListener()][plugin.facebook-v4a.setFBConnectListener].


## Syntax

	facebook.showDialog( action, params )

##### action ~^(required)^~
_[String][api.type.String]._ The dialog you want to show. Valid options include:

* `"feed"` &mdash; Opens the [Share Dialog](https://developers.facebook.com/docs/sharing/reference/share-dialog) in Feed mode.
* `"link"` &mdash; Corresponds to the [Share Dialog](#sharedialog).
* `"photo"` &mdash; Corresponds to the [Share Dialog](#sharedialog).
* `"requests"` &mdash; Corresponds to the [Game Requests Dialog](#gamerequestdialog).

##### params ~^(required)^~
_[Table][api.type.Table]._ Lua table of <nobr>key-value</nobr> pairs that is passed as arguments to the Facebook API call. The keys you pass here correspond to specific parameters which are available for the dialog that you want to show&nbsp;&mdash; see [Share Dialog](#sharedialog) and [Game Requests Dialog](#gamerequestdialog) below for details.


<a id="sharedialog"></a>

## Share Dialog

Displays the Facebook dialog for sharing content. For this dialog, `action` should be either `"link"` or `"photo"`.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

* On Android, for a shared link to be posted from your app, you must ensure that __Application&nbsp;Name__ provided when building the app from the Corona&nbsp;Simulator matches the __Display&nbsp;Name__ field in the [Facebook Developer Portal](https://developers.facebook.com/). For CORONA_NATIVE_PRODUCT developers, this requirement is outlined [here][plugin.facebook-v4a#displayname].

* To share photos with the Share Dialog, version 7.0 or higher of a Facebook app __must__ be installed on the device.

</div>

For this dialog, the `params` table can contain the following <nobr>key-value</nobr> pairs. Note that some keys are required while others are not.

* `link` &mdash; Required if `action` is `"link"`; [string][api.type.String] value for a URL for the content being shared.
* `peopleIds` &mdash; Optional [table][api.type.Table] containing the list of IDs for taggable people to tag with this content.
* `placeId` &mdash; Optional [string][api.type.String] value for the ID for a place to tag with this content.
* `ref` &mdash; Optional [string][api.type.String] value to be added to the referrer URL when a person follows a link from this shared content on their feed.
* `title` &mdash; Optional if `action` is `"link"`; [string][api.type.String] value for the title to display for this link.
* `description` &mdash; Optional if `action` is `"link"`; [string][api.type.String] value with the description of the link.
* `picture` &mdash; Optional if `action` is `"link"`; [string][api.type.String] value for a URL of a picture to attach to this content.
* `photos` &mdash; Required if `action` is `"photo"`; [array][api.type.Array] of Lua tables containing info about the photos to share. Each table inside this array should include a `url` key with a [string][api.type.String] value representing a URL for the photo.


<a id="gamerequestdialog"></a>

## Game Request Dialog

Displays a native view which allows the user to send game requests to their choice of friends. For this dialog, `action` should be `"requests"`.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* To use this, be sure that your app is categorized as a game in the [Facebook Developer Portal](https://developers.facebook.com/).

* On iOS, for a game request to go through to the desired recipient, you must ensure that __iPhone__ and/or __iPad&nbsp;Store&nbsp;ID__ fields in the [Facebook Developer Portal](https://developers.facebook.com/) are filled out. See the [Facebook Portal Setup][guide.social.setupFacebook] guide for more info.

</div>

For this dialog, the `params` table can contain the following <nobr>key-value</nobr> pairs.

* `to` &mdash; [String][api.type.String] value for the user ID of the person to send this request to.
* `title` &mdash; [String][api.type.String] value for the title of the dialog.
* `message` &mdash; [String][api.type.String] value for a message to be sent along with the game request.
* `suggestions` &mdash; [Table][api.type.Table] containing the user IDs of suggested friends for this game request.
* `data` &mdash; [String][api.type.String] value for additional data to attach to the post.
* `objectId` &mdash; [String][api.type.String] value for the Open Graph object ID of the object being sent.
* `actionType` &mdash; [String][api.type.String] value for defining additional context about the nature of the request. By default, no action type is used. Supported `actionType` values include:
 	* `"SEND"` &mdash; The user is sending an object to friends. Requires an `objectId` to also be provided. Maps to the [gifting and social trading](https://developers.facebook.com/docs/games/services/gamerequests#gifting) scenario.
	* `"ASKFOR"` &mdash; The user is asking for an object from friends. Requires an `objectId` to also be provided. Maps to the [asking for help](https://developers.facebook.com/docs/games/services/gamerequests#askforhelp) scenario.
	* `"TURN"` &mdash; It is the turn of the friends to play against the user in a match. An `objectId` should __not__ be provided in this case. Maps to the [turn-based games](https://developers.facebook.com/docs/games/services/gamerequests#turnbased) scenario.
* `filter` &mdash; [String][api.type.String] value for a filter on who can be displayed in the <nobr>multi-friend</nobr> selector. By default, all friends will be displayed in the selector. Supported `filter` values include:
	* `"APP_USERS"` &mdash; Only friends who use the app will be displayed.
	* `"APP_NON_USERS"` &mdash; Only friends who do __not__ use the app will be displayed. Maps to the [invites](https://developers.facebook.com/docs/games/services/gamerequests#invites) scenario.


## Examples

##### Share Dialog

``````lua
local facebook = require( "plugin.facebook.v4a" )

local function facebookListener( event )

	if ( "fbinit" == event.name ) then

		print( "Facebook initialized" )
		facebook.login()

	elseif ( "fbconnect" == event.name ) then

		if ( "session" == event.type ) then
			-- Handle login event
			if ( "login" == event.phase ) then
				local shareParams = {
					link = "https://www.coronalabs.com/",
					title = "Corona Labs"
				}
				facebook.showDialog( "link", shareParams )
			end

		elseif ( "dialog" == event.type ) then
			-- Handle dialog event
			print( event.response )
		end
	end
end

-- Set the "fbinit" listener to be triggered when initialization is complete
facebook.init( facebookListener )
``````

##### Game Request

``````lua
local facebook = require( "plugin.facebook.v4a" )

local function facebookListener( event )

	if ( "fbinit" == event.name ) then

		print( "Facebook initialized" )
		facebook.login()

	elseif ( "fbconnect" == event.name ) then

		if ( "session" == event.type ) then
			-- Handle login event
			if ( "login" == event.phase ) then
				facebook.showDialog( "requests", 
				{ 
					message = "You should download this game!",
					filter = "APP_NON_USERS"
				})
			end

		elseif ( "dialog" == event.type ) then
			-- Handle dialog event
			print( event.response )
		end
	end
end

-- Set the "fbinit" listener to be triggered when initialization is complete
facebook.init( facebookListener )
``````
