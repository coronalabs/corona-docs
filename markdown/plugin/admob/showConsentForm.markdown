# admob.showConsentForm()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, hide
> __See also__          [admob.getConsentFormStatus()][plugin.admob.getConsentFormStatus]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function shows Consent Form to be displayed (if loaded)


## Syntax

	admob.showConsentForm()



## Example

``````lua
local admob = require( "plugin.admob" )


-- Initialize the AdMob plugin

local function adListener( event )
		if ( event.phase == "init" ) then  -- Successful initialization
			local formStatus, consentStatus = admob.getConsentFormStatus()

			if(formStatus == "available")then -- recommend (not required)
				admob.loadConsentForm()
			end
		end
		if(event.phase == "loaded" and event.type == "ump")then
			admob.showConsentForm()
		end
end

admob.init( adListener, { appId="YOUR_ADMOB_APP_ID" } )
``````
