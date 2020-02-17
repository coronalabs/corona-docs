
# string.byte()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, byte, numerical codes, characters
> __See also__          [string.char()][api.library.string.char]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the internal numerical codes of the characters in a string.


## Syntax

	string.byte( s [, i [, j]] )

	s:byte( [, i [, j]] )

##### s ~^(required)^~
_[String][api.type.String]._ The string.

##### i [, j] ~^(optional)^~
_[Number][api.type.Number]._ Specify the characters of the string `s[i], s[i+1], ..., s[j]` for which to get the codes. The default value for `i` is `1`; the default value for `j` is `i`.


## Example

`````lua
print( string.byte( "ABCDE" ) )        ---> 65
print( string.byte( "ABCDE", 1 ) )     ---> 65
print( string.byte( "ABCDE", 3, 5 ) )  ---> 67   68   69
print( string.byte( "ABCDE", 0 ) )     ---> nil
print( string.byte( "ABCDE", -1 ) )    ---> 69
 
local s = "ABCDE"
print( s:byte( 3, 4 ) )                ---> 67   68
`````