
# display.actualContentWidth

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          actualContentWidth, content width
> __See also__          [display.actualContentHeight][api.library.display.actualContentHeight]
>						[display.safeActualContentWidth][api.library.display.safeActualContentWidth]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The width in Corona content units of the screen. The result depends on the `scale` setting in `config.lua`. See the [Project Configuration][guide.basics.configSettings] guide for more information.

* For `letterbox` scale, returns the content width, including the letterbox area.

* For `zoomEven` scale, returns a value matching the [display.viewableContentWidth][api.library.display.viewableContentWidth] property.

## Example
 
``````lua
print( display.actualContentWidth )
``````
