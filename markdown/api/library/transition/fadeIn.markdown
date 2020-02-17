# transition.fadeIn()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [transition.*][api.library.transition]
> __Return value__      [Object][api.type.Object]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          easing, animation, transition, tween, interpolation
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Fades an object to alpha of `1.0` over the specified time.

## Syntax

	transition.fadeIn( target, params )

##### target ~^(required)^~
_[Table][api.type.Table]._ Any object that behaves like a table, for example [display objects][api.type.DisplayObject].

##### params ~^(required)^~
_[Table][api.type.Table]._ A table that specifies the properties of the transition — see the next section for details.


## Parameter Reference

##### time ~^(optional)^~
_[Number][api.type.Number]._ The time of the action.

##### tag ~^(optional)^~
_[String][api.type.String]._ Specifies the transition tag. The transition library can pause, resume, or cancel transitions sharing the same tag.

##### transition ~^(optional)^~
_[Function][api.type.Function]._ Specifies the [easing][api.library.easing] interpolation method. Default is linear.

##### delay ~^(optional)^~
_[Number][api.type.Number]._ Specifies the delay, in milliseconds, before the transition begins. Default is `0`.

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


## Examples

``````lua
local square = display.newRect( 0, 0, 100, 100 )
square.alpha = 0

transition.fadeIn( square, { time=2000 } )
``````