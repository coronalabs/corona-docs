# utf8.next()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      [Numbers][api.type.Number] or iterator
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, next
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Examines or iterates through a <nobr>UTF-8</nobr> string, depending on usage:

* If only `charpos` is specified, returns the next byte offset in the string.

* If `charpos` and `offset` are specified, a new `charpos` will be calculated by adding or subtracting the <nobr>UTF-8</nobr> character offset to/from the current `charpos`.

* If the parentheses are omitted, it can used directly as an iterator:

<div class="code-indent">

``````lua
for charpos, codepoint in utf8.next, "UTF8-string" do
	print( charpos, codepoint )
end
``````

</div>

In all cases, this function returns a new character position (in&nbsp;bytes) and code point ([number][api.type.Number]) at this position.


## Syntax

	utf8.next( s [, charpos [, offset]] )

##### s ~^(required)^~
_[String][api.type.String]._ The string.

##### charpos ~^(optional)^~
_[Number][api.type.Number]._ The character position to start at.

##### offset ~^(optional)^~
_[Number][api.type.Number]._ The character offset.


## Examples

##### Next Offset

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = "♡ 你好，世界 ♡"

print( utf8.next( testStr, 2 ) )  --> 3  161
``````

##### Iterator

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = "♡ 你好，世界 ♡"

for charpos, codepoint in utf8.next, testStr do
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
