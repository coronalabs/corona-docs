# transition.resume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [transition.*][api.library.transition]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          easing, animation, transition, tween, interpolation
> __See also__			[Transitions][guide.media.transitionLib] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The `transition.resume()` function resumes one of the following, depending on the passed parameter:

* All paused transitions, when called with no parameters.
* A specific paused transition, when called with a transition reference.
* All paused transitions on a specific display object, when called with a display object reference.
* All paused transitions with a specific tag, when called with a string parameter representing a tag.


## Syntax

	transition.resume()
	transition.resume( transitionReference )
	transition.resume( displayObject )
	transition.resume( tagName )


##### transitionReference ~^(optional)^~
The specific paused transition to resume.

##### displayObject ~^(optional)^~
_[DisplayObject][api.type.DisplayObject]._ The display object upon which all associated transitions will be resumed.

##### tagName ~^(optional)^~
_[String][api.type.String]._ The tag name; all transitions with this tag will be resumed.


## Examples

``````lua
-- resume all paused transitions

local transition1 = transition.to( currentTarget, { time=400, y=y+100, iterations=5, tag="transTag" } )
local transition2 = transition.to( otherTarget, { time=200, y=y-200, tag="transTag" } )

-- at some point, pause all running transitions
transition.pause()

-- later, resume all paused transitions
transition.resume()
``````

``````lua
-- resume a specific paused transition

local transition1 = transition.to( currentTarget, { time=400, y=y+100, iterations=5, tag="transTag" } )
local transition2 = transition.to( otherTarget, { time=200, y=y-200, tag="transTag" } )

-- at some point, pause a specific transition
transition.pause( transition1 )

-- later, resume the transition
transition.resume( transition1 )
``````

``````lua
-- resume all paused transitions on a display object

local transition1 = transition.to( currentTarget, { time=400, y=y+100, iterations=5, tag="transTag" } )
local transition2 = transition.to( otherTarget, { time=200, y=y-200, tag="transTag" } )

-- at some point, pause all transitions on the object 'otherTarget'
transition.pause( otherTarget )

-- later, resume all transitions on the object
transition.resume( otherTarget )
``````

``````lua
-- resume all paused transitions with a specific tag

local transition1 = transition.to( currentTarget, { time=400, y=y+100, iterations=5, tag="transTag" } )
local transition2 = transition.to( otherTarget, { time=200, y=y-200, tag="transTag" } )

-- at some point, pause all transitions with the tag "testingTag"
transition.pause( "transTag" )

-- later, resume all transitions with the tag "testingTag"
transition.resume( "transTag" )
``````