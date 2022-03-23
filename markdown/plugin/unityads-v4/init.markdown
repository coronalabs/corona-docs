# unityads.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads, init
> __See also__          [unityads.show()][plugin.unityads-v4.show]
>						[unityads.*][plugin.unityads-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`unityads.init()` initializes the Unity&nbsp;Ads plugin. This call is required and must be executed before making other Unity&nbsp;Ads calls such as [unityads.show()][plugin.unityads-v4.show] or [unityads.load()][plugin.unityads-v4.load].



## Syntax

    unityads.init( listener, params )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.unityads.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing Unity&nbsp;Ads initialization values — see the next section for details.


## Parameter Reference

The `params` table includes parameters for Unity&nbsp;Ads initialization.

##### gameId ~^(required)^~
_[String][api.type.String]._ The game ID for your app, gathered from the Unity&nbsp;Ads [dashboard](https://unity3d.com/services/ads).

##### testMode ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set this value to `true` to enable test ads. Default is `false`.


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

-- Unity Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Unity Ads plugin
unityads.init( adListener, { gameId="YOUR_UNITYADS_GAME_ID" } )
``````
