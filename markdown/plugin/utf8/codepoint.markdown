# utf8.codepoint()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, codepoint
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the code points (as&nbsp;integers) from all characters in a string that start between two byte positions (both&nbsp;included).

The default for `end` is the number of characters in the string. This function raises an error if it finds an invalid byte sequence.


## Syntax

	utf8.codepoint( s [, start [, end]] )

##### s ~^(required)^~
_[String][api.type.String]._ The string to examine.

##### start ~^(optional)^~
_[Number][api.type.Number]._ Starting position. Default is `1`.

##### end ~^(optional)^~
_[Number][api.type.Number]._ Ending position. Default is the number of characters in the string.


## Example

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = "♡ 你好，世界 ♡"

print( utf8.codepoint( testStr, 1, 5 ) )  --> 9825  32  20320
``````
