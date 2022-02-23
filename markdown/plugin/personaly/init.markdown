# personaly.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Persona.ly, init
> __See also__          [personaly.show()][plugin.personaly.show]
>						[personaly.*][plugin.personaly]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`personaly.init()` initializes the Persona.ly plugin.

Once initialized, you can show an ad using [personaly.show()][plugin.personaly.show].

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This call requires an app&nbsp;hash and a unique user&nbsp;ID for each player. Your app&nbsp;hash can be obtained from the [Persona.ly portal](http://persona.ly).

</div>


## Syntax

	personaly.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.personaly.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing Persona.ly initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the Persona.ly initialization.

##### appHash ~^(required)^~
_[String][api.type.String]._ Your app&nbsp;hash from the [Persona.ly portal](http://persona.ly).

##### userId ~^(required)^~
_[String][api.type.String]._ A unique user&nbsp;ID for your player.


## Example

``````lua
local personaly = require( "plugin.personaly" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Persona.ly plugin
personaly.init( adListener, { appHash="YOUR_APP_HASH", userId="UNIQUE_USER_ID" } )
``````
