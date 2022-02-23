# facebook.accessDenied

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Library__           [facebook.*][api.library.facebook]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          facebook
> __See also__          [Implementing Facebook][guide.social.usingFacebook]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Queries iOS to see if access to the Facebook integrated account has been denied.


## Syntax

	facebook.accessDenied


## Examples

``````lua
local facebook = require( "facebook" )

if ( facebook.accessDenied ) then
	native.showAlert( "Facebook access denied", "Please go to Settings > Facebook and enable access for this application." )
else
	facebook.login( appId, facebookListener )
end

facebook.publishInstall( "XXXXXXXXXX" )  --replace XXXXXXXXXX with your Facebook App ID
``````