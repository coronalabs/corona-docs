
# enterFrame

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          enterFrame, runtime
> __See also__          [Basic Interactivity and Event Detection][guide.events.detectEvents] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

`"enterFrame"` events occur at the <nobr>frames-per-second</nobr> interval of the application, either 30 or 60 as specified in `config.lua`. They are only dispatched to the global [Runtime][api.type.EventDispatcher] object.


## Properties

#### [event.name][api.event.enterFrame.name]

#### [event.frame][api.event.enterFrame.frame]

#### [event.time][api.event.enterFrame.time]


## Examples

##### Event Name

``````lua
local myListener = function( event )
    print( "Listener called with event of type " .. event.name )
end
Runtime:addEventListener( "enterFrame", myListener )
``````

##### Event Frame

``````lua
local function printCurrentFrameID( event )
    print ( "Current frame ID: " .. tostring(event.frame) )
end 
Runtime:addEventListener( "enterFrame", printCurrentFrameID )
``````

##### Event Time

``````lua
local function printTimeSinceStart( event )
	print ( tostring(event.time/1000) .. " seconds since app started." )
end 
Runtime:addEventListener( "enterFrame", printTimeSinceStart )
``````
