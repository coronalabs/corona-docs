# Transitions

This guide discusses how to use the Corona [transition][api.library.transition] library to move, rotate, fade, or scale a display object/group over a specific period of time.

<div class="guides-toc">

* [Library Features](#features)
* [Basic Transitions](#standard)
* [Controlling Transitions](#control)
* [Easing Functions](#easing)
* [Transition Events](#transevents)
* [Convenience Functions](#convenience)

</div>


<a id="features"></a>

## Library Features

* Ability to pause, resume, or cancel a transition (or all transitions).

<!---

* Ability to chain a __sequence__ of transitions together in one declaration. Sequenced transitions can be paused, resumed, and cancelled. Please see [Sequenced&nbsp;Transitions](#sequence) for details.

-->

* Ability to __tag__ several transitions by name and then pause, resume, or cancel all transitions sharing the same tag. For example, you may tag multiple transitions as `"menuTransition"` and then control all of these transitions at once. See [Controlling&nbsp;Transitions](#control) for more information on tagging.

* Ability to pause, resume, or cancel all transitions on an <nobr>object-wide</nobr> basis. For example, if you have applied a separate movement and fade transition to an object, this allows you to control both transitions at once. See [Controlling&nbsp;Transitions](#control) for more information.

* Over 40 [easing][api.library.easing] methods which allow you to interpolate objects across the transition time using methods such as quadratic, exponential, elastic, bounce, etc.

* Various convenience functions such as `blink()`, `moveTo()`, `moveBy()`, etc. See [Convenience&nbsp;Functions](#convenience) for usage details.




<a id="standard"></a>

## Basic Transitions

<!---

## Standard Transitions

-->

A basic transition can be initiated using one of these functions:

<!---

A standard non-sequenced transition can be initiated using one of these functions:

-->

* `transition.to( target, params )` — this function transitions (animates) a [display&nbsp;object][guide.media.displayObjects] or [display&nbsp;group][api.library.display.newGroup] using an optional easing function. Use this to move, rotate, fade, or scale an object over a specific period of time.

* `transition.from( target, params )` — this is similar to `transition.to()` except that the starting property values are specified in the parameters table and the final values are the corresponding property values of the object prior to the call.

The first argument in either function, `target`, is the display object or group that you wish to transition. The second argument, `params`, is a table of key-value pairs. Inside this table, specify the appropriate __control&nbsp;parameters__ for the transition:

<div class="inner-table">

Control				Description
------------------	----------------------
`time`				Specifies the duration of the transition in milliseconds.
`delay`				Specifies the delay, in milliseconds, before the transition begins. Default is `0` (none).
`delta`				Specifies whether the final object properties are specific values or changes in value. The default is `nil` meaning `false`.
`iterations`		The number of times (integer) that the transition should repeat. `0` or `-1` will cause the transition to repeat forever.
`tag`				String value which allows you to categorize transitions and control them together. See [Controlling&nbsp;Transitions](#control).
`transition`		Specifies the [easing][api.library.easing] function used for the transition. See [Easing&nbsp;Functions](#easing).
------------------	----------------------

</div>

To affect the final object properties, the following methods are available. In the `params` table, specify each appropriate [property][api.type.DisplayObject] along with its final value.

<div class="inner-table">

Method				Properties (key)											Description
------------------	--------------------------									------------------
move				`x`, `y`													Moves an object from its current __x/y__ coordinate to another.
rotate				`rotation`													Rotates an object from its current angle to another.
fade				`alpha`														Fades an object from its current alpha value to another.
scale				`xScale`, `yScale`											Scales an object to a specific __x__ ratio or __y__ ratio.
font size			`size`														Applies only if the target is a [TextObject][api.type.TextObject]. This will transition the font size of the text object.
resize				`width`, `height`											Resizes an object from its current width/height to another.
distort				<nobr>`x1`, `y1`, `x2`, `y2`, `x3`, `y3`, `x4`, `y4`</nobr>	Applies only if the target is a [RectPath][api.type.RectPath], applicable to a [ShapeObject][api.type.ShapeObject]. These properties control the quadrilateral distortion of the target.
fill&nbsp;effect	(various)													Applicable only if the target is a [fill.effect][api.type.Paint.effect] applied to a [ShapeObject][api.type.ShapeObject]. In this case, the property (key) indicates an effect property associated with the specific filter effect, for example `ShapeObject.fill.effect.intensity`. See the [Effects Guide][guide.graphics.effects] for which filter parameters apply to each filter.
------------------	--------------------------									------------------

</div>

Note that transitions support the full range of __transition&nbsp;events__ listed below. These flags will trigger the specified listener function when that event occurs on the transition. When invoked, the __object__ reference is passed to the listener function as the sole parameter. Please see [Transition&nbsp;Events](#transevents) for details.

<div class="inner-table">

Event				Description
------------------	----------------------
`onStart`			Listener function called when the transition begins.
`onComplete`		Listener function called after the transition completes.
`onPause`			Listener function called when an active transition is paused.
`onResume`			Listener function called when a paused transition is resumed.
`onCancel`			Listener function called when an active transition is cancelled.
`onRepeat`			Listener function called when an active transition has completed an iteration cycle.

</div>

### Examples

1. The following transition __moves__ an object from its current position to the __y__ coordinate of 100 over the timespan of 2000 milliseconds. In this case, the __y__ value is the specific value in content area coordinates.

<div class="image-indent">

``````lua
transition.to( myObject, { time=2000, y=100 } )
``````

</div>

2. To apply a property value as a __change__ relative to the object's starting value, simply set the `delta` property to `true`. In the following example, the object will move down 100 pixels from its starting __y__ position. Note that the same principle can be applied to any property change.

<div class="image-indent">

``````lua
transition.to( myObject, { time=2000, y=100, delta=true } )
``````

</div>

3. The next transition moves an object from its current position to the __y__ coordinate of 400 over the timespan of 2000 milliseconds. It repeats 4 times using the `iterations` parameter and an elastic interpolation effect is applied with the `transition` parameter.

<div class="image-indent">

``````lua
transition.to( myObject, { time=2000, y=400, iterations=4, transition=easing.outElastic } )
``````

</div>

4. Transitions can also be combined using just one transition call. For example, if you want to rotate an object 45 degrees, scale it vertically to 200%, and fade its alpha to 50%, you do __not__ need to make three separate transition calls. Instead, just declare all three property changes in the `params` table:

<div class="image-indent">

``````lua
transition.to( myObject, { time=2000, rotation=45, yScale=2, alpha=0.5 } ) 
``````

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Some objects will not behave as you may expect during or following a transition. For instance, many [widgets][api.library.widget] do not support scaling or <nobr>post-declaration</nobr> resizing, so you should not attempt to perform an `xScale`, `yScale`, `width`, or `height` transition upon them. Another example is [physics][api.library.physics.addBody] bodies: if&nbsp;you scale or resize the physics object using a transition, the actual physics body will __not__ scale along with that transition.

If in doubt, check the [documentation][api] associated with the object or library to confirm that it doesn't have any property restrictions related to transitions.

</div>



<!---

<a id="sequenced"></a>

## Sequenced Transitions

For more complex transitions, the library supports __sequenced__ transitions in one declaration. To set up a sequenced transition, begin with a table of ordered <nobr>sub-tables,</nobr> each of which defines an individual transition within the sequence. These ordered transitions should be structured like the `params` table in [standard&nbsp;transitions](#standard).

``````lua
local sequenceTable = {
	{ time=1000, y=220 },
	{ time=1200, x=200, mode="afterPrevious" },
	{ time=1000, y=430, rotation=90, mode="afterPrevious" },
	{ time=2000, y=50, rotation=0, mode="afterPrevious" },
	{ time=1000, y=200, x=300, mode="afterPrevious" }
}
``````

The obvious addition to these transition specifications is the `mode` parameter, set to one of two values:

* `"afterPrevious"` — this is the most common mode and it will be used by default if you don't specify otherwise. It tells Corona to start the transition __after__ the previous transition has completed. In this manner, you can chain together a logical sequence where each transition executes immediately on completion of the previous one.

* `"withPrevious"` — this mode allows you to start a transition __in&nbsp;unison__ with the previous one. For example, if you want an object to move down a certain distance over the timespan of 2000 milliseconds, but fade to alpha 50% in just 400 milliseconds, you can specify the alpha transition with a `"withPrevious"` mode immediately after the movement transition. This will cause the two transitions to begin in unison but complete after distinct timespans.

Once the sequence is correctly set up, initialize it using `transition.createSequence()`. In this call, provide a `name` for the sequence and specify the sequence table that you created as `transitions`:

``````lua
transition.newSequence( myObject, { name="sequence1", transitions=sequenceTable } )
``````

This configures the transition sequence for the object, but it does not start running it. To begin the sequence, call `runSequence()` and pass the assigned name:

``````lua
transition.runSequence( "sequence1" )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

* Sequenced transitions support the full range of transition events such as `onStart`, `onPause`, and `onComplete`, but these event flags must be specified in the `createSequence()` function instead of within a specific transition <nobr>sub-table.</nobr> Please see [Transition&nbsp;Events](#transevents) for details.

</div>

-->



<a id="control"></a>

## Controlling Transitions

Transitions can be paused, resumed, or cancelled before completion. The parameter passed to the control function determines the scope of the action.

<!---

All transitions — standard and sequenced — can be paused, resumed, or cancelled before completion. The parameter passed to the control function determines the scope of the action.

-->

### Pause

Transitions can be paused with the [transition.pause()][api.library.transition.pause] function. This only effects transitions that are running.

<div class="inner-table">

Parameter				Scope
----------------------	--------------------------
(none)					Pauses all running transitions.
transition reference	Pauses a specific running transition.
object reference		Pauses all running transitions on a specific object.
tag name (string)		Pauses all running transitions sharing the same tag name.
----------------------	--------------------------

</div>

### Resume

Transitions can be resumed with the [transition.resume()][api.library.transition.resume] function. This only effects transitions that are paused.

<div class="inner-table">

Parameter				Scope
----------------------	--------------------------
(none)					Resumes all paused transitions.
transition reference	Resumes a specific paused transition.
object reference		Resumes all paused transitions on a specific object.
tag name (string)		Resumes all paused transitions sharing the same tag name.
----------------------	--------------------------

</div>

### Cancel

Transitions can be cancelled with the [transition.cancel()][api.library.transition.cancel] function. Note that the transition(s) will stop in place — they will not revert to the beginning state or skip to the ending state. This function only effects transitions that are currently running or paused.

<div class="inner-table">

Parameter				Scope
----------------------	--------------------------
(none)					Cancels all running/paused transitions.
transition reference	Cancels a specific running/paused transition.
object reference		Cancels all running/paused transitions on a specific object.
tag name (string)		Cancels all running/paused transitions sharing the same tag name.
----------------------	--------------------------

</div>




<a id="easing"></a>

## Easing Functions

By default, transitions occur on a consistent, linear rate of change from the starting value to the ending value. However, you may wish to use an [easing][api.library.easing] effect to achieve a different result, for example, to make an object move quickly at the start and gradually slow down as it reaches its destination. This behavior can be achieved using the [easing&nbsp;library][api.library.easing] functions in conjunction with the transition call.

To set an easing effect on a transition, simply provide the `transition` key in the `params` table with a value equal to one of the [easing&nbsp;library][api.library.easing] functions:

``````lua
--transition the object out with quadratic interpolation
transition.to( myObject, { time=2000, y=100, transition=easing.outQuad } )

--transition the object in, then back out, with exponential interpolation
transition.to( myObject, { time=2000, y=100, transition=easing.inOutExpo } )
``````




<a id="transevents"></a>

## Transition Events

Corona supports a full range of transition events, including:

* `onStart`
* `onComplete`
* `onPause`
* `onResume`
* `onCancel`
* `onRepeat`

<!---

### Standard Transition

-->

To trigger an event response from a transition, add the desired event key(s) to the `params` table along with the listener function(s) which should be called:

<!---

To trigger an event response from a standard transition, add the desired event key(s) to the `params` table along with the listener function(s) which should be called:

-->

``````lua
local myObject = display.newRect( 0, 0, 100, 100 )

local function completeListener ( obj )
	--when this function is invoked, the object reference is passed instead of an 'event' table
	print( "Transition completed on object: " .. tostring( obj ) )
end

transition.to( myObject, { time=2000, alpha=0, onComplete=completeListener } )
``````

<!---

### Sequenced Transition

To use transition events with [sequenced&nbsp;transitions](#sequenced), ??????????

``````lua
local myObject = display.newRect( 0, 0, 100, 100 )

local function completeListener ( obj )
	--when this function is invoked, the object reference is passed instead of an 'event' table
	print( "Transition completed on object: " .. tostring( obj ) )
end

local sequenceTable = {
	{ time=1000, y=220 },
	{ time=1200, x=200, mode="afterPrevious" }
}
--specify event listener(s) in ''
transition.createSequence( myObject, { name="sequence1", transitions=sequenceTable, onComplete=completeListener } )
transition.runSequence( "sequence1" )
``````

-->

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you remove or clear a transitioning object from memory, and the transition has an `onComplete` event, the listener will still be invoked even though the object no longer exists on the screen. Other transition events may even crash the program if the object has been prematurely removed. Thus, it's good practice to cancel all transitions on a specific object before removing it. Passing the object reference to [transition.cancel()][api.library.transition.cancel] is useful for this purpose.

In a wider scope, you may consider using [transition.cancel()][api.library.transition.cancel] with no params to cancel __all__ transitions before exiting a [Composer][api.library.composer] scene or clearing a module.

</div>




<a id="convenience"></a>

## Convenience Functions

Corona provides several convenience functions which let you perform simple transitions with recognizable names. The following function accept the object/group to transition as the first parameter and, like standard transitions, a `params` table containing key-values appropriate to the transition type.

<div class="inner-table">

Function														Description
--------------------------------------------------------------	--------------------------
[transition.blink()][api.library.transition.blink]				Repeatedly oscillates the alpha value of an object in and out over the timespan.
[transition.dissolve()][api.library.transition.dissolve]		Performs a dissolve transition between two display objects.
[transition.fadeIn()][api.library.transition.fadeIn]			Fades an object to alpha of 1.0 over the specified time.
[transition.fadeOut()][api.library.transition.fadeOut]			Fades an object to alpha of 0.0 over the specified time.
[transition.moveBy()][api.library.transition.moveBy]			Moves an object by the specified x and y coordinate amount over a specified time.
[transition.moveTo()][api.library.transition.moveTo]			Moves an object to the specified x and y coordinates over a specified time.
[transition.scaleBy()][api.library.transition.scaleBy]			Scales an object by the specified xScale and yScale amounts over a specified time.
[transition.scaleTo()][api.library.transition.scaleTo]			Scales an object to the specified xScale and yScale amounts over a specified time.
--------------------------------------------------------------	--------------------------

</div>
