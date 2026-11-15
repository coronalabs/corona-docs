
# fold

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          fold, foldable, hinge, posture
> __See also__          [display.getReservedRegions()][api.library.display.getReservedRegions]
>                       [system.getInfo()][api.library.system.getInfo]
>                       [system.hasEventSource()][api.library.system.hasEventSource]
>                       [resize][api.event.resize]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A fold event occurs when a foldable device's hinge changes state, for example when it is opened flat, half opened into a "tabletop" or "book" posture, or closed.

Fold event listeners can only be set up via the [Runtime][api.type.Runtime] object. Soon after you add a listener, an event reports the device's current state.

Folding or unfolding a device usually changes the size of the app's view too. Use the [resize][api.event.resize] event to <nobr>re-layout</nobr> your content, and use the fold event to react to the posture itself, such as moving controls to the lower half when the device is half open.

## Platform Support

* __iOS / iPadOS__ &mdash; iOS&nbsp;27.1 or later, on devices with a hinge.

* __Android__ &mdash; Android&nbsp;6.0 or later. Set `supportsFoldables = true` in the `android` table of `build.settings` (see&nbsp;[Advanced Build Settings][guide.distribution.advancedSettings#foldables]).

* __Simulator__ &mdash; Use a foldable skin such as __Pixel&nbsp;10&nbsp;Pro&nbsp;Fold__ or __iPhone&nbsp;Duo__, then choose __Hardware&nbsp;&gt;&nbsp;Unfold__ to switch between the folded and unfolded states.

Use <nobr>`system.hasEventSource( "fold" )`</nobr> ([reference][api.library.system.hasEventSource]) to check whether the current device and build can send fold events.

## Properties

#### [event.angle][api.event.fold.angle]

#### [event.bounds][api.event.fold.bounds]

#### [event.name][api.event.fold.name]

#### [event.orientation][api.event.fold.orientation]

#### [event.state][api.event.fold.state]

## Example

``````lua
local function onFold( event )
	print( "Fold state: " .. event.state )

	if ( event.state == "halfOpen" and event.orientation == "horizontal" and event.bounds ) then
		-- Tabletop posture: keep content above the hinge, controls below it
		local hingeY = event.bounds.y + event.bounds.height
		print( "Hinge ends at y = " .. hingeY )
	end
end

if system.hasEventSource( "fold" ) then
	Runtime:addEventListener( "fold", onFold )
end
``````
