# startapp.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, StartApp, show
> __See also__          [startapp.load()][plugin.startapp.load]
>						[startapp.*][plugin.startapp]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a StartApp banner, interstitial, offer wall, video or rewarded video ad.


## Gotchas

Except for banner ad, you must first load an ad via `startapp.load()` and confirm it's ready to be shown.


## Syntax

	startapp.show( adType [, params] )

##### adType ~^(required)^~
_[String][api.type.String]._ The ad type to show. Valid values include `"video"`, `"offerwall"`, `"interstitial"`, `"rewardedVideo"`, and `"banner"`.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing additional parameters for the ad — see the next section for details.


## Parameter Reference

The `params` table includes parameters for the ad.

##### adTag ~^(optional)^~
_[String][api.type.String]._ A tag is simply a free style string identifier that can be attached to any ad. Ad Tags will help you optimize your monetization by finding the right balance between ads and the perfect ad-viewing experience for your users. For example, if you implement couple of interstitial ads in different places in your application, you can give each of them a different tag, one of them could be "Level1Complete", the other "AfterScoresBoard", then, you can monitor which placement convert better and get more engagement from your users. Default is nil.

##### yAlign ~^(optional)^~
_[String][api.type.String]._ Only applies to banner ads, specifying the banner's y position on the screen. Valid position values are "top" or “bottom". Default is "bottom".

##### bannerType ~^(optional)^~
_[String][api.type.String]._ Only applies to banner ads, specifying the banner’s type. Valid type values are:
`"automatic"` - Automatic selects the most suitable banner of the two listed below.
`"standard"` - A standard (two dimensional) banner.
`"threed"` - A three dimensional rotating banner.


## Example

``````lua
local startapp = require( "plugin.startapp" )

local function adListener( event )
    if ( event.phase == "init" ) then  -- Successful initialization
        print( event.provider )
        -- Load an StartApp ad
        startapp.load( "interstitial" )
    elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
        print( event.type )
    elseif ( event.phase == "failed" ) then  -- The ad failed to load
        print( event.type )
        print( event.isError )
        print( event.response )
    elseif ( event.phase == "displayed" ) then  -- The ad was displayed/played
        print( event.type )
    elseif ( event.phase == "hidden" ) then  -- The ad was closed/hidden
        print( event.type )
    elseif ( event.phase == "clicked" ) then  -- The ad was clicked/tapped
        print( event.type )
    elseif ( event.phase == "reward" ) then  -- Rewarded video ad playback completed
        print( event.type )
    end
end

-- Initialize the StartApp plugin
startapp.init( adListener, { appId="Your App ID" } )

-- Show banner ad. no need to pre-load banner
startapp.show( "banner" , {
adTag = "menu top banner",
yAlign = "top",
bannerType = "standard"
} )

-- Sometime later, show an interstitial ad
if ( startapp.isLoaded( "interstitial" ) ) then
    startapp.show( "interstitial" )
end
``````
