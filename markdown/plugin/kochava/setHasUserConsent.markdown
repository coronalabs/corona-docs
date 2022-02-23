# kochava.setHasUserConsent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava, setHasUserConsent
> __See also__			[kochava.*][plugin.kochava]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

If you've enabled `intelligentConsentManagement` init parameter, you'll be getting a notification from Kochava when you should promt your user to set a consent status to be GDPR compliant. Consent status changes occur when an actionable change occurs with consent. This includes but is not limited to required changing, consent being revoked from a new partner or prompt ID, and the consent retry timer expiring.


## Syntax

	kochava.setHasUserConsent( Boolean )


## Example

``````lua
local kochava = require( "plugin.kochava" )

local function kochavaListener( event )
	if event.phase == "recieved" then
        if event.type == "consent" then
            kochava.setHasUserConsent( true )
        end
    end
end

-- Initialize plugin
kochava.init( kochavaListener,
	{
		appGUID = "YOUR_APP_GUID",
       intelligentConsentManagement = true
	}
)
``````
