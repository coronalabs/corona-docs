
# display.setDrawMode()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          wireframe
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the draw mode.

## Syntax

	display.setDrawMode( key, value )

##### key ~^(required)^~
_[String][api.type.String]._ Specifies the type of draw mode. See [Keys](#keys) below.


<a id="keys"></a>

## Keys

The `key` corresponds to the draw mode. The following mode keys are supported:

* `"default"` — Sets or reverts to the default draw mode.

* `"wireframe"` — Turns on wireframe mode. Pass `true` to `value` to turn this mode on, or `false` to restore normal rendering.

* `"forceRender"` __(deprecated)__ — It is no longer necessary to force Corona to redraw the scene every frame when using certain <nobr>time-based</nobr> shader effects like `"wobble"`. Corona can now automatically detect whether a shader that's <nobr>time-based</nobr> is present and redraw the scene. As such, you should __remove__ any calls that use the `"forceRender"` key, because when explicitly enabled, it overrides Corona's automatic detection.


## Examples

##### wireframe

``````lua
-- Turns on wireframe
display.setDrawMode( "wireframe", true )

-- Turns off wireframe
display.setDrawMode( "wireframe", false )
``````
