# appodeal.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, show
> __See also__          [appodeal.hide()][plugin.appodeal.hide]
>						[appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows an Appodeal ad. By default, Appodeal automatically caches ads in the background, so there is normally no need to [load][plugin.appodeal.load] ads in advance of calling this method. However, automatic caching may be disabled when calling [appodeal.init()][plugin.appodeal.init].

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Appodeal SDK can’t show ads in offline mode! You will get `"adsRequest"` [Event][api.type.Event] with phase `"failed"` If you call this method without internet connection.

</div>

## Syntax

	appodeal.show( adUnitType [, params] )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad you wish to display. Valid values include `"banner"`, `"interstitial"`, and `"rewardedVideo"`.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing positioning parameters for banner ads &mdash; see the next section for details.


## Parameter Reference

The `params` table can include properties for positioning a banner ad. This does not apply to interstitial or video ads.

##### yAlign ~^(optional)^~
_[String][api.type.String]._ Vertical alignment of the banner. Valid options are `"top"` and `"bottom"`. Default is `"bottom`.

##### placement ~^(optional)^~
_[String][api.type.String]._ The placement you want the ad to be associated with. Placements allow you to separate ads impressions by places where it was shown. You can read more in [Appodeal Knowledge base](http://faq.appodeal.com/placements).


## Example

``````lua
local appodeal = require( "plugin.appodeal" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Show a banner ad
		appodeal.show( "banner", { yAlign="top" } )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey="YOUR_APP_KEY" } )
``````
