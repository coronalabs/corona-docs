# startapp.setUserConsent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, StartApp, setUserConsent
> __See also__          [startapp.*][plugin.startapp]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`startapp.setUserConsent()` indicates specific type of consent from a given user.

Data protection and privacy regulations may require you and your company to obtain consent from users before processing personal data and to honor users' requests for how you use their personal data. StartApp is required to record these consent logs and thus we have provided you with an API which enables you to send this consent from your user to StartApp. Based on consent signals that you send, StartApp uses the data to target the most relevant campaigns to your users. Without receiving this consent we will not be able to send targeted ads (but rather non-targeted ads)


## Syntax

	startapp.setUserConsent( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing user-consent values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for sending user consent.

##### consentType ~^(required)^~
_[String][api.type.String]._ type of consent. For example `"ACCESS_FINE_LOCATION"` for ACCESS_FINE_LOCATION permission.

##### timestamp ~^(required)^~
_[Number][api.type.Number]._ the specific time a consent / dissent was given by the user. Use `os.time()`.

##### enabled ~^(required)^~
_[Boolean][api.type.Boolean]._ `true` indicates consumer consent, `false` indicates consumer dissent.


## Example

``````lua
local startapp = require( "plugin.startapp" )

-- StartApp listener function
local function adListener( event )
    if ( event.phase == "init" ) then  -- Successful initialization
        print( event.provider )
    end
end

-- Initialize the StartApp plugin
startapp.init( adListener, { appId="Your App ID", enableReturnAds = true } )

-- Sometime later
startapp.setUserConsent({
    consentType = "ACCESS_FINE_LOCATION",
    timestamp = os.time(),
    enabled = true
})
``````
