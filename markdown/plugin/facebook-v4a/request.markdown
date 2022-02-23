# facebook.request()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, request
> __See also__			[facebook.*][plugin.facebook-v4a]
>						[fbconnect][plugin.facebook-v4a.event.fbconnect]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Get or post data to the logged-in Facebook account. Can be used to post messages and photos to the account and friends' accounts. Can also be used to get user data and recent posts.

The request comes back in the form of a [fbconnect][plugin.facebook-v4a.event.fbconnect] event that is sent to the listener specified within [facebook.init()][plugin.facebook-v4a.init] or [facebook.setFBConnectListener()][plugin.facebook-v4a.setFBConnectListener].


## Syntax

	facebook.request( path [, httpMethod] [, params] )

##### path ~^(required)^~
_[String][api.type.String]._ The [Facebook Graph API](http://developers.facebook.com/docs/api/) path, for example `"me"`, `"me/friends"`, or `"me/feed"`.

##### httpMethod ~^(optional)^~
_[String][api.type.String]._ `"GET"`, `"POST"`, or `"DELETE"`. If not specified, defaults to `"GET"`.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table of key/value pairs passed as arguments to the Facebook&nbsp;API call. For more information, see [this document](http://developers.facebook.com/docs/reference/api/post/).


## Examples

##### Post Message

``````lua
-- Post a message to the user's account
facebook.request( "me/feed", "POST", { message="Hello Facebook" } )
``````

##### Open Graph Object

``````lua
-- Create a user-owned Open Graph object for an episode of The Simpsons
local episodeObject = {
	object = "{\"fb:app_id\":\"[YOUR FACEBOOK APP ID HERE]\",\"og:type\":\"video.episode\",\"og:url\":\"https:\/\/www.simpsonsworld.com\",\"og:title\":\"Treehouse\ of\ Horror\ XXVI\",\"og:image\":\"https:\/\/upload.wikimedia.org\/wikipedia\/en\/e\/e6\/Treehouse_of_Horror_XXVI_poster.jpg\"}"
}
facebook.request( "/me/objects/video.episode", "POST", episodeObject )
``````
