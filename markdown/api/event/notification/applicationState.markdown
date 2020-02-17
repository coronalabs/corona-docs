
# event.applicationState

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [notification][api.event.notification]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          notification, applicationState
> --------------------- ------------------------------------------------------------------------------------------

## Overview

String indicating the state of the application when the notification was received.

* `"active"` indicates that the application was running at the time.
* `"inactive"` indicates that the application was suspended or closed at the time.

## Example
 
``````lua
-- The launch arguments provide a notification event if this app was started when the user tapped on a notification
local launchArgs = ...

if ( launchArgs and launchArgs.notification ) then
	print( launchArgs.notification.type )
    print( launchArgs.notification.name )
    print( launchArgs.notification.sound )
    print( launchArgs.notification.alert )
    print( launchArgs.notification.badge )
    print( launchArgs.notification.applicationState )
end
``````