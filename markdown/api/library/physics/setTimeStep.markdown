
# physics.setTimeStep()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, frame-based physics, time-based physics, time scale
> __See also__          [physics.setScale()][api.library.physics.setScale]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Specifies either a frame-based (approximated) physics simulation or a <nobr>time-based</nobr> simulation.


## Syntax

	physics.setTimeStep( dt )

##### dt ~^(required)^~
_[Number][api.type.Number]._ Value of physics "time&nbsp;step" in seconds, meaning the time between each physics update in seconds.

* Use `0` to get an approximate time-based physics simulation.
* Use `-1` to get default behavior (frame-based).
* Use `1/30` for 30 updates per second.
* Use `1/60` for 60 updates per second.


## Example

`````lua
physics.setTimeStep( 0 )  -- Time-based physics simulation
`````
