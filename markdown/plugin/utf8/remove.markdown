# utf8.remove()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, remove
> __See also__			[utf8.insert()][plugin.utf8.insert]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Deletes a substring from a <nobr>UTF-8</nobr> string depending on usage:

* If `end` is not specified, this function deletes characters from `start` until the end of the string (`s`).

* If `end` is specified, this function deletes characters from `start` to `end`, inclusive of both.

Note that `start` and `end` can be negative if you need to count from the end of the string.


## Syntax

	utf8.remove( s, start [, end] )

##### s ~^(required)^~
_[String][api.type.String]._ The string to operate on.

##### start ~^(required)^~
_[Number][api.type.Number]._ The starting position.

##### end ~^(optional)^~
_[Number][api.type.Number]._ Ending position. Default is the number of characters in the string.


## Example

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = "♡ 你好，世界 ♡"
print( utf8.remove( testStr, 5, 7 ) )  --> ♡ 你好 ♡
``````
