# utf8.width()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, width
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Calculates the width of <nobr>UTF-8</nobr> string `s` in terms of character positions, taking into account whether characters are <nobr>double-width</nobr>, "compose" characters (typically&nbsp;accents), unprintable, or regular <nobr>single-width</nobr> characters.

Note that this is an approximation which may be useful, but it's limited to circumstances where a monospace width estimate is appropriate.

The return value of this function depends on usage:

* If `s` is a code point, returns the width of that code point.

* If `ambiIsDouble` is specified and `true`, the ambiguous width character's width is `2`; otherwise it's `1`. For comparison, the width of <nobr>full-width</nobr> and <nobr>double-width</nobr> characters is `2` while other characters have a width of `1`.

* If `defaultWidth` is specified, it will be used as the width for unprintable characters.


## Syntax

	utf8.width( s [, ambiIsDouble [, defaultWidth]] )

##### s ~^(required)^~
_[String][api.type.String]._ The string to examine.

##### ambiIsDouble ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the ambiguous width character's width is regarded as `2`; otherwise it's regarded as `1`.

##### defaultWidth ~^(optional)^~
_[Number][api.type.Number]._ If specified, this value will be used as the width for unprintable characters.


## Example

``````lua
local utf8 = require( "plugin.utf8" )

local testStr = "♡ 你好，世界 ♡"

print( utf8.width( testStr ) )  --> 14
print( utf8.width( testStr, true ) )  --> 16
print( utf8.width( utf8.codepoint( testStr, 5, 7 ), false ) )  --> 2
``````
