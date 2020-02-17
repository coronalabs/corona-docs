# transition.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          easing, animation, transition, tween, interpolation
> __See also__			[Transitions][guide.media.transitionLib] _(guide)_
>						[easing][api.library.easing]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The transition library provides functions and methods to transition/tween display objects or display groups over a specific period of time. Library features include:

* Ability to __pause__, __resume__, or __cancel__ a transition (or all transitions).

* Ability to __tag__ several transitions by name and then pause, resume, or cancel all transitions sharing the same tag.

* Ability to pause, resume, or cancel all transitions on an object-wide basis. For example, if you have applied a separate movement and fade transition to an object, this allows you to control both transitions at once.

* 41 [easing][api.library.easing] methods which allow you to interpolate tweens across the transition time using methods such as quadratic, exponential, elastic, bounce, etc.

* Various convenience methods such as `blink()`, `fadeIn()`, `fadeOut()`, `moveTo()`, `moveBy()`, etc.


## Functions

#### [transition.cancel()][api.library.transition.cancel]

#### [transition.from()][api.library.transition.from]

#### [transition.pause()][api.library.transition.pause]

#### [transition.resume()][api.library.transition.resume]

#### [transition.to()][api.library.transition.to]

## Convenience Methods

#### [transition.blink()][api.library.transition.blink]

#### [transition.dissolve()][api.library.transition.dissolve]

#### [transition.fadeIn()][api.library.transition.fadeIn]

#### [transition.fadeOut()][api.library.transition.fadeOut]

#### [transition.moveBy()][api.library.transition.moveBy]

#### [transition.moveTo()][api.library.transition.moveTo]

#### [transition.scaleBy()][api.library.transition.scaleBy]

#### [transition.scaleTo()][api.library.transition.scaleTo]
