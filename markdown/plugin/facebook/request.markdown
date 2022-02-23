# facebook.request()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [facebook.*][api.library.facebook]
> __Return value__      [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          facebook
> __See also__			[Implementing Facebook][guide.social.usingFacebook]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Get or post data to the logged-in Facebook account. Can be used to post messages and photos to the account and friends' accounts. Can also be used to get user data and recent posts.


## Gotchas

Please see the [Implementing Facebook][guide.social.implementFacebook] guide for important iOS and <nobr>Android-specific</nobr> notes.


## Syntax

	facebook.request( path [, httpMethod, params] )

##### path ~^(required)^~
_[String][api.type.String]._ The [Facebook Graph API](http://developers.facebook.com/docs/api/) path, for example `"me"`, `"me/friends"`, or `"me/feed"`.

##### httpMethod ~^(optional)^~
_[String][api.type.String]._ `"GET"` or `"POST"`. If not specified, defaults to `"GET"`.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table of key/value pairs passed as arguments to the Facebook API call. For more information, see [this&nbsp;document](http://developers.facebook.com/docs/reference/api/post/).

The following could be used to post a message to the user's account:

``````lua
facebook.request( "me/feed", "POST", { message="Hello Facebook" } )
``````


## Example

Please see the [Implementing Facebook][guide.social.usingFacebook] guide for code examples and usage details.