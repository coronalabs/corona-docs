# json.decode()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [json.*][api.library.json]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          json
> __See also__			[json.encode()][api.library.json.encode]
>						[json.decodeFile()][api.library.json.decodeFile]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Decodes the JSON-encoded data structure and returns a Lua object ([table][api.type.Table]) with the data. The return value is a Lua object when the data is successfully decoded or, in the case of an error, three values: `nil`, the position of the next character that doesn't belong to the object, and an error message.

## Syntax

	json.decode( data [, position [, nullval]] )

##### data ~^(required)^~
_[String][api.type.String]._ String containing JSON data.

##### position ~^(optional)^~
_[Number][api.type.Number]._ Index within `data` to start decoding (default is `1` if omitted).

##### nullval ~^(optional)^~
Value to be returned for items with a value of `json.null` (see [json.encode()][api.library.json.encode]). This is useful if your data contains items which are "null" but you need to know of their existence (in Lua, table items with values of `nil` don't normally exist).

## Examples

``````lua
local json = require( "json" )

local t = {
    ["name1"] = "value1",
    ["name2"] = { 1, false, true, 23.54, "a \021 string" },
    name3 = json.null
}

local encoded = json.encode( t )
print( encoded )
--> {"name1":"value1","name3":null,"name2":[1,false,true,23.54,"a \u0015 string"]}

local encoded = json.encode( t, { indent = true } )
print( encoded )
--> {
--> "name1":"value1",
--> "name3":null,
--> "name2":[1,false,true,23.54,"a \u0015 string"]
--> }

-- Since this was just encoded using the same library, it's unlikely to fail, but it's good practice to handle errors anyway
local decoded, pos, msg = json.decode( encoded )
if not decoded then
	print( "Decode failed at "..tostring(pos)..": "..tostring(msg) )
else
    print( decoded.name2[4] )  --> 23.54
end
``````
