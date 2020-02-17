
# physics.start()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, start
> __See also__          [physics.pause()][api.library.physics.pause]
>						[physics.stop()][api.library.physics.stop]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function start the physics simulation and should be called before any other physics functions.


## Gotchas

By default, physical bodies not involved in a collision will "sleep" after a few seconds. This reduces performance overhead, but in some cases you may not want this behavior. This is particularly true in apps that use the accelerometer to effect changes in physics gravity&nbsp;&mdash; in this case, sleeping bodies will __not__ respond to changes in the direction of gravity since it's not a direct force that "wakes" sleeping bodies.

You can override this behavior on any given body with the [object.isSleepingAllowed][api.type.Body.isSleepingAllowed] property, or you can override it globally for __all__ bodies in the simulation by using an optional boolean parameter in `physics.start()` (see&nbsp;below).


## Syntax

``````lua
physics.start( [noSleep] )
``````

##### noSleep ~^(optional)^~
_[Boolean][api.type.Boolean]._ Value of `true` prevents all bodies from sleeping; `false` or `nil` allows all bodies to sleep (default&nbsp;mode).
