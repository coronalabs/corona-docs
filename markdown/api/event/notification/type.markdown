
# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [notification][api.event.notification]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          notification, type
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string identifying the type of notification event:

* `"local"` &mdash; From events created locally.
* `"remote"` &mdash; From remote push events originating from a server.
* `"remoteRegistration"` &mdash; Used for initializing remote push events. If successful, the event will also contain a `"token"` property which contains a string needed by your push server to communicate with Apple's Push Notification server; if not, then the event will have an `"error"` property.

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
