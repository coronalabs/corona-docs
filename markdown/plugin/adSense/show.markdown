# adSense.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          AdSense, Google Ads, Google AdSense, show
> __See also__          [adSense.init()][plugin.adSense.init]
>						[adSense.*][plugin.adSense]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows AdSense Ad, you must call [adSense.init()][plugin.adSense.init] before calling. Only banners are supported at the moment.


## Syntax

	adSense.show( adType, parameters )

##### adType ~^(required)^~
_[String][api.type.String]._ Currently `"banner"` is supported.

##### parameters ~^(required)^~
_[Table][api.type.Table]._ Table containing additional parameters for the specified ad type — see the next section for details.


## Parameter Reference

##### adSlot ~^(required)^~
_[String][api.type.String]._ Ad Slots is created under Console>Ads Overview>By Ad Unit>"Display ads" for banners. In the html code this called under the key `data-ad-slot`.

##### position ~^(optional)^~
_[String][api.type.String]._ supported values are `"top"`(default) or `"bottom"`.

##### height ~^(optional)^~
_[Number][api.type. Number]._ default value is `100`, this value is for Pixel Units(`px`).

##### width ~^(optional)^~
_[Number][api.type. Number]._ default value full device width(`100%`), but setting a value is in Pixel Units(`px`).


## Example

``````lua
local adSense = require( "plugin.adSense" )

-- AdSense Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		adSense.show("banner",{adSlot="xxxxxxxxx", height=150, position="bottom"})

	end
end

-- Initialize Ad Sense
adSense.init(adListener, {clientId="ca-pub-xxxxxxxxxxxxxxxx"} )

``````
