
# string.lower()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, lower, lowercase
> __See also__          [string.upper()][api.library.string.upper]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Change uppercase characters in a string to lowercase.

Note that the definition of uppercase depends on the current locale.

## Syntax

	string.lower( s )

	s:lower()

##### s ~^(required)^~
_[String][api.type.String]._ Any string.


## Example

`````lua
print( string.lower( "Hello, Corona UsEr!" ) )  --> hello, corona user!
`````
