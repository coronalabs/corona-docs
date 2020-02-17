
# string.find()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, find, search, patterns
> __See also__          [string.gmatch()][api.library.string.gmatch]
>								[string.gsub()][api.library.string.gsub]
>								[string.match()][api.library.string.match]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Looks for the first match of a pattern in a string. If found, it returns the indices where the occurrence starts and ends; otherwise, returns `nil`.

## Syntax

	string.find( s, pattern [, init [, plain]] )

##### s ~^(required)^~
_[String][api.type.String]._ The string.

##### pattern ~^(required)^~
_[String][api.type.String]._ Specifies the pattern to match. See [Lua String Manipulation][guide.data.luaString].

##### init ~^(optional)^~
_[Number][api.type.Number]._ Specifies where to start the search. Default value is `1` and can be negative. Negative numbers start at the end of the string.

##### plain ~^(optional)^~
_[Boolean][api.type.Boolean]._ A value of `true` turns off the pattern matching facilities, so the function does a plain "find substring" operation with no characters in pattern being considered "magic". If `plain` is given, then the `init` argument must be provided as well.


## Example

`````lua
print( string.find( "Hello Corona user", "Corona" ) )        --> 7   12
print( string.find( "Hello Corona user", "Bud" ) )           --> nil
print( string.find( "Hello Corona user", "Corona", 1 ) )     --> start at first character: 7   12
print( string.find( "Hello Corona user", "Corona", 8 ) )     --> start at character 8: nil
print( string.find( "Hello Corona user", "e", -5 ) )         --> first "e" 5 characters from end: 16   16
print( string.find( "Hello Corona user", "%su", 1, true ) )  --> nil
`````