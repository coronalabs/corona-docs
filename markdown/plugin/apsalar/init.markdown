# apsalar.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Apsalar, init
> __See also__			[apsalar.logEvent()][plugin.apsalar.logEvent]
>						[apsalar.endSession()][plugin.apsalar.endSession]
>						[apsalar.*][plugin.apsalar]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function initializes the Apsalar plugin and it must be executed before making other calls such as [apsalar.logEvent()][plugin.apsalar.logEvent].

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

To ensure proper reporting, you must end the Apsalar session when the app exits. See [apsalar.endSession()][plugin.apsalar.endSession] for details.

</div>


## Syntax

	apsalar.init( apiKey, secret )

##### apiKey ~^(required)^~
_[String][api.type.String]._ Your unique API key, gathered from the [Apsalar portal](https://apsalar.com/app/sdk).

##### secret ~^(required)^~
_[String][api.type.String]._ Your unique secret key, gathered from the [Apsalar portal](https://apsalar.com/app/sdk).


## Example

``````lua
local apsalar = require( "plugin.apsalar" )

-- Initialize the Apsalar plugin
apsalar.init( "YOUR_API_KEY", "YOUR_SECRET_KEY" )
``````
