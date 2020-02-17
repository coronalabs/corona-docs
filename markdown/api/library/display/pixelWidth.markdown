
# display.pixelWidth

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          pixelWidth
> __See also__          [api.library.display.pixelHeight]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The width of the screen for mobile device apps, or the width of the window for desktop apps. This value is in pixels and is always relative to portrait orientation.

## Gotchas

For historical reasons with context to mobile devices, this value is always reported from the perspective of a portait app and therefore may actually be the height of the physical screen.

## Example
 
``````lua
print( display.pixelWidth )
``````
