# object:dispatchEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [EventDispatcher][api.type.EventDispatcher]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          dispatchEvent, dispatch event, custom events
> __See also__          [object:addEventListener()][api.type.EventDispatcher.addEventListener]
>						[object:removeEventListener()][api.type.EventDispatcher.removeEventListener]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Dispatches specified `event` to object. The event parameter must be a table with a `name` property which is a [string][api.type.String] identifying the type of event. This method is available for any [DisplayObject][api.type.DisplayObject] or the global [Runtime][api.type.Runtime] object, if it has a listener registered to receive name events. We recommend you also include a `target` property in your event to the event so that your listener can know which object received the event.

In Corona, you can register custom events with both [DisplayObjects][api.type.DisplayObject] or the global [Runtime][api.type.Runtime] object. In both cases, you will have to manually dispatch the event yourself using this object method.

## Syntax

	object:dispatchEvent( event )

##### event ~^(required)^~
_[Table][api.type.Table]._ Contains event properties. The table must contain a `name` property that corresponds to the event you wish to dispatch.

## Example

``````lua
-- Create an object that listens to events
local image = display.newImage( "image.png" )
 
-- Setup listener
local myListener = function( event )
        print( "Event " .. event.name )
        print( "Target has width: " .. event.target.contentWidth )
end
 
image:addEventListener( "myEventType", myListener )
 
-- Sometime later, create an event and dispatch it
local event = { name="myEventType", target=image }
image:dispatchEvent( event )
``````
