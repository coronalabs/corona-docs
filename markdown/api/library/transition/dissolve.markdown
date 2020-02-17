# transition.dissolve()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [transition.*][api.library.transition]
> __Return value__      [Object][api.type.Object]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          easing, animation, transition, tween, interpolation
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Performs a dissolve transition between two display objects.

## Syntax

	transition.dissolve( object1, object2, time, delay )

##### object1 ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ The initial display object.

##### object2 ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ The final display object.

##### time ~^(optional)^~
_[Number][api.type.Number]._ Specifies the duration of the transition in milliseconds. By default, the duration is 500 milliseconds.

##### delay ~^(optional)^~
_[Number][api.type.Number]._ Specifies the delay, in milliseconds, before the transition begins. Default is `0`.


## Example

``````lua
-- Create the initial display object
local s1 = display.newImage( "sun.png" )
s1.x, s1.y = 200,300

-- Create the final display object and set its alpha to 0
local s2 = display.newImage( "moon.png" )
s2.x, s2.y = 200,300
s2.alpha = 0

-- Dissolve the two images
transition.dissolve( s1, s2, 2000, 500 )
``````