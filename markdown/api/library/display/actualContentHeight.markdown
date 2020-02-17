
# display.actualContentHeight

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          actualContentHeight, content height
> __See also__          [display.actualContentWidth][api.library.display.actualContentWidth]
>						[display.safeActualContentHeight][api.library.display.safeActualContentHeight]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The height in Corona content units of the screen. The result depends on the `scale` setting in `config.lua`. See the [Project Configuration][guide.basics.configSettings] guide for more information.

* For `letterbox` scale, returns the content height, including the letterbox area.

* For `zoomEven` scale, returns a value matching the [display.viewableContentHeight][api.library.display.viewableContentHeight] property.


## Example
 
``````lua
print( display.actualContentHeight )
``````
