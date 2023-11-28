# admob.getConsentFormStatus()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, hide
> __See also__          [admob.loadConsentForm()][plugin.admob.loadConsentForm]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns two [Strings][api.type.String] `formStatus` and `consentStatus`:

`formStatus` can be `"available"`, `"unavailable"`, or `"unknown"`.

`consentStatus` can be `"obtained"`, `"required"`, `"notRequired"`, or `"unknown"`.

## Gotchas

* AdMob needs to initialize before you can run `admob.updateConsentForm()`.

* You must wait after running `admob.updateConsentForm()` before `admob.getConsentFormStatus()` returns non-nil values.

* The consent form is a legal document and underage users cannot consent to its contents. This means `formStatus` will always be `"unavailable"` for underaged users and `consentStatus` will always be `"obtained"`. AdMob does not specify what the user has consented to.


## Syntax

	admob.getConsentFormStatus()



## Example

``````lua
local admob = require( "plugin.admob" )


local function adListener( event )

	if ( event.phase == "init" ) then
		-- Wait until "init" phase to update the Consent Form.
		admob.updateConsentForm({ underage=false })
	end

end

-- Initialize the AdMob plugin.
admob.init( adListener, { appId="YOUR_ADMOB_APP_ID", testMode=true } )

-- Sometime later, get the form and consent status:
-- (If you don't wait for the consent form to update, then both of these values will be nil.)
local formStatus, consentStatus = admob.getConsentFormStatus()
print( "Form Status:" .. tostring( formStatus ) .. ", Consent Status: " .. tostring( consentStatus ) )
``````
