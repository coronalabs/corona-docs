# pairs()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      (varies)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table, ipairs, pairs, next, iteration, loops
> __See also__          [ipairs()][api.library.global.ipairs]
>								[next()][api.library.global.next]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns three values: the next [function][api.type.Function], a [table][api.type.Table], or `nil`. So, the following construction will iterate over all key-value pairs of [table][api.type.Table] `t`.

``````lua
for k,v in pairs( t ) do

end
``````

See function [next()][api.library.global.next] for the caveats of modifying the table during its traversal.


## Syntax

	pairs( t )

##### t ~^(required)^~
_[Table][api.type.Table]._ The table you want to iterate over for the key-value pairs.


## Example

`````lua
local keyTable = { apple="red", banana="yellow", lime="green", grape="purple" }

for k,v in pairs( keyTable ) do
	print( "KEY: "..k.." | ".."VALUE: "..v )
end

--> KEY: apple | VALUE: red
--> KEY: grape | VALUE: purple
--> KEY: lime | VALUE: green
--> KEY: banana | VALUE: yellow
`````