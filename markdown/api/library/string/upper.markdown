
# string.upper()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, upper, uppercase
> __See also__          [string.lower()][api.library.string.lower]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Change lowercase characters in a string to uppercase. All other characters are left unchanged.


## Syntax

	string.upper( s )

	s:upper()


##### s ~^(required)^~
_[String][api.type.String]._ The string.


## Example

`````lua
print( string.upper( "Hello, Corona user!" ) )  --> HELLO, CORONA USER!
`````