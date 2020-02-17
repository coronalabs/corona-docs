# json.decodeFile()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [json.*][api.library.json]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          json
> __See also__			[json.decode()][api.library.json.decode]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Decodes the contents of a file that is expected to contain <nobr>JSON-encoded</nobr> data and returns a Lua object ([table][api.type.Table]) with the appropriate data. The return value is a Lua object when the data is successfully decoded or, in the case of an error, three values: `nil`, the position of the next character that doesn't belong to the object, and an error message. Errors can either relate to issues opening the file or to JSON syntax issues.

## Gotchas

The `filename` parameter should usually be obtained from `system.pathForFile()` so it can be correctly located in the application's sandbox.  See the *Example* below.

## Syntax

	json.decodeFile( filename [, position [, nullval]] )

##### filename ~^(required)^~
_[String][api.type.String]._ String containing the name of a file containing JSON data.

##### position ~^(optional)^~
_[Number][api.type.Number]._ Index within file to start decoding (default is `1` if omitted).

##### nullval ~^(optional)^~
Value to be returned for items with a value of `json.null` <nobr>(see [json.encode()][api.library.json.encode])</nobr>. This is useful if your data contains items which are "null" but you need to know of their existence (in&nbsp;Lua,&nbsp;table items with values of `nil` don't normally&nbsp;exist).

## Example

``````lua
local json = require( "json" )

local filename = system.pathForFile( "datafile.json", system.ResourceDirectory )
local decoded, pos, msg = json.decodeFile( filename )

if not decoded then
	print( "Decode failed at "..tostring(pos)..": "..tostring(msg) )
else
	print( "File successfully decoded!" )
end
``````
