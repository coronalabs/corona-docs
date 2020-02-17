# system.setIdleTimer()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system timer
> __See also__          [system.getIdleTimer()][api.library.system.getIdleTimer]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Controls whether the idle timer is enabled. If set to `true`, the timer will be active (default) or inactive if `false`. When active, the idle timer dims the screen and eventually puts the device to sleep when no user activity occurs.

## Gotchas

### Battery Life

When most applications have no touches as user input for a short period, the system puts the device into a "sleep" state where the screen dims. This is done for the purposes of conserving power. However, applications that don't have user input except for the accelerometer — games, for instance — can disable the "idle&nbsp;timer" (by setting this property to `false`) to avert system sleep.

You should set this property only if necessary and should be sure to reset it to `true` when the need no longer exists. Most applications should let the system turn off the screen when the idle timer elapses. This includes audio applications. The only applications that should disable the idle timer are mapping applications, games, or similar programs with sporadic user interaction.

## Syntax

	system.setIdleTimer( enabled )

##### enabled ~^(required)^~
_[Boolean][api.type.Boolean]._ Pass `true` to enable the idle timer; `false` to disable it.


## Examples

``````lua
system.setIdleTimer( false )  -- disable (turn off) the idle timer
 
system.setIdleTimer( true )  -- enable (turn on) the idle timer
``````
