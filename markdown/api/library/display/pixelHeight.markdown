
# display.pixelHeight

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          pixelHeight
> __See also__          [api.library.display.pixelWidth]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The height of the screen for mobile device apps, or the height of the window for desktop apps. This value is in pixels and is always relative to portrait orientation.

## Gotchas

For historical reasons with context to mobile devices, this value is always reported from the perspective of a portait app and therefore may actually be the width of the physical screen.

## Example
 
``````lua
print( display.pixelHeight )
``````
