# transition.resumeAll()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [transition.*][api.library.transition]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          easing, animation, transition, tween, interpolation
> __See also__			[Transitions][guide.media.transitionLib] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `transition.resumeAll()` function resumes all paused transitions.


## Syntax

	transition.resumeAll()


## Examples

``````lua
-- resume all paused transitions

local transition1 = transition.to( currentTarget, { time=400, y=y+100, iterations=5, tag="transTag" } )
local transition2 = transition.to( otherTarget, { time=200, y=y-200, tag="transTag" } )

-- at some point, pause all running transitions
transition.pauseAll()

-- later, resume all paused transitions
transition.resumeAll()
``````