# superawesome.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, SuperAwesome, init
> __See also__          [superawesome.load()][plugin.superawesome.load]
>						[superawesome.show()][plugin.superawesome.show]
>						[superawesome.*][plugin.superawesome]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`superawesome.init()` initializes the SuperAwesome plugin.

Once initialized, you can load an ad using [superawesome.load()][plugin.superawesome.load] and subsequently show it via [superawesome.show()][plugin.superawesome.show].


## Syntax

	superawesome.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.superawesome.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing SuperAwesome initialization values — see the next section for details.


## Parameter Reference

The `params` table includes initialization properties for the SuperAwesome plugin.

##### testMode ~^(optional)^~
_[Boolean][api.type.Boolean]._ Sets if test mode will be used for ads. Default is `false`.


## Example

``````lua
local superawesome = require( "plugin.superawesome" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize the SuperAwesome plugin
superawesome.init( adListener, { testMode=true } )
``````
