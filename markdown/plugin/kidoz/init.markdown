# kidoz.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, KIDOZ, init
> __See also__          [kidoz.load()][plugin.kidoz.load]
>						[kidoz.show()][plugin.kidoz.show]
>						[kidoz.*][plugin.kidoz]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`kidoz.init()` initializes the KIDOZ plugin.

Once initialized, you can load an ad using [kidoz.load()][plugin.kidoz.load] and subsequently show it via [kidoz.show()][plugin.kidoz.show].

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This call requires your KIDOZ publisher&nbsp;ID and security token, obtained from the [KIDOZ developer portal](http://accounts.kidoz.net/publishers/login).

</div>


## Syntax

	kidoz.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.kidoz.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing KIDOZ initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the KIDOZ initialization.

##### publisherID ~^(required)^~
_[String][api.type.String]._ Your publisher&nbsp;ID from KIDOZ.

##### securityToken ~^(required)^~
_[String][api.type.String]._ Your security token from KIDOZ.


## Example

``````lua
local kidoz = require( "plugin.kidoz" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
    end
end

-- Initialize the KIDOZ plugin
kidoz.init( adListener, { publisherID="YOUR_PUBLISHER_ID", securityToken="YOUR_SECURITY_TOKEN" } )
``````
