# transition.from()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [transition.*][api.library.transition]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          easing, animation, transition, tween, interpolation
> __See also__			[Transitions][guide.media.transitionLib] _(guide)_
>						[easing][api.library.easing]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Similar to [transition.to()][api.library.transition.to] except that the starting property values are specified in the parameters table and the final values are the corresponding property values of the object prior to the call.

## Syntax

	transition.from( target, params )

##### target ~^(required)^~
_[Table][api.type.Table]._ Any object that behaves like a table, for example [display objects][api.type.DisplayObject].

##### params ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the properties of the transition. See [transition.to()][api.library.transition.to] for parameter references.


## Examples

``````lua
local square = display.newRect( 0, 0, 100, 100 )

local w,h = display.contentWidth, display.contentHeight

local function listener( obj )
    print( "Transition completed on object: " .. tostring( obj ) )
end

-- Move square from bottom right corner to upper left corner
transition.from( square, { time=1500, x=(w-50), y=(h-50), onComplete=listener } )
``````
