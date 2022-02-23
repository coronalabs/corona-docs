# animation.newTimeline()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Timeline][plugin.animation.type.Timeline]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, timeline, interpolation, newTimeline
> __See also__			[Animation &mdash; Tweens and Timelines][guide.media.animationLibrary] _(guide)_
>						[Tween][plugin.animation.type.Tween]
>						[Timeline][plugin.animation.type.Timeline]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a new [Timeline][plugin.animation.type.Timeline] object. This can contain multiple sequential and/or overlapping tweens, each performing unique tweens on one or multiple objects. Additionally, you can set time markers anywhere across the span of the timeline as <nobr>jump-to</nobr> points.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

By default, timelines begin in a paused state. Thus, your options are:

* Play the timeline immediately by setting the `autoPlay` parameter to `true`. In this case, and only for this initial play event, any timeline `onResume` listener function which you may have specified will __not__ be triggered.

* Start it playing by calling [object:resume()][plugin.animation.type.Timeline.resume] on the [Timeline][plugin.animation.type.Timeline] object, or by calling [animation.resume()][plugin.animation.resume] with a reference to the [Timeline][plugin.animation.type.Timeline] object. Note that doing so will trigger the timeline's `onResume` listener function, if you've specified one.

</div>


## Syntax

	animation.newTimeline( timelineParams )

##### timelineParams ~^(required)^~
_[Table][api.type.Table]._ A table which specifies the child tweens, markers, and other parameters for the timeline&nbsp;&mdash; see the next section for details.


## Parameter Reference

##### tweens ~^(required)^~
_[Table][api.type.Table]._ A table containing child tables, each specifying a tween to be included in the timeline. Each of these tables accept the following <nobr>key-value</nobr> pairs:

* `startTime` &mdash; Optional [number][api.type.Number] of milliseconds into the timeline progression at which the tween should start. Default is `0` (start&nbsp;of the&nbsp;timeline).
* `tween` &mdash; Required [table][api.type.Table] which configures the tween. This tween should be configured similarly to [animation.to()][plugin.animation.to#syntax], containing the target object to animate along with properties and parameters.
* `useFrom` &mdash; Optional [boolean][api.type.Boolean] property which, if set to `true`, will make the tween behave as if it were declared by [animation.from()][plugin.animation.from].

For example, the following `tweens` table configures two individual tweens for a timeline:

``````lua
	tweens = {
		{ startTime=0, tween={ object1, { x=400 }, { time=4000, iterations=5, reflect=true } } },
		{ startTime=1000, tween={ object1, { y=400 }, { time=4000, easing=easing.outQuad } } }
	}
``````

##### markers ~^(optional)^~
_[Table][api.type.Table]._ An optional table of time markers to associate with the timeline. These markers allow you to specify named <nobr>jump-to</nobr> points within the timeline. Each should be defined as a [table][api.type.Table] which may contain the following properties:

* `name` &mdash; A [string][api.type.String] name to associate with the marker. This name can be used to reference the marker in other commands such as [object:setPosition()][plugin.animation.type.Timeline.setPosition] and [animation.setPosition()][plugin.animation.setPosition]. This name should be __unique__ (you&nbsp;should not use duplicate marker names within the same&nbsp;timeline).
* `time` &mdash; The [number][api.type.Number] of milliseconds into the timeline progression at which to set the marker.
* `params` &mdash; An optional [table][api.type.Table] which can contain custom information; this table will be passed to the `onMarkerPass` listener function \([details](#onMarkerPass)\).

For example, this `markers` table configures three time markers for a timeline:

``````lua
	markers = {
		{ name="marker_start", time=0 },    -- Start of the timeline
		{ name="marker_2000", time=2000 },  -- 2 seconds into the timeline
		{ name="marker_3000", time=3000 }   -- 3 seconds into the timeline
	}
``````

##### autoPlay ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the timeline will begin playing immediately. Default is `false`.

##### tag ~^(optional)^~
_[String][api.type.String]._ Specifies the timeline tag. The animation library can pause, resume, cancel, set the position, or change the speed scale of timelines sharing the same tag.

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification string to assign to the timeline. This can be retrieved as `obj.id` from any of the timeline event listener functions (see&nbsp;below).

##### delay ~^(optional)^~
_[Number][api.type.Number]._ Specifies the delay, in milliseconds, before the timeline begins playing. Default is `0`.

##### speedScale ~^(optional)^~
_[Number][api.type.Number]._ Adjusts the relative speed scale for the timeline. This must be a positive number greater than `0`. By default, the speed scale is `1` (normal&nbsp;speed). Values greater than `1` will increase the speed while values lower than `1` will decrease it.

##### autoCancel ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, all child tweens (and&nbsp;the timeline&nbsp;itself) will be cancelled upon completion of the timeline. This should only be done if you don't intend to replay the timeline again after its first play through. Default is `false`.

<a id="timeline-events"></a>

##### onStart ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called directly before the timeline begins. This function will receive a reference to the associated [Timeline][plugin.animation.type.Timeline] object as its sole argument.

##### onComplete ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called after the timeline completes. This function will receive a reference to the associated [Timeline][plugin.animation.type.Timeline] object as its sole argument.

##### onPause ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the timeline is paused. This function will receive a reference to the associated [Timeline][plugin.animation.type.Timeline] object as its sole argument.

##### onResume ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the timeline is resumed. This function will receive a reference to the associated [Timeline][plugin.animation.type.Timeline] object as its sole argument.

##### onCancel ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the timeline is cancelled. This function will receive a reference to the associated [Timeline][plugin.animation.type.Timeline] object as its sole argument.

##### onPositionChange ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when the timeline has its playback position changed manually via [object:setPosition()][plugin.animation.type.Timeline.setPosition] or [animation.setPosition()][plugin.animation.setPosition]. This function will receive a reference to the associated [Timeline][plugin.animation.type.Timeline] object as its sole argument.

<a id="onMarkerPass"></a>

##### onMarkerPass ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function to be called when a marker within the timeline is reached/passed. This function will receive a [table][api.type.Table] containing a reference to the associated [Timeline][plugin.animation.type.Timeline] object (`timeline`), along with the `name` property and optional `params` table that was assigned to the specific marker.


## Example

``````lua
local object1 = display.newRect( 50, 50, 100, 100 )

local function timelineListener( obj )
	print( "Timeline completed; ID: " .. obj.id )
end

-- Create a timeline object
local timelineParams = {
	tweens = {
		{ startTime=0, tween={ object1, { x=400 }, { time=4000, iterations=5, reflect=true } } },
		{ startTime=1000, tween={ object1, { y=400 }, { time=4000, easing=easing.outQuad } } }
	},
	markers = {
		{ name="marker_start", time=0 },
		{ name="marker_2000", time=2000 }
	},
	id = "timeline1",
	onComplete = timelineListener
}
local newTimeline = animation.newTimeline( timelineParams )

-- Set the timeline playing
newTimeline:resume()
``````
