
# display.contentCenterY

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Number][api.type.Number]
> __Library__			[display.*][api.library.display]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			contentHeight, content
> __See also__			[display.contentHeight][api.library.display.contentHeight]
>						[display.contentCenterX][api.library.display.contentCenterX]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The center of the content area along the __y__ axis. Equivalent to `display.contentHeight * 0.5`.

See the [Project Configuration][guide.basics.configSettings] guide for details on the content area.


## Example

``````lua
local obj = display.newImage( "image.png" )
obj.x = display.contentCenterX
obj.y = display.contentCenterY
``````
