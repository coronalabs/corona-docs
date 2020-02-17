
# string.ends()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, ends
> __See also__          [string.starts()][api.library.string.starts]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [boolean][api.type.Boolean] `true` or `false` depending on whether a given string ends with the specified `suffix` characters.


## Syntax

	string.ends( s, suffix )

##### s ~^(required)^~
_[String][api.type.String]._ The string to be checked.

##### suffix ~^(required)^~
_[String][api.type.String]._ A string indicating the suffix to check against.


## Examples

`````lua
print( string.ends( "Test123", "123" ) )     --> true
print( string.ends( "Test123", "12" ) )      --> false
print( string.ends( "12345678", "5678" ) )   --> true
print( string.ends( "12345678", "56789" ) )  --> false
`````
