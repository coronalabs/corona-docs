
# string.char()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, char, numerical code, characters
> __See also__          [string.byte()][api.library.string.byte]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a string in which each character has the internal numerical code equal to its corresponding argument.

Note that the numerical codes are not necessarily portable across platforms.


## Syntax

	string.char( [arg1 [, ...] )

##### arg1 ~^(optional)^~
_[Number][api.type.Number]._ Zero or more integers (whole numbers).

## Example

`````lua
print( string.char( 65,66,67 ) )  --> ABC
print( string.char() )            --> empty string
`````