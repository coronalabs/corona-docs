# StageObject:setFocus()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [StageObject][api.type.StageObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setFocus, focus, touch focus
> __See also__          [touch][api.event.touch]
>						[display.getCurrentStage()][api.library.display.getCurrentStage]
>						[display.currentStage][api.library.display.currentStage]
>						[Tap/Touch/Multitouch][guide.events.touchMultitouch] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets a specific [display object][api.type.DisplayObject] as the target for all future [touch][api.event.touch] events. Pass `nil` to restore default behavior for touch event dispatches.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The global [StageObject][api.type.StageObject] can be retrieved at any time via [display.getCurrentStage()][api.library.display.getCurrentStage] or [display.currentStage][api.library.display.currentStage].

</div>


## Multitouch

When calling this method while __multitouch__ is enabled via [system.activate()][api.library.system.activate], the optional parameter `touchID` means that the specified touch has focus on that object, but other touches do not. Using this command, it is possible to create an object that will "own" the first touch it receives for the lifetime of that touch, and for multiple objects to obtain their own focused touches at the same time. Under this same scheme, if you need to release touch focus on a specific object, call this command with reference to the object and pass `nil` for `touchID`.

See the [examples](#examples) below for usage details, along with the [Tap/Touch/Multitouch][guide.events.touchMultitouch] guide.


## Syntax

	StageObject:setFocus( displayObject [, touchID] )

##### displayObject ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ Reference to a display object to set focus on.

##### touchID ~^(optional)^~
_[Userdata][api.type.Userdata]._ The touch ID passed to the touch event for the touched object. This only applies when [multitouch][guide.events.touchMultitouch] is __enabled__ via [system.activate()][api.library.system.activate].


## Examples

##### Multitouch Enabled

``````lua
-- Activate multitouch
system.activate( "multitouch" )

-- Create two display objects on the screen
local newRect1 = display.newRect( display.contentCenterX, 160, 60, 60 )
newRect1:setFillColor( 1, 0, 0.3 )
local newRect2 = display.newRect( display.contentCenterX, 320, 60, 60 )
newRect2:setFillColor( 0.3, 0, 1 )

-- Touch event listener
local function touchListener( event )

	print( "Unique touch ID: " .. tostring(event.id) )

	if ( event.phase == "began" ) then
		event.target.alpha = 0.5
		-- Set focus on object using unique touch ID
		display.getCurrentStage():setFocus( event.target, event.id )

	elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
		event.target.alpha = 1
		-- Release focus on object
		display.getCurrentStage():setFocus( event.target, nil )
	end
	return true
end

-- Add a touch listener to each object
newRect1:addEventListener( "touch", touchListener )
newRect2:addEventListener( "touch", touchListener )
``````

##### Multitouch Disabled

``````lua
-- Create two display objects on the screen
local newRect1 = display.newRect( display.contentCenterX, 160, 60, 60 )
newRect1:setFillColor( 1, 0, 0.3 )
local newRect2 = display.newRect( display.contentCenterX, 320, 60, 60 )
newRect2:setFillColor( 0.3, 0, 1 )

-- Touch event listener
local function touchListener( event )

	if ( event.phase == "began" ) then
		event.target.alpha = 0.5
		-- Set focus on object
		display.getCurrentStage():setFocus( event.target )

	elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
		event.target.alpha = 1
		-- Release focus on object
		display.getCurrentStage():setFocus( nil )
	end
	return true
end

-- Add a touch listener to each object
newRect1:addEventListener( "touch", touchListener )
newRect2:addEventListener( "touch", touchListener )
``````
