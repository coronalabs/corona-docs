
# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [relativeTouch][api.event.relativeTouch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, relativeTouch, phase
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string identifying where in the relative touch sequence the event occurred. Can be one of the following values:

* `"began"` — indicates that a relative touch has started on the device.
* `"moved"` — indicates that a relative touch has moved on the device.
* `"ended"` — indicates that a relative touch has been lifted from the device.
* `"cancelled"` — indicates that the __system__ cancelled tracking of the relative touch (not to be confused with `"ended"`).


## Example
 
``````lua
local phaseText = display.newText( "", display.contentCenterX, display.contentCenterY )

local function updateText( event )
	phaseText.text = event.phase
end
Runtime:addEventListener( "relativeTouch", updateText )
``````
