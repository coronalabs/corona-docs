# transition.cancelAll()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [transition.*][api.library.transition]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          easing, animation, transition, tween, interpolation
> __See also__			[Transitions][guide.media.transitionLib] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `transition.cancelAll()` function cancels all running and paused transitions.

Note: Using [transition.cancelAll()][api.library.transition.cancelAll] requires `Solar2D 2020.3611` or a newer build.


## Syntax

	transition.cancelAll()


## Examples

``````lua
-- cancel all running (and paused) transitions

local transition1 = transition.to( currentTarget, { time=400, y=y+100, iterations=5, tag="transTag" } )
local transition2 = transition.to( otherTarget, { time=200, y=y-200, tag="transTag" } )

-- later, cancel all running transitions
transition.cancelAll()
``````