# ipairs()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      (varies)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          pairs, tables, next, loops, iteration
> __See also__          [pairs()][api.library.global.pairs]
>								[next()][api.library.global.next]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function returns three values: an iteration [Function][api.type.Function], a [Table][api.type.Table], and `0`. For example, the following construction will iterate over the pairs `(1,t[1])`, `(2,t[2])`, `...`, up to the first integer key absent from the table.

``````lua
for i,v in ipairs( t ) do
	--code
end
``````


## Syntax

	ipairs( t )

##### t ~^(required)^~
_[Table][api.type.Table]._ The table that is to be iterated.


## Example

`````lua
local t = { "every", "word", "is", "on", "a", "separate", "line." }
for i,v in ipairs(t) do
   print( v )  -- print each array element on a separate line
end
`````
