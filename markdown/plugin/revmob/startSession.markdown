# revmob.startSession()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, RevMob, startSession
> __See also__          [revmob.init()][plugin.revmob.init]
>						[revmob.*][plugin.revmob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Starts a RevMob session. It's recommended that you call this on an `"applicationResume"` [system][api.event.system] event (see&nbsp;the example&nbsp;below).

<div class="guide-notebox">
<div class="notebox-title">Note</div>

A RevMob session is started automatically when you successfully call [revmob.init()][plugin.revmob.init].

</div>


## Syntax

	revmob.startSession()


## Example

``````lua
local revmob = require( "plugin.revmob" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
	end
end

-- Initialize RevMob
revmob.init( adListener, { appId="YOUR_APP_ID" } )

-- System event listener function
local function onSystemEvent( event )

	if ( event.type == "applicationResume" ) then
		-- Start a new RevMob session
		revmob.startSession()
	end
end

-- Add the system event listener
Runtime:addEventListener( "system", onSystemEvent )
``````
