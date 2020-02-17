
# display.contentScaleY

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          contentHeight, scale, scaling
> __See also__          [display.contentScaleX][api.library.display.contentScaleX]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The ratio between content pixel and screen pixel height.

This value will always be `1` unless your project's `config.lua` file specifies your content's height and width. Different scale modes like `"letterbox"` and `"zoomEven"` will result in different scale factors.

See the [Project Configuration][guide.basics.configSettings] guide for details on the content area.