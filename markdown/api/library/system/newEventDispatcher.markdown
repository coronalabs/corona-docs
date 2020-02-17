# system.newEventDispatcher()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      [EventDispatcher][api.type.EventDispatcher]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          newEventDispatcher, event
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a new [EventDispatcher][api.type.EventDispatcher] that allows you to set up your own private event communications. Like the [Runtime][api.type.Runtime] and [DisplayObject][api.type.DisplayObject] types, this allows users of this [EventDispatcher][api.type.EventDispatcher] to add listeners to it and receive custom events dispatched via the [object:dispatchEvent()][api.type.EventDispatcher.dispatchEvent] function. 

This API is intended for plugin developers who want to add their own custom functions similar to [Runtime:addEventListener()][api.type.EventDispatcher.addEventListener] and [Runtime:removeEventListener()][api.type.EventDispatcher.removeEventListener].


## Syntax

	system.newEventDispatcher()


## Example

``````lua
-- Create a private event dispatcher
local eventDispatcher = system.newEventDispatcher()

-- Add a listener to the above private event dispatcher
-- Listens for an event named "custom"
local function onCustomEvent( event )
	print( "Received custom event!" )
end
eventDispatcher:addEventListener( "custom", onCustomEvent ) 

-- Dipatch an event named "custom"
-- Only listeners added to this dispatcher can receive it
eventDispatcher:dispatchEvent( { name="custom" } )
``````
