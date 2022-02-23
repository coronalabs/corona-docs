# adcolony.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdColony, init
> __See also__			[adcolony.load()][plugin.adcolony.load] 
>                       [adcolony.show()][plugin.adcolony.show]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`adcolony.init()` initializes the AdColony plugin. This call is required and must be executed before making other AdColony calls such as [adcolony.load()][plugin.adcolony.load] and [adcolony.show()][plugin.adcolony.show].


## Syntax

	adcolony.init( listener, params )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.adcolony.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing AdColony initialization values — see the next section for details.


## Parameter Reference

The `params` table includes parameters for the AdColony initialization.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For developers migrating from the Corona Ads incarnation of the AdColony plugin, the following parameters have been __removed__ from this new plugin:

* `apiKey` (replaced by `appId`)
* `testMode`; this is now set per-app in the AdColony dashboard

</div>

##### appId ~^(required)^~
_[String][api.type.String]._ The AdColony App&nbsp;ID for your app, gathered from the AdColony [dashboard](https://www.adcolony.com).

##### adZones ~^(required)^~
_[Table][api.type.Table]._ A table of key-value pairs containing your zones, as defined in the AdColony [dashboard](https://www.adcolony.com). Keys are <nobr>user-defined</nobr>, however it's recommended to use meaningful names like `interstitial` and `rewardedVideo` since these names are what you'll use in calls to other functions within this plugin. The value for each <nobr>key-value</nobr> pair is a string with the zone&nbsp;ID taken from the zones configured in the AdColony dashboard. You can configure as many zones as you want, but you must specify at least one.

##### adOrientation ~^(optional)^~
_[String][api.type.String]._ The preferred orientation in which you want the ads to be displayed. Valid values are `"portrait"` and `"landscape"`. Default is `"landscape"`.

##### userId ~^(optional)^~
_[String][api.type.String]._ A unique user ID to be given to the current user.

##### debugLogging ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, turns on debug logging which displays extra debugging information in the device log. Default is `false`.

##### privacyFrameworks ~^(required)^~
_[Table][api.type.Table]._ A table of key-value pairs containing used privacy regulations as keys and boolean values (`true` if used) as values. Set only those which are valid for current user. Choices are as follows:

``````lua
privacyFrameworks = { gdpr=true, coppa=true, ccpa=true },
``````

##### privacyConsents ~^(required)^~
_[Table][api.type.Table]._ A table of key-value pairs containing consent values for privacy frameworks. Set only those which are valid for current user.

``````lua
privacyConsents = { gdpr=true, coppa=true, ccpa=true },
``````


### Deprecated

<s>
##### hasUserConsent ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `false`, AdColony will enable GDPR data collection restrictions, set to `true` for opposite.
</s>

## Example

``````lua
local adcolony = require( "plugin.adcolony" )

-- AdColony listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the AdColony plugin
adcolony.init( adListener,
	{
		appId = "YOUR_ADCOLONY_APP_ID",
		adZones = {
			interstitial = "YOUR_ADCOLONY_ZONE_ID_1",
			rewardedVideo = "YOUR_ADCOLONY_ZONE_ID_2"
		}
	})
``````
