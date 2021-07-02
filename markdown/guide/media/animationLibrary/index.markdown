
# Animation &mdash; Tweens and Timelines

This guide discusses how to use the Corona [animation][plugin.animation] plugin to move, rotate, fade, or scale a display object/group over a specific period of time. It also outlines how to use [timelines](#timelines) to construct intricate <nobr>multi-interpolation</nobr> animations across one or more display objects/groups.

<div class="guides-toc">

* [Plugin Features](#features)
* [Tweens](#tweens)
* [Timelines](#timelines)
* [Controlling Tweens/Timelines](#control)
* [Tween/Timeline Status](#status)
* [Custom Easing Functions](#custom-easing)

</div>


<a id="features"></a>

## Plugin Features

* Ability to move, rotate, fade, or scale a display object/group over a specific period of time.

* Ability to construct and control [timelines](#timelines) for intricate <nobr>multi-interpolation</nobr> animations.

* Over 40 [easing][api.library.easing] methods. These allow you to adjust the interpolation using methods such as quadratic, exponential, elastic, bounce, etc.

* Programmatically move/set the playback position within a tween or timeline.

* Programmatically adjust the playback speed scale of any tween or timeline.

* Repeat (iterate) a tween any number of times (or&nbsp;indefinitely) with the option to reflect alternating iterations in reverse.

* Ability to interpolate multiple objects at a constant rate, even if they don't share the same initial/final position, rotation, alpha, or scale.

* Multiple event triggers to detect when a tween/timeline starts, completes, pauses, resumes, etc.

* Ability to tag multiple tweens/timelines by name and then pause, resume, or cancel all of them with one command.

* Ability to pause, resume, or cancel all tweens on an <nobr>object-wide</nobr> basis.




<a id="tweens"></a>

## Tweens

A basic __tween__ can be initiated using one of these functions:

* [animation.to()][plugin.animation.to] &mdash; This function animates (interpolates) properties of an object using an optional easing function. This is the most common animation call for basic tweens.

* [animation.from()][plugin.animation.from] &mdash; This is similar to `animation.to()` except that the starting property values are specified in the parameters table and the final values are the corresponding property values of the object prior to the call.

The basic syntax for these functions is:

``````lua
animation.to( target, properties, params )
``````

``````lua
animation.from( target, properties, params )
``````

### Tween Target

The first argument in either function, `target`, will most often be a [display object][guide.media.displayObjects] or [display group][api.library.display.newGroup] that you wish to animate. However, for more specialized cases, it can also be a [RectPath][api.type.RectPath] point for [quadrilateral distortion][guide.graphics.3D#quadrilateral-distortion], a table of <nobr>RGB+A</nobr> color channels for a [Paint][api.type.Paint] fill, or a [fill.effect][api.type.Paint.effect] property.

### Object Properties

The second argument, `properties`, is a table of <nobr>key-value</nobr> pairs. Inside this table, specify each desired __property__ to change along with its final value (starting&nbsp;value if using&nbsp;`animation.from()`).

<div class="inner-table">

Interpolation			Properties (Keys)												Description
----------------------	--------------------------------------------------------------	------------------
movement				`x`, `y`														Moves an object to/from a specific __x__ or __y__ coordinate.
rotation				`rotation`														Rotates an object to/from an angle to another.
fading in/out			`alpha`															Fades an object to/from an alpha value to another.
scaling&nbsp;up/down	`xScale`, `yScale`												Scales an object to/from a specific __x__ ratio or __y__ ratio.
font size				`size`															Applies only if `target` is a [TextObject][api.type.TextObject]. This will tween the font size of the text object.
resizing				`width`, `height`												Resizes an object to/from a specific width/height to another.
distortion				<nobr>`x1`, `y1`, `x2`, `y2`, `x3`, `y3`, `x4`, `y4`</nobr>		Applies only if `target` is a [RectPath][api.type.RectPath], applicable to a [ShapeObject][api.type.ShapeObject]. See [here][guide.graphics.3D#quadrilateral-distortion] for more information.
color channels			<nobr>`r`, `g`, `b`, `a`</nobr>									Applies only if `target` is the `.fill` table of a [ShapeObject][api.type.ShapeObject].
fill effect				(various)														Applies only if `target` is an object's [fill.effect][api.type.Paint.effect] property. In this case, the property (key) indicates an effect property associated with the specific filter effect. See [here][guide.graphics.effects#filter] for details on which filter parameters apply to each filter effect.
anchor point			`anchorX`, `anchorY`											Shifts the object's __x__ or __y__ [anchor point][guide.graphics.transform-anchor].
mask position			`maskX`, `maskY`												For a [masked image/group][guide.media.imageMask], shifts the mask's __x__ or __y__ position.
mask scale				`maskScaleX`, `maskScaleY`										For a [masked image/group][guide.media.imageMask], shifts the mask's __x__ or __y__ scale ratio.
----------------------	--------------------------------------------------------------	------------------

</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Some objects will not behave as you may expect during or following a tween. For instance, many [widgets][api.library.widget] do not support scaling or <nobr>post-declaration</nobr> resizing, so you should not attempt to perform an `xScale`, `yScale`, `width`, or `height` tween upon them. Another example is [physics][api.library.physics.addBody] bodies&nbsp;&mdash; if&nbsp;you scale or resize the physics object using a tween, the actual physics body will __not__ scale along with that tween.

If in doubt, check the [documentation][api] associated with the object or library to confirm that it doesn't have any property restrictions related to tweens.

</div>
</div>

### Control Parameters

The third argument, `params`, is also a table of <nobr>key-value</nobr> pairs. Inside this table, specify the appropriate __control&nbsp;parameters__ for the tween:

<div class="inner-table">

Control												Description
--------------------------------------------------	----------------------
`time`												Specifies the duration of the tween in milliseconds.
`delay`												Specifies the delay, in milliseconds, before the tween begins. Default is `0` (none).
`easing`											Specifies the [easing][api.library.easing] function used for the tween. See [Easing Functions](#easing) for details.
`speedScale`										Adjusts the relative speed scale for the tween. This must be a positive number greater than `0`. By default, the speed scale is `1` (normal&nbsp;speed). Values greater than `1` will increase the speed while values lower than `1` will decrease it.
`tag`												String value which allows you to categorize tweens and control them together.
`id`												Optional identification string to assign to the tween. This can be retrieved as `obj.id` from any of the tween event listener functions ([see below](#tween-events)).
`iterations`										The number of times (integer) that the tween should repeat. Use `0` or `-1` to make it repeat indefinitely.
`reflect`											For tweens with multiple iterations, specifies whether alternate iterations are reflected (played&nbsp;in&nbsp;reverse). Default is `false`.
`delta`												Specifies whether <nobr>non-control</nobr> parameters are interpreted as final ending values or as changes in value. The default is `false`.
`constantRate`&nbsp;+&nbsp;`constantRateProperty`	If used, these two parameters must be specified together. See the [documentation][plugin.animation.to#constantrate] for details.
--------------------------------------------------	----------------------

</div>

<a id="easing"></a>

### Easing Functions

By default, tweens occur at a consistent, linear rate of change from start to end. However, you may wish to use an easing effect to achieve a different result, for example, to make an object move quickly at the start and gradually slow down as it reaches its destination. This behavior can be achieved using an [easing][api.library.easing] function in conjunction with the animation call.

To set an easing effect on a tween, simply provide the `easing` key in the `params` table with a value equal to one of the [easing][api.library.easing] library functions. For&nbsp;example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[6]" }
-- Tween the object using outward quadratic interpolation
animation.to( myObject,
	{ y=100 },
	{
		time = 2000,
		easing = easing.outQuad
	}
)
``````

``````{ brush="lua" gutter="false" first-line="1" highlight="[6]" }
-- Tween the object using inward and then outward exponential interpolation
animation.to( myObject,
	{ y=100 },
	{
		time = 2000,
		easing = easing.inOutExpo
	}
)
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Although the 40+ <nobr>built-in</nobr> [easing][api.library.easing] functions will meet most developers' needs, it's possible to create custom easing functions and utilize them within tweens. See [Custom Easing Functions](#custom-easing) below for details.

</div>
</div>

<a id="tween-events"></a>

### Tween Events

Tweens also support a full range of __tween&nbsp;events__ as listed below. These should be specified as <nobr>key-value</nobr> pairs within the `params` table. When the event occurs, the associated listener function will receive a reference to the [Tween][plugin.animation.type.Tween] object.

<div class="inner-table">

Event					Parameter&nbsp;(Key)	Description&nbsp;(Value)
----------------------	----------------------	--------------------------
start					`onStart`				Listener function to be called before the tween begins.
complete				`onComplete`			Listener function to be called after the tween completes.
pause					`onPause`				Listener function to be called when the tween is paused.
resume					`onResume`				Listener function to be called when the tween is resumed.
cancel					`onCancel`				Listener function to be called when the tween is cancelled.
repeat					`onRepeat`				Listener function to be called when the tween completes an iteration in a repeat cycle.
position&nbsp;change	`onPositionChange`		Listener function to be called when the tween has its playback position changed manually via [object:setPosition()][plugin.animation.type.Tween.setPosition] or [animation.setPosition()][plugin.animation.setPosition].
----------------------	----------------------	--------------------------

</div>

In the following example, the `tweenListener()` function will be called when the tween completes:

``````{ brush="lua" first-line="1" highlight="[3,4,5,12]" }
local myObject = display.newRect( 0, 0, 100, 100 )

local function tweenListener( obj )
	print( "Tween completed; ID: " .. obj.id )
end

animation.to( myObject,
	{ alpha=0 },
	{
		time = 2000,
		id = "tween1",
		onComplete = tweenListener
	}
)
``````




<a id="timelines"></a>

## Timelines

A __timeline__ is a powerful way to construct intricate <nobr>multi-interpolation</nobr> animations across one or more display objects/groups. They are constructed with the [animation.newTimeline()][plugin.animation.newTimeline] command:

``````lua
animation.newTimeline( timelineParams )
``````

For this function, the `timelineParams` argument is a [table][api.type.Table] which specifies the tweens, markers, and other parameters for the timeline.

### Timeline Tweens

At the minimum, the `timelineParams` table must contain a child table, `tweens`, which contains all of the tweens that will be involved in the timeline:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3]" }
local newTimeline = animation.newTimeline(
{
	tweens = {},
})
``````

Inside the `tweens` table, individual tweens are configured via basic Lua tables that accept the following <nobr>key-value</nobr> pairs:

* `startTime` &mdash; Optional [number][api.type.Number] of milliseconds into the timeline progression at which the tween should start. Default is `0` (start&nbsp;of the&nbsp;timeline).
* `tween` &mdash; Required [table][api.type.Table] which configures the tween. This should be configured similarly to any basic tween <nobr>(see [Tweens](#tweens) above)</nobr>.
* `useFrom` &mdash; Optional [boolean][api.type.Boolean] property which, if set to `true`, will make the tween behave as if it were declared by [animation.from()][plugin.animation.from] instead of [animation.to()][plugin.animation.to].

For example, this `tweens` table configures two individual tweens for a timeline:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6]" }
local newTimeline = animation.newTimeline(
{
	tweens = {
		{ startTime=0, tween={ object1, { x=400 }, { time=4000, iterations=5, reflect=true } } },
		{ startTime=1000, tween={ object1, { y=400 }, { time=4000, easing=easing.outQuad } } }
	},
})
``````

### Timeline Markers

For an added level of control, you can specify any number of __markers__ within the timeline duration. These markers, specified within the optional `markers` table, allow you to specify <nobr>jump-to</nobr> points within the timeline. Each marker should be defined as a [table][api.type.Table] containing the following properties:

* `name` &mdash; A [string][api.type.String] name to associate with the marker. This name should be __unique__ (you&nbsp;should not use duplicate marker names within the same&nbsp;timeline).
* `time` &mdash; The [number][api.type.Number] of milliseconds into the timeline progression at which to set the marker.
* `params` &mdash; An optional [table][api.type.Table] which can contain custom information; this table will be passed to the `onMarkerPass` listener function \([details](#timeline-events)\).

For example, this `markers` table configures three time markers for the timeline:

``````{ brush="lua" gutter="false" first-line="1" highlight="[7,8,9,10,11]" }
local newTimeline = animation.newTimeline(
{
	tweens = {
		{ startTime=0, tween={ object1, { x=400 }, { time=4000, iterations=5, reflect=true } } },
		{ startTime=1000, tween={ object1, { y=400 }, { time=4000, easing=easing.outQuad } } }
	},
	markers = {
		{ name="marker_start", time=0 },    -- Start of the timeline
		{ name="marker_2000", time=2000 },  -- 2 seconds into the timeline
		{ name="marker_3000", time=3000 }   -- 3 seconds into the timeline
	},
})
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Once configured, you can use a marker name to jump to its associated position. See [object:setPosition()][plugin.animation.type.Timeline.setPosition] or [animation.setPosition()][plugin.animation.setPosition] for details.

</div>
</div>

### Other Parameters

Timelines accept a variety of additional parameters (optional) which can be used for <nobr>fine-tuned</nobr> setup and control. These should be specified as <nobr>key-value</nobr> pairs within the `timelineParams` table.

<div class="inner-table">

Parameter&nbsp;(Key)		Description
--------------------------	------------------------------
`autoPlay`					[Boolean][api.type.Boolean] value which, if&nbsp;`true`, makes the timeline play immediately. Default is `false`.
`tag`						[String][api.type.String] indicating the timeline tag. The animation plugin can pause, resume, cancel, set the position, or change the speed scale of timelines sharing the same tag.
`id`						Optional identification string to assign to the timeline. This can be retrieved as `obj.id` from any of the timeline event listener functions ([see below](#timeline-events)).
`delay`						[Number][api.type.Number] indicating the delay, in milliseconds, before the timeline begins playing. Default is `0`.
`speedScale`				Adjusts the relative speed scale for the timeline. This must be a positive [number][api.type.Number] greater than `0`. By default, the speed scale is `1` (normal&nbsp;speed). Values greater than `1` will increase the speed while values lower than `1` will decrease it.
`autoCancel`				[Boolean][api.type.Boolean] value which, if&nbsp;`true`, causes all child tweens to be cancelled upon completion of the timeline. This should only be done if you don't intend to replay the timeline again after its first play through. Default is `false`.
--------------------------	------------------------------	--------------------------

</div>

<a id="timeline-events"></a>

### Timeline Events

Timelines also support a full range of __timeline&nbsp;events__ as listed below. These should be specified as <nobr>key-value</nobr> pairs within the `timelineParams` table. When the event occurs, the associated listener function will receive a reference to the [Timeline][plugin.animation.type.Timeline] object.

<div class="inner-table">

Event					Parameter&nbsp;(Key)	Description&nbsp;(Value)
----------------------	----------------------	--------------------------
start					`onStart`				Listener function to be called directly before the timeline begins.
complete				`onComplete`			Listener function to be called after all tweens in the timeline complete __or__ after the final marker in the timeline, whichever occurs first.
pause					`onPause`				Listener function to be called when the timeline is paused.
resume					`onResume`				Listener function to be called when the timeline is resumed.
cancel					`onCancel`				Listener function to be called when the timeline is cancelled.
position&nbsp;change	`onPositionChange`		Listener function to be called when the timeline has its playback position changed manually via [object:setPosition()][plugin.animation.type.Timeline.setPosition] or [animation.setPosition()][plugin.animation.setPosition].
marker passed			`onMarkerPass`			Listener function to be called when a marker within the timeline is reached/passed. Instead of simply receiving a reference to the [Timeline][plugin.animation.type.Timeline] object, this function will receive a [table][api.type.Table] containing a reference to the associated [Timeline][plugin.animation.type.Timeline] object (`timeline`), along with the `name` property and optional `params` table that was assigned to the specific marker.
----------------------	----------------------	--------------------------

</div>

In the following example, the `timelineListener()` function will be called when every iteration of every tween in the timeline completes:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,15]" }
local object1 = display.newRect( 50, 50, 100, 100 )

local function timelineListener( obj )
	print( "Timeline completed; ID: " .. obj.id )
end

-- Create a timeline object
local newTimeline = animation.newTimeline(
{
	tweens = {
		{ startTime=0, tween={ object1, { x=400 }, { time=4000, iterations=5, reflect=true } } },
		{ startTime=1000, tween={ object1, { y=400 }, { time=4000, easing=easing.outQuad } } }
	},
	id = "timeline1",
	onComplete = timelineListener
})

-- Set the timeline playing
newTimeline:resume()
``````




<a id="control"></a>

## Controlling Tweens/Timelines

Tweens and timelines can be controlled through various methods. You can either use a __library&nbsp;command__ (through&nbsp;the [animation][plugin.animation]&nbsp;plugin) or an __object&nbsp;command__ on a [Tween][plugin.animation.type.Tween] object or [Timeline][plugin.animation.type.Timeline] object.

<div class="inner-table">

Control					Library&nbsp;Command												Object&nbsp;Commands
----------------------	------------------------------------------------------------------	--------------
pause					[animation.pause()][plugin.animation.pause]							[Tween:pause()][plugin.animation.type.Tween.pause] &nbsp;/&nbsp; [Timeline:pause()][plugin.animation.type.Timeline.pause]
resume					[animation.resume()][plugin.animation.resume]						[Tween:resume()][plugin.animation.type.Tween.resume] &nbsp;/&nbsp; [Timeline:resume()][plugin.animation.type.Timeline.resume]
cancel					[animation.cancel()][plugin.animation.cancel]						[Tween:cancel()][plugin.animation.type.Tween.cancel] &nbsp;/&nbsp; [Timeline:cancel()][plugin.animation.type.Timeline.cancel]
set position			[animation.setPosition()][plugin.animation.setPosition]				[Tween:setPosition()][plugin.animation.type.Tween.setPosition] &nbsp;/&nbsp; [Timeline:setPosition()][plugin.animation.type.Timeline.setPosition]
set speed scale			[animation.setSpeedScale()][plugin.animation.setSpeedScale]			[Tween:setSpeedScale()][plugin.animation.type.Tween.setSpeedScale]&nbsp;&nbsp;/&nbsp;&nbsp;[Timeline:setSpeedScale()][plugin.animation.type.Timeline.setSpeedScale]
----------------------	------------------------------------------------------------------	--------------

</div>

One benefit of the library commands is that, depending on the parameter passed, you can affect multiple tweens and/or timelines with just one call (here,&nbsp;`*` indicates either `pause`, `resume`, `cancel`, `setPosition`, or&nbsp;`setSpeedScale`).

<div class="inner-table">

Parameter																Syntax											Scope
----------------------------------------------------------------------	----------------------------------------------	--------------
(none)																	`animation.*()`									Affects all tweens/timelines.
tween&nbsp;reference ([Tween][plugin.animation.type.Tween])				`animation.*( tweenObject )`					Affects the specified referenced tween (`tweenObject`).
timeline&nbsp;reference ([Timeline][plugin.animation.type.Timeline])	`animation.*( timelineObject )`					Affects the specified referenced timeline (`timelineObject`).
tag name ([String][api.type.String])									`animation.*( "tagName" )`						Affects all tweens/timelines sharing the same tag name.
object reference ([DisplayObject][api.type.DisplayObject])				<nobr>`animation.*( DisplayObject )`</nobr>		Affects all tweens on the specified display object/group.
----------------------------------------------------------------------	----------------------------------------------	--------------

</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Any control method that targets a specific child tween within a [Timeline][plugin.animation.type.Timeline] is ignored. Timeline tweens are controlled by the parent timeline, so you should control the timeline itself. For instance, if a tween within a timeline is affecting an object named `object1`, you can __not__ pause that specific tween by calling <nobr>`animation.pause( object1 )` &mdash;</nobr> this is because the timeline owns all of its child tweens and it should be treated as a collective animated sequence.

</div>
</div>




<a id="status"></a>

## Tween/Timeline Status

If needed, you can get the __status__ of a specific tween or timeline via the following calls:

<div class="inner-table">

Status									Object&nbsp;Commands
--------------------------------------	--------------
paused/unpaused							[Tween:getIsPaused()][plugin.animation.type.Tween.getIsPaused] &nbsp;/&nbsp; [Timeline:getIsPaused()][plugin.animation.type.Timeline.getIsPaused]
current position						[Tween:getPosition()][plugin.animation.type.Tween.getPosition] &nbsp;/&nbsp; [Timeline:getPosition()][plugin.animation.type.Timeline.getPosition]
current speed scale						[Tween:getSpeedScale()][plugin.animation.type.Tween.getSpeedScale] &nbsp;/&nbsp; [Timeline:getSpeedScale()][plugin.animation.type.Timeline.getSpeedScale]
duration								[Tween:getDuration()][plugin.animation.type.Tween.getDuration] &nbsp;/&nbsp; [Timeline:getDuration()][plugin.animation.type.Timeline.getDuration]
--------------------------------------	--------------

</div>




<a id="custom-easing"></a>

## Custom Easing Functions

If the built-in [easing][api.library.easing] functions do not include a very specific interpolation pattern necessary for your project, it's possible to create custom easing functions and utilize them as the `easing` property for a tween.

Custom easing functions should follow the pattern of other easing functions, such as that for `easing.linear`:

``````lua
easing.linear = function( t, tMax, start, delta )
	return delta * t / tMax + start
end
``````

Essentially, as long as the custom easing function can accept the `t`, `tMax`, `start`, and `delta` properties, any number which is output at the other end is valid (although&nbsp;usually it should return a number <nobr>between `0` and `1`)</nobr>.

Once you've written your easing function, simply reference it as the `easing` parameter for the tween. For&nbsp;example:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,11]" }
local myObject = display.newRect( 0, 0, 100, 100 )

local function myLinearEasing( t, tMax, start, delta )
	return delta * t / tMax + start
end

animation.to( myObject,
	{ x=500 },
	{
		time = 2000,
		easing = myLinearEasing
	}
)
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Most easing functions are designed to return `0` when `t=0`, and `1` when `t=1`. However, this may not always be desirable. For instance, <nobr>out-and-back</nobr> easing functions such as `easing.continuousLoop` return `0` when `t=0` but also return `0` when `t=1`. In&nbsp;other words, the end value is the same as the start value. If your custom easing function is like this, you must set <nobr>`easingEndIsStart = true`</nobr> as a parameter for the tween or it will misbehave upon completion and repeated iterations. For&nbsp;instance:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6]" }
animation.to( myObject,
	{ x=500 },
	{
		time = 2000,
		easing = myContinuousEasing,
		easingEndIsStart = true
	}
)
``````

</div>
