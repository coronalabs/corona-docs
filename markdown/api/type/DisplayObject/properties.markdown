# object.\_properties

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          introspection, properties
> __See also__          [object._defined][api.type.DisplayObject.defined]
>						[object._lastChange][api.type.DisplayObject.lastChange]
>						[json.prettify()][api.library.json.prettify]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Read-only property that provides a view into all of the object's property values.

For further introspection options, see [object._defined][api.type.DisplayObject.defined] and [object._lastChange][api.type.DisplayObject.lastChange].

## Example

``````lua
local json = require( "json" )

local line = display.newLine( 200, 90, 227, 165 )
line.rotation = 45

print("line._properties: " .. json.prettify( line._properties ) )
--> line._properties: {
-->   "alpha":1,
-->   "anchorSegments":"false",
-->   "anchorX":0.5,
-->   "anchorY":0.5,
-->   "blendMode":"normal",
-->   "contentBounds":{
-->     "xMin":198,
-->     "xMax":229,
-->     "yMax":167,
-->     "yMin":88
-->   },
-->   "contentHeight":79,
-->   "contentWidth":31,
-->   "height":79,
-->   "isHitTestMasked":"false",
-->   "isHitTestable":"false",
-->   "isVisible":"true",
-->   "maskRotation":0,
-->   "maskScaleX":0,
-->   "maskScaleY":0,
-->   "maskX":0,
-->   "maskY":0,
-->   "rotation":45,
-->   "stroke":{
-->     "blendMode":"normal",
-->     "a":1,
-->     "r":1,
-->     "blendEquation":"add",
-->     "effect":"nil",
-->     "g":1,
-->     "b":1
-->   },
-->   "strokeWidth":1,
-->   "width":31,
-->   "x":200,
-->   "xScale":1,
-->   "y":90,
-->   "yScale":1
--> }
``````