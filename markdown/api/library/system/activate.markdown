# system.activate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          multitouch
> __See also__          [system.deactivate()][api.library.system.deactivate]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Activates a system-level feature such as `"multitouch"`. Similarly, you can use [system.deactivate()][api.library.system.deactivate] to disable a feature.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Multitouch is disabled by default, so you must always initially activate it via this method.

</div>
</div>


## Syntax

	system.activate( feature )

##### feature ~^(required)^~
_[String][api.type.String]._ The system feature to be activated. Currently, the only supported values include:

* `"multitouch"` &mdash; See the [Tap/Touch/Multitouch][guide.events.touchMultitouch] guide for more information.
* `"controllerUserInteraction"` &mdash; See the [Apple TV / tvOS][guide.distribution.tvos] guide for more information.


## Example

``````lua
-- The following sample activates multitouch and creates a touch listener for a graphic
-- This displays the location, phase, and touch ID of each touch event

system.activate( "multitouch" )
 
local bg = display.newRect( 0, 0, 320, 480 )
local output = native.newTextBox( 0, 20, 320, 240 )
output.size = 12
 
local function showTouch( event )
	-- Display the event info on the screen
	output.text = output.text .. "\nPhase: " .. event.phase
	output.text = output.text .. "\n(" .. event.x .. "," .. event.y .. ")"
	output.text = output.text .. "\nId: " .. tostring( event.id )
end
 
bg:addEventListener( "touch", showTouch )
``````
