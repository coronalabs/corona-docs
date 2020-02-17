# json.prettify()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [json.*][api.library.json]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          json
> __See also__          [json.encode()][api.library.json.encode]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a string which is a human readable representation of the given object (or valid JSON string). The string is indented and the top-level keys are sorted into alphabetical order suitable for displaying on the console with `print()`.

## Syntax

	json.prettify( obj )

##### obj ~^(required)^~
_[String][api.type.String]._ Lua table or string containing JSON data.

## Examples

``````lua
local json = require "json"

local t = { ["item1"] = "value1", ["pi"] = 3.1415,
    ["name2"] = { 1, false, true, 23.54, "a \021 string" },
}

print( "t: " .. json.prettify( t ) )
--> t: {
-->   "item1":"value1",
-->   "name2":[1,false,true,23.54,"a \u0015 string"],
-->   "pi":3.1415
--> }

local line = display.newLine( 200, 90, 227, 165 )

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
-->   "rotation":0,
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
