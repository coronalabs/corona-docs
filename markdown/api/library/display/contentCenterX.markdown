
# display.contentCenterX

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Number][api.type.Number]
> __Library__			[display.*][api.library.display]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			contentWidth, content
> __See also__			[display.contentWidth][api.library.display.contentWidth]
>						[display.contentCenterY][api.library.display.contentCenterY]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The center of the content area along the __x__ axis. Equivalent to `display.contentWidth * 0.5`.

See the [Project Configuration][guide.basics.configSettings] guide for details on the content area.


## Example

``````lua
local obj = display.newImage( "image.png" )
obj.x = display.contentCenterX
obj.y = display.contentCenterY
``````
