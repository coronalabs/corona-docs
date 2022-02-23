# facebook.isActive

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, isActive
> __See also__          [facebook.init()][plugin.facebook-v4a.init]
>						[facebook.*][plugin.facebook-v4a]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Used to confirm that the Facebook plugin is properly initialized after calling [facebook.init()][plugin.facebook-v4a.init] and waiting for a [fbinit][plugin.facebook-v4a.event.fbinit] event, upon which this property will be `true` <nobr>(`false` otherwise)</nobr>.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Some functions/properties require `facebook.isActive` to be `true` before giving reliable results. This is noted in their respective documentation.

</div>


## Syntax

	facebook.isActive


## Example

``````lua
local facebook = require( "plugin.facebook.v4a" )

local function facebookInitListener( event )

	print( "Facebook initialized" )

	if ( facebook.getCurrentAccessToken() == nil ) then
		print( "Login required!" )
		facebook.login()
	else
		print( "Already logged in!" )
	end
end

-- Set the "fbinit" listener to be triggered when initialization is complete
facebook.init( facebookInitListener )
``````
