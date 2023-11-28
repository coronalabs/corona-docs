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

This function shows the Consent Form to be displayed (if loaded).

## Gotchas

* For optimal user experience, you may wish to delay when you show the Consent Form to the user instead of showing it to them right after your app has launched and the Consent Form is available, loaded and ready to be displayed. In the example code, `timer.performWithDelay()` is used apply the delay, but you can use any other means of delaying the function calls, such as moving between scenes, showing the Consent Form before showing the first ad, etc.

## Syntax

	admob.showConsentForm()



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

		-- Successfully loading the Consent Form will trigger a "ump" type event.
		if (event.phase == "loaded" and event.type == "ump") then
			-- The Consent Form is available, loaded and ready to be shown.
			admob.showConsentForm()
		end
	end

end

-- Initialize the AdMob plugin.
admob.init( adListener, { testMode=true } )
``````
