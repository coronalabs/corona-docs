
# string.sub()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, sub, substring
> __See also__          [string.gsub()][api.library.string.gsub]
>								[String][api.type.String]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a substring (a specified portion of an existing string).

## Syntax

	string.sub( s, i [, j] )

	s:sub( i [,j] )


##### s ~^(required)^~
_[String][api.type.String]._ The string.

##### i ~^(required)^~
_[Number][api.type.Number]._ Index of the start of the substring (character position).

##### j ~^(optional)^~
_[Number][api.type.Number]._ Index of the end of the substring (inclusive). If not specified, the substring ends at the end of the string.


## Example

`````lua
local s = "Hello Corona user"
print( s:sub( 7 ) )        --> Corona user
print( s:sub( 7, 9 ) )     --> Cor
print( s:sub( -11 ) )      --> Corona user
print( s:sub( -11, 12 ) )  --> Corona
print( string.sub( "Hello Corona user", -11, -6 ) )  --> Corona
`````