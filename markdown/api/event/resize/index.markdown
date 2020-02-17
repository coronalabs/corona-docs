
# resize

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          resize
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A resize event occurs when the width or height of the app's view has been changed. This event should be used to <nobr>re-layout</nobr> an app's contents to fit its new bounds.

The following situations can trigger a resize event:

* The app's orientation has changed from portrait to landscape or vice-versa, typically causing the content width and height to be swapped. This only occurs for apps that support both portrait and landscape orientations.

* Showing or hiding the status bar on some Android tablets running Android OS 3.0 or higher, such as the Kindle&nbsp;Fire&nbsp;HD. This can cause the height of the app's view to be decreased or increased in size.

Resize event listeners can only be set up via the [Runtime][api.type.Runtime] object.

## Properties

#### [event.name][api.event.resize.name]

## Example
 
``````lua
-- Called when the app's view has been resized
local function onResize( event )
	-- re-layout the app's contents here
end

-- Add the "resize" event listener
Runtime:addEventListener( "resize", onResize )
``````
