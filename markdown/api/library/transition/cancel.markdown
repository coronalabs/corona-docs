# transition.cancel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [transition.*][api.library.transition]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          easing, animation, transition, tween, interpolation
> __See also__			[Transitions][guide.media.transitionLib] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `transition.cancel()` function will cancel one of the following, depending on the passed parameter:

* All transitions in progress, when called with no parameters.
* A specific transition, when called with a transition reference.
* All transitions on a specific display object, when called with a display object reference.
* All transitions with a specific tag, when called with a string parameter representing a tag.


## Syntax

	transition.cancel()
	transition.cancel( transitionReference )
	transition.cancel( displayObject )
	transition.cancel( tagName )

##### transitionReference ~^(optional)^~
The specific transition to cancel.

##### displayObject ~^(optional)^~
_[DisplayObject][api.type.DisplayObject]._ The display object upon which all associated transitions will be cancelled.

##### tagName ~^(optional)^~
_[String][api.type.String]._ The tag name; all transitions with this tag will be cancelled.


## Examples

``````lua
-- cancel all running (and paused) transitions

local transition1 = transition.to( currentTarget, { time=400, y=y+100, iterations=5, tag="transTag" } )
local transition2 = transition.to( otherTarget, { time=200, y=y-200, tag="transTag" } )

-- later, cancel all running transitions
transition.cancel()
``````

``````lua
-- cancel a specific transition

local transition1 = transition.to( currentTarget, { time=400, y=y+100, iterations=5, tag="transTag" } )
local transition2 = transition.to( otherTarget, { time=200, y=y-200, tag="transTag" } )

-- later, cancel a specific transition
transition.cancel( transition1 )
``````

``````lua
-- cancel all transitions on a display object

local transition1 = transition.to( currentTarget, { time=400, y=y+100, iterations=5, tag="transTag" } )
local transition2 = transition.to( otherTarget, { time=200, y=y-200, tag="transTag" } )

-- later, cancel all transitions on the object 'otherTarget'
transition.cancel( otherTarget )
``````

``````lua
-- cancel all transitions with a specific tag

local transition1 = transition.to( currentTarget, { time=400, y=y+100, iterations=5, tag="transTag" } )
local transition2 = transition.to( otherTarget, { time=200, y=y-200, tag="transTag" } )

-- later, cancel all transitions with the tag "transTag"
transition.cancel( "transTag" )
``````