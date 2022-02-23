# gpn.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Library__           [gpn.*][plugin.gpn]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          
> __Sample code__       
> __See also__          
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function initializes CrossPromotion instance.

## Syntax
	
	gpn.init( listener, options )

##### listener ~^(required)^~
_[Function][api.type.Function]._ A listener function for gpn events.

##### options ~^(required)^~
_[Table][api.type.Table]._ Required options for gpn initialization. See **Format for options** below.


### Format for `options`

The `options` table contains the following properties:

##### iosAppId ~^(required)^~
_[String][api.type.String]._ iOS app id. Only required for iOS platform.

##### androidAppId ~^(required)^~
_[String][api.type.String]._ Android app id. Only required for Android platform.

##### debugMode ~^(optional)^~
_[Boolean][api.type.Boolean]._ Boolean flag for debug mode (false by default).

##### iosKillsOnLowMemory ~^(optional,&#32;iOS&#32;only)^~
_[Boolean][api.type.Boolean]._ Boolean flag to enable/disable killing the ad on a low memory warning (true by default).

## Examples

``````lua

    -- gpn listener function
    local function listener( event )
    
        if event.type == "received" then
            -- Interstitial ad is received: it’s safe to present it now.
            
        elseif event.type == "failed" then
            -- Interstitial ad is failed to receive.
            local code = event.error_code
            local message = event.error_message
            -- You should restart your interstitial request
            
        elseif event.type == "opened" then
            -- Interstitial ad presented full screen modal view. You can pause your game here.
            
        elseif event.type == "closed" then
            -- Interstitial ad hided full screen modal view. You can resume your game here.
        
        elseif event.type == "killedLowMem" then
            -- iOS only: Interstitial ad was destroyed after receiving low memory warning.
            -- You should restart your interstitial request
        end
    end
    
    local init_properties = {
        iosAppId = "your_ios_app_id_here",
        androidAppId = "your_android_app_id_here",
        -- debugMode = true,
        -- iosKillsOnLowMemory = false
    }
    
    gpn.init( listener, init_properties )
    
``````
