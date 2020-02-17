# object:addEventListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [EventDispatcher][api.type.EventDispatcher]
> __Return value__      [Boolean][api.type.Boolean] or `nil`
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          addEventListener, event listener
> __See also__          [object:removeEventListener()][api.type.EventDispatcher.removeEventListener]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Adds a listener to the object's list of listeners. When the named event occurs, the listener will be invoked and be supplied with a table representing the event.

Returns `true` if your listener was successfully added to the [EventDispatcher][api.type.EventDispatcher], [Runtime][api.type.Runtime], [DisplayObject][api.type.DisplayObject], etc. Returns `nil` if you have invalid arguments, such as the listener not being a function or if it's a table that doesn't have a function matching the event name.


## Syntax

	object:addEventListener( eventName, listener )

##### eventName ~^(required)^~
_[String][api.type.String]._ String specifying the name of the event to listen for. Please refer to the [Events][api.event] documentation for valid event names.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listeners can be either functions or table objects. If the event's `event.name` matches this string, the listener will be invoked. Event listeners are either functions or objects (table&nbsp;listeners). This argument is optional if it's a table listener of the same object.


## Gotchas

On iOS, if you monitor the device's accelerometer by setting the `eventName` argument to `"accelerometer"`, you must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSMotionUsageDescription = "This app would like to access the accelerometer.",
		},
	},
}
``````


## Example

``````lua
local object = display.newImage( "image.png" )

function object:touch( event )
    if event.phase == "began" then
        print( "You touched the object!" )
        return true
    end
end

object:addEventListener( "touch", object )
``````
