
# pollfish.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Pollfish, init
> __See also__          [pollfish.show()][plugin.pollfish.show]
>						[pollfish.*][plugin.pollfish]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`pollfish.init()` initializes the Pollfish plugin. Once called, you must wait for an [event.phase][plugin.pollfish.event.adsRequest.phase] of `"init"` before loading a survey with [pollfish.load()][plugin.pollfish.load].

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This call requires an API&nbsp;key which can be obtained from the [Pollfish portal](https://www.pollfish.com/publisher).

</div>


## Syntax

	pollfish.init( adListener, params )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.pollfish.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing Pollfish initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes the following parameters for the Pollfish initialization.

##### apiKey ~^(required)^~
_[String][api.type.String]._ Your API&nbsp;key from the [Pollfish portal](https://www.pollfish.com/publisher).

##### developerMode ~^(optional)^~
_[Boolean][api.type.Boolean]._ Setting this to `true` activates developer mode. Default is `false`.

* `true` is used to help the developer test how Pollfish surveys will behave in the app (no&nbsp;paid surveys are presented).

* `false` activates release mode. Use this mode for apps released to the app store (start receiving paid surveys).

##### requestUUID ~^(optional)^~
_[String][api.type.String]._ A unique ID to identify a user. This ID is also passed through <nobr>server-to-server</nobr> callbacks.


## Example

``````lua
local pollfish = require( "plugin.pollfish" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		pollfish.load()
    end
    
end

-- Initialize the Pollfish plugin
pollfish.init( adListener, { apiKey="YOUR_API_KEY" } )
``````
