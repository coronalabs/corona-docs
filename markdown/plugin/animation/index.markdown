# animation.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          animation, tween, timeline, interpolation
> __Platforms__			Android, iOS, macOS, Windows, tvOS
> __See also__			[Animation &mdash; Tweens and Timelines][guide.media.animationLibrary] _(guide)_
>						[Tween][plugin.animation.type.Tween]
>						[Timeline][plugin.animation.type.Timeline]
> --------------------- ------------------------------------------------------------------------------------------

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

The animation plugin (tweens/timelines) is __not__ related to <nobr>frame-based</nobr> __sprite__ animation. If you are looking for details on how to animate sprite objects, please see the [Sprite Animation][guide.media.spriteAnimation] guide.

</div>
</div>


## Overview

The animation plugin provides functions and methods to move, rotate, fade, or scale a display object/group over a specific period of time. It also lets you construct [timelines][plugin.animation.type.Timeline] for more intricate sequenced animations across one or more display objects/groups. Features include:

* Ability to move, rotate, fade, or scale a display object/group over a specific period of time.

* Ability to construct and control [timelines][plugin.animation.type.Timeline] for intricate <nobr>multi-interpolation</nobr> animations.

* Over 40 [easing][api.library.easing] methods. These allow you to adjust the interpolation using methods such as quadratic, exponential, elastic, bounce, etc.

* Programmatically move/set the playback position within a tween or timeline.

* Programmatically adjust the playback speed scale of any tween or timeline.

* Repeat (iterate) a tween any number of times (or&nbsp;indefinitely) with the option to reflect alternating iterations in reverse.

* Ability to interpolate multiple objects at a constant rate, even if they don't share the same initial/final position, rotation, alpha, or scale.

* Multiple event triggers to detect when a tween/timeline starts, completes, pauses, resumes, etc.

* Ability to tag multiple tweens/timelines by name and then pause, resume, or cancel all of them with one command.

* Ability to pause, resume, or cancel all tweens on an <nobr>object-wide</nobr> basis.


## Functions

#### [animation.to()][plugin.animation.to]

#### [animation.from()][plugin.animation.from]

#### [animation.pause()][plugin.animation.pause]

#### [animation.resume()][plugin.animation.resume]

#### [animation.cancel()][plugin.animation.cancel]

#### [animation.newTimeline()][plugin.animation.newTimeline]

#### [animation.setPosition()][plugin.animation.setPosition]

#### [animation.setSpeedScale()][plugin.animation.setSpeedScale]

#### [animation.getAnimations()][plugin.animation.getAnimations]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.animation"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

## Source

* [View on GitHub](https://github.com/coronalabs/framework-animation)

If you want to add, modify or extend functionality, download the source code from GitHub and include in your project(See [Using External Modules][tutorial.basics.externalModules]).

