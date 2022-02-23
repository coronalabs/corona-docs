# kochavaFAA.logDeeplinkEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava Free App Analytics, logDeeplinkEvent
> __See also__			[kochavaFAA.logEvent()][plugin.kochava-app-analytics.logEvent]
>						[kochavaFAA.*][plugin.kochava-app-analytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sends a deep-link event to Kochava.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

URL schemes should be configured for your app to use this function.

</div>


## Syntax

	kochavaFAA.logDeeplinkEvent( URL [, sourceApplication] )

##### URL ~^(required)^~
_[String][api.type.String]._ The deep-link URL passed to your application.

##### sourceApplication ~^(optional)^~
_[String][api.type.String]._ The application that sent the <nobr>deep-link</nobr> to your app.


## Example

``````lua
local kochavaFAA = require( "plugin.kochava.faa" )

local function kochavaListener( event )
	-- Handle events here
end

-- Initialize plugin
kochavaFAA.init( kochavaListener,
	{
		appGUID = "YOUR_APP_GUID"
	}
)

-- Get URL and "sourceApplication" data
kochavaFAA.logDeeplinkEvent( "myawesomeapp://feed/highscores", "com.company.otherapp" )
``````
