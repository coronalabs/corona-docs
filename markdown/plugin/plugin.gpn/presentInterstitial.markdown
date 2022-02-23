# gpn.presentInterstitial()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Library__           [gpn.*][plugin.gpn]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          
> __Sample code__       
> __See also__          
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Call the "present" method whenever it's appropriate to present an interstitial ad (e.g. during a level break). The ad will display only if it is fully preloaded. It’s safe to present an interstitial after the "received" event is dispatched.

Possible return values:  
• "presented"        - “present” call succeed: an interstitial ad will be presented fullscreen  
• "not_presented"    - “present” call did not result in showing an ad  
• "forbids_position" - interstitial "position" is disabled

## Syntax

	gpn.presentInterstitial( )
	gpn.presentInterstitial( options )

##### options ~^(optional)^~
_[Table][api.type.Table]._ Presenting options. See **Format for options** below.


### Format for `options`

The `options` table contains the following properties:

##### position ~^(optional)^~
_[String][api.type.String]._ An ad position to define different behavior for different points in your game.


## Examples

``````lua

    --  local presenting_params = {	
    --     position = "level_end" -- or your custom position here
    -- }
    -- local result = gpn.presentInterstitial( presenting_params )
    
    local result = gpn.presentInterstitial()
    if "presented" ~= result then
        -- The ad is not ready yet or something went wrong
    end

``````
