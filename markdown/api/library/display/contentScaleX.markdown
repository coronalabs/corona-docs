
# display.contentScaleX

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          contentWidth, scale, scaling
> __See also__          [display.contentScaleY][api.library.display.contentScaleY]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The ratio between content pixel and screen pixel width.

This value will always be `1` unless your project's `config.lua` file specifies your content's height and width. Different scale modes like `"letterbox"` and `"zoomEven"` will result in different scale factors.

See the [Project Configuration][guide.basics.configSettings] guide for details on the content area.