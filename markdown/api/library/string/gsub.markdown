
# string.gsub()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [String][api.type.String] and [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, gsub, sub, search
> __See also__          [string.find()][api.library.string.find]
>						[string.gmatch()][api.library.string.gmatch]
>						[string.match()][api.library.string.match]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Replaces all occurrences of a pattern in a string. Returns the string after the substitutions have been performed, along with the number of substitutions made <nobr>(`0` if none)</nobr>.

## Syntax

	string.gsub( s, pattern, repl [, n] )

    s:gsub( pattern, repl [,n] )

##### s ~^(required)^~
_[String][api.type.String]._ The string to be searched.

##### pattern ~^(required)^~
_[String][api.type.String]._ A string specifying the pattern to match. See [Lua String Manipulation][guide.data.luaString].

##### repl ~^(required)^~
_[String][api.type.String], [Table][api.type.Table], or [Function][api.type.Function]._ Depending on the type, `string.gsub()` works as follows:

* If `repl` is a string, its value is used for the replacement. The character `%` works as an escape character: any sequence in `repl` of the form `%n`, with `n` between `1` and `9`, stands for the value of the <nobr>`n`th</nobr> captured substring. The sequence `%0` stands for the whole match and the sequence `%%` stands for a single `%`.

* If `repl` is a table, the table is queried for every match, using the first capture as the key; if the pattern specifies no captures, the whole match is used as the key.

* If `repl` is a function, this function is called every time a match occurs, with all captured substrings passed as arguments in order; if the pattern specifies no captures, the whole match is passed as a sole argument.

* If the value returned by the table query or by the function call is a string or a number, it is used as the replacement string; otherwise, if it is `false` or `nil`, then there is no replacement (the&nbsp;original match is kept in the&nbsp;string).

##### n ~^(optional)^~
_[Number][api.type.Number]._ Number of occurrences of pattern to replace.


## Examples

`````lua
print( string.gsub( "Hello banana", "banana", "Corona user" ) ) 
print( string.gsub( "banana", "a", "A", 2 ) )             -- Limit substitutions made to 2
print( string.gsub( "banana", "(an)", "%1-" ) )           -- Capture any occurances of 'an' and replace
print( string.gsub( "banana", "a(n)", "a(%1)" ) )         -- Brackets around n's which follow a's
print( string.gsub( "banana", "(a)(n)", "%2%1" ) )        -- Reverse any 'an's
print( string.gsub( "Hello Lua user", "(%w+)", function(w) return string.len(w) end ) )  -- Replace with lengths
print( string.gsub( "banana", "(a)", string.upper ) )                                    -- Make all 'a's found uppercase
print( string.gsub( "banana", "(a)(n)", function(a,b) return b..a end ) )                -- Reverse any 'an's
print( string.gsub( "The big {brown} fox jumped {over} the lazy {dog}.", "{(.-)}", function(a) print(a) end ) )
print( string.gsub( "The big {brown} fox jumped {over} the lazy {dog}.", "{(.*)}", function(a) print(a) end ) )
`````
