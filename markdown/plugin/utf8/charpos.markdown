# utf8.charpos()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, charpos
> __See also__			[utf8.codepoint()][plugin.utf8.codepoint]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Converts UTF-8 position to byte offset depending on usage:

* If only `offset` is specified, returns the byte offset of this <nobr>UTF-8</nobr> character index, for example the offset from the beginning of the string.

* If `charpos` and `offset` are specified, a new `charpos` will be calculated by adding or subtracting the <nobr>UTF-8</nobr> character offset to/from the current `charpos`.

In both cases, this function returns a new character position and code point ([number][api.type.Number]) at this position.


## Syntax

	utf8.charpos( s, [charpos,] offset )

##### s ~^(required)^~
_[String][api.type.String]._ Any string.

##### charpos ~^(optional)^~
_[Number][api.type.Number]._ The character position in the <nobr>UTF-8</nobr> string.

##### offset ~^(required)^~
_[Number][api.type.Number]._ The character offset.


## Example

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = "♡ 你好，世界 ♡"

print( utf8.sub( testStr, 3, 3 ) )  --> 你

print( utf8.charpos( testStr, 3 ) )  --> 5  20320
``````
