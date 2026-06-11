# json.encode()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [json.*][api.library.json]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          json
> __See also__              [json.decode()][api.library.json.decode]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the Lua object (table) as a JSON-encoded string. Since items with `nil` values in a Lua table effectively don't exist, you should use `json.null` as a placeholder value if you need to preserve array indices in your JSON (see discussion of `nullval` in [json.decode()][api.library.json.decode]).


## Syntax

	json.encode( t [, options] )

##### t ~^(required)^~
_[Table][api.type.Table]._ Lua table.

##### options ~^(optional)^~
_[Table][api.type.Table]._ Lua table containing optional directives to the JSON library:

 * `indent` &mdash; set to `true` to produce formatted JSON output.
 * `exception` &mdash; function called to handle unsupported datatypes. Parameters are `reason`, `value`, `state` and `defaultmessage`. Return a string to be included in the output or `nil` to raise an error. By default, Corona handles unsupported values as strings.

## Conversion

1. Encodable Lua types include [String][api.type.String], [Number][api.type.Number], [Boolean][api.type.Boolean], [Table][api.type.Table], or `nil`.
2. Unencodable types are noted as a descriptive string in the output.
3. All control chars are encoded to `\uXXXX` format, for example `"\021"` encodes to `"\u0015"`.
4. All JSON `\uXXXX` chars are decoded to chars (`0`-`255` byte range only).
5. JSON single line `//` and `/* */` block comments are discarded during decoding.
6. A Lua table is encoded to a JSON array when all of its keys are positive integers (gaps are permitted), for example `[1,2,3]`. The presence of any key that isn't a positive integer forces the entire table to be encoded as a JSON object instead.
7. Lua dictionary tables are converted to JSON objects, for example `{"one":1,"two":2}`.
8. By default, JSON nulls are decoded to Lua `nil` and treated by Lua in the normal way (for example, they appear not to exist &mdash; see [json.decode()][api.library.json.decode]).


## Gotchas

JSON has two collection types, arrays (`[]`) and objects (`{}`), but Lua has only the table, so `json.encode()` has to pick one. A table is encoded as an array when all of its keys are positive integers (gaps are permitted), and as an object the moment any non-integer key is present.

Because JSON object keys are always strings, every key in an object-encoded table is stringified, integer keys included. Adding a single key that isn't a positive integer therefore changes how the entire table is encoded, including its positive-integer keys:

``````lua
local json = require( "json" )

local t1 = {
	[1] = 1,
	[2] = 2,
	[3] = 3,
}
print( json.encode( t1 ) )  --> [1,2,3]

local t2 = {
	[1] = 1,
	[2] = 2,
	[3] = 3,
	["a"] = "a",
}
print( json.encode( t2 ) )  --> {"1":1,"2":2,"a":"a","3":3}
``````

Two consequences follow:

1. __Round-tripping does not preserve integer keys.__ `json.decode( json.encode( t2 ) )` returns a table keyed by the strings `"1"`, `"2"`, `"3"`, not the integers `1`, `2`, `3`. Code that later indexes with `t[1]` will get `nil`.
2. __Key order in an object is not guaranteed.__ Do not rely on the position of keys in the encoded string.


## Examples

##### General

``````lua
local json = require( "json" )

local t = {
    ["name1"] = "value1",
    ["name2"] = { 1, false, true, 23.54, "a \021 string" },
    name3 = json.null
}

local encoded = json.encode( t )
print( encoded )  --> {"name1":"value1","name3":null,"name2":[1,false,true,23.54,"a \u0015 string"]}

local encoded = json.encode( t, { indent=true } )
print( encoded )
--> {
-->   "name1":"value1",
-->   "name3":null,
-->   "name2":[1,false,true,23.54,"a \u0015 string"]
--> }

-- Since this was just encoded using the same library it's unlikely to fail
-- However, it's good practice to handle errors anyway
local decoded, pos, msg = json.decode( encoded )
if not decoded then
    print( "Decode failed at " .. tostring(pos) .. ": " .. tostring(msg) )
else
    print( decoded.name2[4] )  --> 23.54
end
``````

##### Console Debugging

``````lua
local json = require( "json" )

local function onTapLogo( event )
	print( "onTapLogo: event: " .. json.encode( event, { indent=true } ) )
end

local logo = display.newImageRect( "logo.png", 128, 128 )
logo.x = display.contentCenterX
logo.y = display.contentCenterY
logo:addEventListener( "tap", onTapLogo )
``````

##### Debug Result

``````json
onTapLogo: event: {
    "y":175,
    "x":198,
    "time":2720.303,
    "target":{
        "_dispatchingEventName":"tap",
        "_class":{
            "removeEventListener":"<type 'function' is not supported by JSON.>",
            "addEventListener":"<type 'function' is not supported by JSON.>",
            "__index":"<reference cycle>"
        },
        "_proxy":"<type 'userdata' is not supported by JSON.>",
        "_functionListeners":{
            "tap":["<type 'function' is not supported by JSON.>"]
        }
    },
    "numTaps":1,
    "name":"tap"
}
``````
