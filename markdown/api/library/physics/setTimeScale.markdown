
# physics.setTimeScale()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Library__			[physics.*][api.library.physics]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			physics, frame-based physics, time-based physics, time scale
> __See also__			[physics.getTimeScale()][api.library.physics.getTimeScale]
>						[physics.setTimeStep()][api.library.physics.setTimeStep]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Adjusts the physics simulation time flow with a multiplier.


## Syntax

	physics.setTimeScale( scale )

##### scale ~^(required)^~
_[Number][api.type.Number]._ Value at which to multiply the physics "time&nbsp;step" on each update.


## Example

``````lua
physics.setTimeScale( 0.75 )  -- Run physics simulation at 3/4 of normal speed
``````
