
# string.starts()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, starts
> __See also__          [string.ends()][api.library.string.ends]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [boolean][api.type.Boolean] `true` or `false` depending on whether a given string starts with the specified `prefix` characters.


## Syntax

	string.starts( s, prefix )

##### s ~^(required)^~
_[String][api.type.String]._ The string to be checked.

##### prefix ~^(required)^~
_[String][api.type.String]._ A string indicating the prefix to check against.


## Examples

`````lua
print( string.starts( "Test123", "Test" ) )    --> true
print( string.starts( "Test123", "est" ) )     --> false
print( string.starts( "12345678", "1234" ) )   --> true
print( string.starts( "12345678", "01234" ) )  --> false
`````
