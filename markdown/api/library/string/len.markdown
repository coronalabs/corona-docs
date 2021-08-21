
# string.len()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, len, length, string length
> __See also__          [String][api.type.String]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the length of a string (amount of characters).

## Gotchas

If you're using encoded UTF-8 characters, for example Russian or Arabic characters, some of these characters are <nobr>multi-byte</nobr> and may vary between 2 and 4 characters when read by `string.len()`. Please see [here](https://en.wikipedia.org/wiki/UTF-8) for more information on <nobr>UTF-8</nobr> encoding.

## Syntax

	string.len( s )

    s:len()

##### s ~^(required)^~
_[String][api.type.String]._ Any string.


## Example

`````lua
print( string.len( "Lua" ) )          --> 3
print( string.len( "" ) )             --> 0
print( string.len( "Lua\000user" ) )  --> 8
`````