# transition.to()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Library__			[transition.*][api.library.transition]
> __Return value__		[Table][api.type.Table]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			easing, animation, transition, tween, interpolation
> __See also__			[Transitions][guide.media.transitionLib] _(guide)_
>						[easing][api.library.easing]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Animates (transitions) a [display object][api.type.DisplayObject] using an optional [easing][api.library.easing] algorithm. Use this to move, rotate, fade, or scale an object over a specific period of time.

This function returns a reference corresponding to the transition/animation of the object `target`.

Please see the [Transitions][guide.media.transitionLib] guide for usage information.


## Syntax

	transition.to( target, params )

##### target ~^(required)^~
_[Table][api.type.Table]._ Any object that behaves like a table, for example [display objects][api.type.DisplayObject].

##### params ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the properties of the transition — see the next section for details.


## Parameter Reference

The `params` table includes the properties of `target` that should be interpolated.

##### time ~^(optional)^~
_[Number][api.type.Number]._ Specifies the duration of the transition in milliseconds. By default, the duration is 500 milliseconds.

##### iterations ~^(optional)^~
_[Number][api.type.Number]._ Specifies the number of iterations for which the transition will repeat. By default, the iteration value is `1`. 

##### tag ~^(optional)^~
_[String][api.type.String]._ Specifies the transition tag. The transition library can pause, resume, or cancel transitions sharing the same tag.

##### transition ~^(optional)^~
_[Function][api.type.Function]._ Specifies the [easing][api.library.easing] interpolation method. Default is linear.

##### delay ~^(optional)^~
_[Number][api.type.Number]._ Specifies the delay, in milliseconds, before the transition begins. Default is `0`.

##### delta ~^(optional)^~
_[Boolean][api.type.Boolean]._ Specifies whether non-control parameters are interpreted as final ending values or as changes in value. The default is `false`.

##### onStart ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called before the transition begins. This function will receive a reference to the associated object as its sole argument.

##### onComplete ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called after the transition completes. This function will receive a reference to the associated object as its sole argument.

##### onPause ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the transition is paused. This function will receive a reference to the associated object as its sole argument.

##### onResume ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the transition is resumed. This function will receive a reference to the associated object as its sole argument.

##### onCancel ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the transition is cancelled. This function will receive a reference to the associated object as its sole argument.

##### onRepeat ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the transition completes an iteration in a repeat cycle. This function will receive a reference to the associated object as its sole argument.

##### x ~^(optional)^~
_[Number][api.type.Number]._ Moves the target from its current __x__ coordinate to another.

##### y ~^(optional)^~
_[Number][api.type.Number]._ Moves the target from its current __y__ coordinate to another.

##### rotation ~^(optional)^~
_[Number][api.type.Number]._ Rotates the target from its current angle to another.

##### alpha ~^(optional)^~
_[Number][api.type.Number]._ Fades the target from its current alpha value to another.

##### xScale ~^(optional)^~
_[Number][api.type.Number]._ Scales the target to a specific __x__ ratio.

##### yScale ~^(optional)^~
_[Number][api.type.Number]._ Scales the target to a specific __y__ ratio.

##### size ~^(optional)^~
_[Number][api.type.Number]._ Applies only if the target is a [TextObject][api.type.TextObject] created via [display.newText()][api.library.display.newText]. This will transition the font size of the text object.

##### width ~^(optional)^~
_[Number][api.type.Number]._ Resizes the target from its current width to another.

##### height ~^(optional)^~
_[Number][api.type.Number]._ Resizes the target from its current height to another.

##### x1, y1, x2, y2, x3, y3, x4, y4 ~^(optional)^~
_[Numbers][api.type.Number]._ Applies only if the target is a [RectPath][api.type.RectPath], applicable to a [ShapeObject][api.type.ShapeObject]. These properties control the quadrilateral distortion of the target.

##### [filterParameter] ~^(optional)^~
_[Number][api.type.Number]._ Applicable only if the target is a [fill.effect][api.type.Paint.effect] applied to a [ShapeObject][api.type.ShapeObject]. In this case, __\[filterParameter\]__ indicates an effect property associated with the specific filter effect, for example `ShapeObject.fill.effect.intensity`. See the [Filters, Generators, Composites][guide.graphics.effects] guide for which filter parameters apply to each filter.


## Examples

``````lua
local square = display.newRect( 0, 0, 100, 100 )

local w,h = display.contentWidth, display.contentHeight

local function listener1( obj )
    print( "Transition 1 completed on object: " .. tostring( obj ) )
end
 
local function listener2( obj )
    print( "Transition 2 completed on object: " .. tostring( obj ) )
end
 
-- (1) move square to bottom right corner; subtract half side-length
transition.to( square, { time=1500, alpha=0, x=(w-50), y=(h-50), onComplete=listener1 } )
 
-- (2) fade square back in after 2.5 seconds
transition.to( square, { time=500, delay=2500, alpha=1.0, onComplete=listener2 } )
``````
