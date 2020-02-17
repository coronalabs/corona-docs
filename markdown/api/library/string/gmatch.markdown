
# string.gmatch()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      pattern-finding iterator
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, match, patterns, gmatch
> __See also__          [string.find()][api.library.string.find]
>								[string.gsub()][api.library.string.gsub]
>								[string.match()][api.library.string.match]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a pattern-finding iterator. See [Lua String Manipulation][guide.data.luaString] for more information.


## Syntax

	string.gmatch( s, pattern )

	s:gmatch( pattern )

##### s ~^(required)^~
_[String][api.type.String]._ The string to be searched.

##### pattern ~^(required)^~
_[String][api.type.String]._ A string specifying the pattern to match. See [Lua String Manipulation][guide.data.luaString] for more information.


## Example

``````lua
-- Collect all key-value pairs from the given string into a table
t = {}
s = "from=world, to=Lua"
for k, v in string.gmatch( s, "(%w+)=(%w+)" ) do
	t[k] = v
end
``````