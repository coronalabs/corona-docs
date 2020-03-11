
# touch

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch
> __See also__          [Tap/Touch/Multitouch][guide.events.touchMultitouch] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

When the user's finger touches the screen, a hit event is generated and dispatched to display objects in the display hierarchy. Only those objects that intersect the hit location (the location of the finger on the screen) will be candidates for receiving events.

Multitouch events are an extension of single touch events. Multitouch is enabled by the [system.activate()][api.library.system.activate] API.

## Properties

#### [event.id][api.event.touch.id]

#### [event.name][api.event.touch.name]

#### [event.phase][api.event.touch.phase]

#### [event.pressure][api.event.touch.pressure]

#### [event.target][api.event.touch.target]

#### [event.time][api.event.touch.time]

#### [event.x][api.event.touch.x]

#### [event.xStart][api.event.touch.xStart]

#### [event.xDelta][api.event.touch.xDelta]

#### [event.y][api.event.touch.y]

#### [event.yStart][api.event.touch.yStart]

#### [event.yDelta][api.event.touch.yDelta]


## Examples

##### Function Listener

``````lua
local object = display.newImage( "ball.png" )
object.id = "ball object"

local function onObjectTouch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
	elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
    return true
end
object:addEventListener( "touch", onObjectTouch )
``````

##### Table Listener 1

``````lua
local object = display.newImage( "ball.png" )
object.id = "ball object"

local function onObjectTouch( self, event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
    end
    return true
end 

object.touch = onObjectTouch
object:addEventListener( "touch", object )
``````

##### Table Listener 2

``````lua
local object = display.newImage( "ball.png" )
object.id = "ball object"

function object:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
    end
    return true
end 
object:addEventListener( "touch", object )
``````

##### Comprehensive

``````lua
local object = display.newImage( "ball.png" )
object.id = "ball object"

function object:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )

        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
    
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )

        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then

            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
        end
    end
    return true
end 
object:addEventListener( "touch", object )
``````

