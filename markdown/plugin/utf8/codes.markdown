# utf8.codes()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      iterator
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, codes
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns values so that the following construction will iterate over all characters in string `s`, where `charpos` is the position (in&nbsp;bytes) of each character and `codepoint` is the code point.

``````lua
for charpos, codepoint in utf8.codes( s ) do
	--
end
``````

This function raises an error if it finds an invalid byte sequence.


## Syntax

	utf8.codes( s )

##### s ~^(required)^~
_[String][api.type.String]._ The string to examine.


## Example

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = "♡ 你好，世界 ♡"

for charpos, codepoint in utf8.codes( testStr ) do
	print( charpos, codepoint )
end

--> 1   9825
--> 4   32
--> 5   20320
--> 8   22909
--> 11  65292
--> 14  19990
--> 17  30028
--> 20  32
--> 21  9825
``````
