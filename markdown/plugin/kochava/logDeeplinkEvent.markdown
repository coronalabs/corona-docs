# kochava.logDeeplinkEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava, logDeeplinkEvent
> __See also__			[kochava.logEvent()][plugin.kochava.logEvent]
>						[kochava.*][plugin.kochava]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sends a deep-link event to Kochava.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

URL schemes should be configured for your app to use this function.

</div>


## Syntax

	kochava.logDeeplinkEvent( URL [, sourceApplication] )

##### URL ~^(required)^~
_[String][api.type.String]._ The deep-link URL passed to your application.

##### sourceApplication ~^(optional)^~
_[String][api.type.String]._ The application that sent the <nobr>deep-link</nobr> to your app.


## Example

``````lua
local kochava = require( "plugin.kochava" )

local function kochavaListener( event )
	-- Handle events here
end

-- Initialize plugin
kochava.init( kochavaListener,
	{
		appGUID = "YOUR_APP_GUID"
	}
)

-- Get URL and "sourceApplication" data
kochava.logDeeplinkEvent( "myawesomeapp://feed/highscores", "com.company.otherapp" )
``````
