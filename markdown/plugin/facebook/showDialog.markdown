# facebook.showDialog()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [facebook.*][api.library.facebook]
> __Return value__      [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          facebook
> __See also__          [facebook.login()][plugin.facebook.login]
>						[Implementing Facebook][guide.social.usingFacebook]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays a Facebook UI dialog for publishing posts to a user's stream. This API pops up a Facebook UI that the user interacts with. Use [facebook.request()][plugin.facebook.request] if you need the application to do the posting.


## Gotchas

Please see the [Implementing Facebook][guide.social.usingFacebook] guide for important iOS and <nobr>Android-specific</nobr> notes.


## Syntax

	facebook.showDialog( action [, params ] )

##### action ~^(required)^~
_[String][api.type.String]._ The dialog you want to show, for example `"feed"` or `"apprequests"`. See [here](http://developers.facebook.com/docs/reference/dialogs/) for more information.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Lua table of key-value pairs that is passed as arguments to the Facebook API call. The keys you pass here correspond to specific options which are available for the dialog that you want to show. See [here](http://developers.facebook.com/docs/reference/dialogs/) for more information.


## Facebook Places

Displays a native view controller, allowing the user to choose a place where they are.

	facebook.showDialog( action, options, onComplete )

##### action ~^(required)^~
_[String][api.type.String]._ The dialog you want to show. For the place picker, you should pass `"place"`.

##### options ~^(required)^~
_[Table][api.type.Table]._ This is a Lua table of key/value pairs that are passed as arguments to the Facebook API call. Supported keys are:

* `title` — string value for the title that will appear in the view controller's navigation bar (top of the screen).
* `searchText` — string value for the type of place you wish to search for. i.e. `"restaurant"`, `"hospital"`, `"supermarket"`, etc.
* `longitude` — numerical value for the longitude value of the place.
* `latitude` — numerical value for the latitude value of the place.
* `resultsLimit` — number representing the maximum number of results shown in the view controller.
* `radiusInMeters` — numerical value for the radius in meters that the search should span.

##### onComplete ~^(required)^~

_[Listener][api.type.Listener]._ This listener is executed upon selecting a place.


## Facebook Friends

Displays a native view controller, allowing the user to choose who they are with.

	facebook.showDialog( action, onComplete )

##### action ~^(required)^~
_[String][api.type.String]._ The dialog you want to show. For the friend picker, you should pass `"friends"`.

##### onComplete ~^(required)^~

_[Listener][api.type.Listener]._ This listener is executed upon selecting a friend.


## Examples

``````lua
local facebook = require( "facebook" )

local function facebookListener( event )
	if ( "session" == event.type ) then
		--upon successful login, request list of friends
		if ( "login" == event.phase ) then
			facebook.showDialog( "apprequests", { message="You should download this game!" } )
		end
	elseif ( "dialog" == event.type ) then
		print( event.response )
    end
end

facebook.login( "XXXXXXXXXX", facebookListener )  --replace XXXXXXXXXX with your Facebook App ID
``````

##### Places/Friends

``````lua
local facebook = require( "facebook" )

local function facebookListener( event )
	print( "event.name:", event.name )
	print( "event.type:", event.type )

	if ( event.data ) then
		print( "{" )

		for k, v in pairs( event.data ) do
			print( k, ":", v )
		end

		print( "}" )
	end
end

-- Show the place picker
facebook.showDialog( "place", { title="Select A Restaurant", longitude=48.857875, latitude=2.294635, searchText="restaurant", resultsLimit=20, radiusInMeters=2000 }, facebookListener )

-- Show the friends picker
facebook.showDialog( "friends", facebookListener )
``````