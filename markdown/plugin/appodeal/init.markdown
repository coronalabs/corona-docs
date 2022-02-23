# appodeal.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, init
> __See also__          [appodeal.show()][plugin.appodeal.show]
>						[appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`appodeal.init()` initializes the Appodeal plugin.

Once initialized, you can show an ad using [appodeal.show()][plugin.appodeal.show].

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

For Android users, some adapters may work more effectively with `android.permission.WRITE_EXTERNAL_STORAGE` permission, make sure to include it in your project manually.

Use `disableWriteExternalPermissionCheck` init parameter with `false` value if you want to use that ability for your project.

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Now you can disable autocache for specific ad type! Check out new `disableAutoCacheForAdTypes` init parameter below to know more.

`autoCacheAds` parameter is deprecated from now on, so make sure that everything is configured correctly.

</div>

## Syntax

	appodeal.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.appodeal.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing Appodeal initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes initialization properties for the Appodeal plugin.

##### appKey ~^(required)^~
_[String][api.type.String]._ Your Appodeal app key. You can find this ID in the [Appodeal developer portal](https://www.appodeal.com/apps), located under your app's name as "Application&nbsp;Key."

##### testMode ~^(optional)^~
_[Boolean][api.type.Boolean]._ Test mode enables verbose logging to help with debugging and it also serves test ads from networks that support them. To enable test mode, set this value to `true`. Default is `false`.

##### smartBanners ~^(optional)^~
_[Boolean][api.type.Boolean]._ Smart banners will use all screen width to adjust banner width. By default, smart banners are enabled. Set this value to false to disable them.

##### bannerAnimation ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set to `true` to animate banner transitions <nobr>(cross-fade when</nobr> switching&nbsp;banners). Default is `false`.

##### childDirectedTreatment ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set to `true` to flag your app as COPPA compliant. Default is `false`.

##### customRules ~^(optional)^~
_[Table][api.type.Table]._ Manual Filters allows to groups users by any available characteristics. E.g. you know the sources that directed users to you and you want to track the statistics for such users — group them into a segment . You can read more in [Appodeal Knowledge Base](http://faq.appodeal.com/segments). This is a table with <nobr>key-value</nobr> pairs of data. You can choose key names freely as there are no <nobr>pre-defined</nobr> key names. Valid value types are strings, booleans, or numbers.

##### supportedAdTypes ~^(optional)^~
_[Array][api.type.Array]._ Limits the type of ads you want Appodeal to serve. By default, banner, static interstitial, and rewarded video ads will be served. You can limit the type of ads to load by specifying which types to support inside this table array. Valid values include `"banner"`, `"interstitial"`, and `"rewardedVideo"`.

##### disableWriteExternalPermissionCheck ~^(optional)^~
_[Boolean][api.type.Boolean]._ You must set this value to `true` if you don't want to use optional `android.permission.WRITE_EXTERNAL_STORAGE` permission (for reasons stated above in the description). Default is `false`.

##### disableNetworks ~^(optional)^~
_[Array][api.type.Array]._ For advanced use only. Prevent the Appodeal SDK from looking for specified ad network SDKs during initialization. Valid values include `"adcolony"`, `"admob"`, `"amazon_ads"`, `"applovin"`, `"appnext"`, `"avocarrot"`, `"chartboost"`, `"facebook"`, `"flurry"`, `"inmobi"`, `"inner-active"`, `"ironsource"`, `"mailru"`, `"mmedia"`, `"mopub"`, `"ogury"`, `"openx"`, `"pubnative"`, `"smaato"`, `"startapp"`, `"tapjoy"`, `"unity_ads"`, `"vungle"`, and `"yandex"`. If you simply wish to prevent advertising from certain ad networks, you should __not__ use this option&nbsp;&mdash; instead, you can select preferred ad networks for your app in the Appodeal dashboard.

##### disableAutoCacheForAdTypes ~^(optional)^~
_[Array][api.type.Array]._ For advanced use only. Disable autocache for specified ad types during Appodeal SDK initialization. Valid values include `"banner"`, `"interstitial"`, `"rewardedVideo"`.

##### hasUserConsent ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `false`, Appodeal will enable GDPR data collection restrictions, set to `true` for opposite. Default is `false`.


## Example

``````lua
local appodeal = require( "plugin.appodeal" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey="YOUR_APP_KEY" } )
``````
