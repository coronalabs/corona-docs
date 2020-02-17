
# string.rep()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, rep, replicate
> __See also__          [String][api.type.String]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Replicates a string by returning a string that is the concatenation of `n` copies of a specified [String][api.type.String].

## Syntax

	string.rep( s, n )

	s:rep( n )

##### s ~^(required)^~
_[String][api.type.String]._ The string to replicate.

##### n ~^(required)^~
_[Number][api.type.Number]._ Amount of times to replicate the string.


## Example

`````lua
print( string.rep( "Corona ", 5 ) )  --> Corona Corona Corona Corona Corona
`````