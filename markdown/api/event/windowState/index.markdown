
# windowState

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Desktop Window
> __See also__          [Creating Win32 Desktop Apps][guide.distribution.win32Build]
>						[Creating macOS Desktop Apps][guide.distribution.macOSBuild]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Invoked when window is being sent to background or activated again.

## Properties

#### [event.name][api.event.windowState.name]

#### [event.phase][api.event.windowState.phase]


## Example

``````lua
function windowStateListener(event)
	print("Window was sent to: ", event.phase)
end
Runtime:addEventListener( "windowState", windowStateListener )
``````
