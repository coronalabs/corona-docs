
# relativeTouch

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, relativeTouch
> __See also__          [MFi Controller][guide.hardware.mfiControllers] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

When the user interacts with certain <nobr>touch-sensitive</nobr> devices, a relative touch event is generated and dispatched. While a normal [touch][api.event.touch] event represents an interaction with the screen or a display object you can physically touch, a `relativeTouch` event is for devices where touch sensitivity is not related to the display area.


## Gotchas

Relative touch events are currently only supported on tvOS as an alternative to using [axis][api.event.axis] events from the [InputDevice][api.type.InputDevice] <nobr>(Apple TV remote)</nobr>.


## Properties

#### [event.id][api.event.relativeTouch.id]

#### [event.name][api.event.relativeTouch.name]

#### [event.phase][api.event.relativeTouch.phase]

#### [event.time][api.event.relativeTouch.time]

#### [event.x][api.event.relativeTouch.x]

#### [event.y][api.event.relativeTouch.y]

#### [event.tapCount][api.event.relativeTouch.tapCount]


## Examples

##### Function Listener 1

``````lua
-- Create text object to monitor relative touch
local touchData = display.newText( "-,- []", display.contentCenterX, display.contentCenterY, native.systemFont, 16 )
local tapCounter = display.newText( "0", display.contentCenterX, display.contentCenterY+24, native.systemFont, 16 )

-- Text update function
local function updateText( event )
	touchData.text = event.x .. "," .. event.y .. " [" .. event.phase .. "]"
	if ( event.phase == "ended" ) then
		tapCounter.text = event.tapCount
	end
end

-- Add relative touch runtime listener
Runtime:addEventListener( "relativeTouch", updateText )
``````

##### Function Listener 2

``````lua
-- Create a circle
local circle = display.newCircle( display.contentCenterX, display.contentCenterY, 100 )
circle:setFillColor( 0, 1, 0 )

-- Movement data
local moveX = 0
local moveY = 0
local moveScale = 0.05

-- Update movement rates when we get a new relative touch event
local function setCircleMovement( event )
	if ( event.phase == "moved" ) then
		moveX = event.x * moveScale
		moveY = event.y * moveScale
	elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
		moveX = 0
		moveY = 0
		circle.x = display.contentCenterX
		circle.y = display.contentCenterY
	end
end

-- Add relative touch runtime listener
Runtime:addEventListener( "relativeTouch", setCircleMovement )

-- Update the circle's movement based on the last touch's data
local function updateCirclePosition( event )
	circle.x = circle.x + moveX
	circle.y = circle.y + moveY
end
Runtime:addEventListener( "enterFrame", updateCirclePosition )
``````
