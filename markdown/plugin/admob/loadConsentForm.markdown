# admob.loadConsentForm()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, hide
> __See also__          [admob.showConsentForm()][plugin.admob.showConsentForm]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function loads the Consent Form to be displayed (if needed).

## Gotchas

* `admob.updateConsentForm()` must be run before attempting to run `admob.getConsentFormStatus()`.

* You must wait after running `admob.updateConsentForm()` before `admob.getConsentFormStatus()` returns non-nil values.

* The Consent Form is a legal document and underage users cannot consent to its contents. This means `formStatus` will always be `"unavailable"` for underaged users and `consentStatus` will always be `"obtained"`. AdMob does not specify what the user has consented to.

## Syntax

	admob.loadConsentForm()



## Example

``````lua
local admob = require( "plugin.admob" )

local function adListener( event )

	if ( event.phase == "init" ) then
		-- Wait until "init" phase to update the Consent Form.
		admob.updateConsentForm({ underage=false })

		-- Add a slight delay to allow the plugin to finish initializing and updating the Consent Form before trying to get the form.
		timer.performWithDelay( 1000, function()
			local formStatus, consentStatus = admob.getConsentFormStatus()
			print( "formStatus: " .. tostring( formStatus ) .. ", consentStatus: " .. tostring( consentStatus ) )

			if (formStatus == "available") then
				admob.loadConsentForm()
			end
		end )
	end

end

-- Initialize the AdMob plugin.
admob.init( adListener, { testMode=true } )
``````
