# utf8.insert()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, insert
> __See also__			[utf8.remove()][plugin.utf8.remove]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Inserts a substring into `s`. If `idx` is specified, inserts `substring` before the character at this index; otherwise `substring` will concatenated onto `s`. Note that `idx` can be negative.


## Syntax

	utf8.insert( s, [idx,] substring )

##### s ~^(required)^~
_[String][api.type.String]._ The source string.

##### idx ~^(optional)^~
_[Number][api.type.Number]._ The position at which to insert the substring.

##### substring ~^(required)^~
_[String][api.type.String]._ The substring to insert.


## Example

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = "♡ 你好，世界 ♡"

print( utf8.insert( testStr, 3, "UTF-8 " ) )  --> ♡ UTF-8 你好，世界 ♡
``````
