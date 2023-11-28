# admob.updateConsentForm()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, hide
> __See also__          [admob.loadConsentForm()][plugin.admob.loadConsentForm]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function updates the Consent Manager with information that helps determine if a message needs to be displayed.

## Gotchas

* AdMob needs to initialize before you can run `admob.updateConsentForm()`.

* The Consent Form is a legal document and underage users cannot consent to its contents. This means `formStatus` will always be `"unavailable"` for underaged users and `consentStatus` will always be `"obtained"`. AdMob does not specify what the user has consented to.

## Syntax

	admob.updateConsentForm( [options] )

##### options ~^(optional)^~

_[Table][api.type.Table]._ Table containing additional parameters for the specified ad type — see the next section for details.

## Parameter Reference

The `options` table includes parameters

##### underage ~^(optional)^~
 [boolean][api.type.Boolean], set tag for under the age of consent. True means users are underage.

##### debug ~^(optional)^~

[Table][api.type.Table], accepts `geography` and `testDeviceIdentifiers` fields. The `geography` valid types are `"EEA"`, `"notEEA"`, `"disabled"`. The `testDeviceIdentifiers` takes an [Array][api.type.Array] of [Strings][api.type.String] of the Test Devices Hash Id.



## Example

``````lua
local admob = require( "plugin.admob" )

local function adListener( event )

	if ( event.phase == "init" ) then
		-- Wait until "init" phase to update the Consent Form.
		admob.updateConsentForm({ underage=true, debug={ geography = "EEA", testDeviceIdentifiers={"Your-Device-Hash"} } })
	end

end

-- Initialize the AdMob plugin
admob.init( adListener, { appId="YOUR_ADMOB_APP_ID", testMode=true } )
``````
