
# string.match()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, match, find
> __See also__          [string.gmatch()][api.library.string.gmatch]
>								[string.find()][api.library.string.find]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Extract substrings by matching a pattern in a string. If a match is found, returns the captures from the pattern; otherwise returns `nil`. If pattern specifies no captures, then the whole match is returned.


## Syntax

	string.match( s, pattern [, init] ) 

	s:match( pattern [, init] )

##### s ~^(required)^~
_[String][api.type.String]._ Any string.

##### pattern ~^(required)^~
_[String][api.type.String]._ Specifies the pattern to match. See [Lua String Manipulation][guide.data.luaString].

##### init ~^(optional)^~
_[Number][api.type.Number]._ Number specifying where in `s` to start the search. The default is `1`; can be negative.


## Example

`````lua
print( string.match( "I have 2 questions for you.", "%d+ %a+" ) )  --> 2 questions
 
print( string.format( "%d, %q", string.match( "I have 2 questions for you.", "(%d+) (%a+)" ) ) )  --> 2, "questions"
`````