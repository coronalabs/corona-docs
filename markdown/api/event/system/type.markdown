
# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [system][api.event.system]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system, type
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Identifies the type of system event that occurred. It will be one of the following values:

* `"applicationStart"` occurs when the application is launched and all code in `main.lua` is executed.

* `"applicationExit"` occurs when the user or OS task manager quits the application. Circumstances may result where this event does not fire at all or that it gets very little time to run before the operating system terminates the app, so no <nobr>long-running</nobr> operations should be performed during this phase and you should be aware that network requests will likely be unsuccessful.

* `"applicationSuspend"` occurs when the device needs to suspend the application, such as during a phone call or if the device goes to sleep from inactivity or user action. Circumstances may result where this event has very little time to run before the operating system suspends the app, so no <nobr>long-running</nobr> operations should be performed during this phase and you should be aware that network requests will likely be unsuccessful. Also, during suspension, no events <nobr>(not even `"enterFrame"` events)</nobr> are sent to the application, so if you have code that depends on time, you should account for the time lost to an application being suspended.

* `"applicationResume"` occurs when the application resumes after a suspend. On the device, this occurs if the application was suspended because of a phone call or sleep. In the Simulator, this corresponds to selecting __Resume__ from the __Hardware__ menu.

* `"applicationOpen"` occurs when the application is asked to open a URL or file, both of which are provided via the [event.url][api.event.system.url] property. For Win32 desktop apps configured to be <nobr>single-instance</nobr> only, this event also occurs when attempting to launch a second instance with command line arguments which are provided via the [event.commandLineArgs][api.event.system.commandLineArgs] property.


## Gotchas

* When a user "force&nbsp;quits" an application, the `"applicationExit"` event does not fire on any platform.

* Circumstances may result where the `"applicationExit"` and `"applicationSuspend"` events have very little time to run before the operating system terminates/suspends the app, so no <nobr>long-running</nobr> operations should be performed during these phases and you should be aware that network requests will likely be unsuccessful.


## Example
 
``````lua
local function onSystemEvent( event )
	print( "System event name and type: " .. event.name, event.type )
end
 
Runtime:addEventListener( "system", onSystemEvent )
``````
