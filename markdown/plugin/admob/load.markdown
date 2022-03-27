# admob.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, load
> __See also__          [admob.show()][plugin.admob.show]
>						[admob.isLoaded()][plugin.admob.isLoaded]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pre-loads an AdMob interstitial, banner, rewarded interstitial, or rewarded video ad for instant display upon a future call to [admob.show()][plugin.admob.show].


<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Before calling this function, you must call [admob.init()][plugin.admob.init] and wait for the `"init"` event [phase][plugin.admob.event.adsRequest.phase].

</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Rewarded video ads will __not__ load when test mode is enabled. In this case, you will get a `"failed"` [phase][plugin.admob.event.adsRequest.phase] when trying to load a rewarded video. Please see [admob.init()][plugin.admob.init] for instructions on how to enable/disable test mode.

</div>
</div>


## Syntax

    admob.load( adType, params )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following ad type values:

* `"interstitial"` &nbsp;(includes both static interstitials and video interstitials)
* `"banner"`
* `"rewardedVideo"`
* `"rewardedInterstitial"`

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing additional parameters for the specified ad type — see the next section for details.


## Parameter Reference

The `params` table includes parameters for the specified ad type.

##### adUnitId ~^(required)^~
_[String][api.type.String]._ The ad unit ID for the specified ad type, gathered from the AdMob [dashboard](https://www.google.com/admob/).

##### childSafe ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set this to `true` to ensure that only <nobr>[COPPA](https://www.ftc.gov/enforcement/rules/rulemaking-regulatory-reform-proceedings/childrens-online-privacy-protection-rule)-compliant</nobr> ads will be loaded. Default is `false`.

##### designedForFamilies ~^(optional)^~
_[Boolean][api.type.Boolean]._ Only available on Android (ignored on iOS). When used together with the `childSafe` option, you can request ads that comply with Google's [Designed for Families](https://developer.android.com/distribute/googleplay/families/about.html) program. Essentially, upon seeing both `designedForFamilies` and `childSafe` set to `true`, AdMob will return <nobr>program-compliant</nobr> ads for the ad request. Note, however, that using these options together may restrict the fill rate of ads being served, especially in <nobr>non-U.S.</nobr> territories.

##### keywords ~^(optional)^~
_[Array][api.type.Array]._ An array of strings to be given to the AdMob request to use as keywords. Specifying keywords may increase your CTR.

##### hasUserConsent ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `false`, Admob will enable GDPR data collection restrictions, set to `true` for opposite.

##### maxAdContentRating ~^(optional)^~
_[Boolean][api.type.String]._ maximum raiting for Ad contents. Should be one of `"G"`, `"PG"`, `"T"` or `"MA"`. For details see official [documentation](https://developers.google.com/admob/android/targeting#ad_content_filtering).


## Example

``````lua
local admob = require( "plugin.admob" )

-- AdMob listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load an AdMob interstitial ad
		admob.load( "interstitial", { adUnitId="YOUR_ADMOB_AD_UNIT_ID" } )
	end
end

-- Initialize the AdMob plugin
admob.init( adListener, { appId="YOUR_ADMOB_APP_ID" } )
``````
