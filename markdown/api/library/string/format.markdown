
# string.format()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [string.*][api.library.string]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, format
> __See also__          [String][api.type.String]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a formatted string following the description given in its arguments.

For more information, see the `string.format()` section [here](http://lua-users.org/wiki/StringLibraryTutorial).

## Remarks

This function allows you to use the same `formatstring` options in C and C++ ([information](http://www.cplusplus.com/reference/clibrary/cstdio/printf/)).

## Syntax

	string.format( formatstring [, ...] )

    formatstring:format( [...] )

##### formatstring ~^(required)^~
_[String][api.type.String]._ The string.

##### [...] ~^(optional)^~
_[String][api.type.String]._ Optional additional parameters that follow the same rules as the `printf` family of standard C functions. The only differences are that the options/modifiers `*`, `l`, `L`, `n`, `p`, and `h` are not supported and that there is an extra option, `q`. The `q` option formats a string in a form suitable to be safely read back by the Lua interpreter: the string is written between double quotes, and all double quotes, newlines, embedded zeros, and backslashes in the string are correctly escaped when written. The options `c`, `d`, `E`, `e`, `f`, `g`, `G`, `i`, `o`, `u`, `X`, and `x` all expect a number as argument, whereas `q` and `s` expect a string. `string.format()` does not accept string values containing embedded zeros, except as arguments to the `q` option.


## Example

`````lua
print( string.format( "%6.2f", "1234" ) )                   --> maximum of 6 characters left and 2 right of decimal: 1234.00
print( string.format( "%07d", "1234" ) )                    --> leading zeros with maximum 7 characters: 0001234
print( string.format( "%s %q", "Hello", "Corona user!" ) )  --> string and quoted string
print( string.format( "%c%c%c", 76, 117, 97 ) )             --> char: Lua
print( string.format( "%e, %E", math.pi, math.pi ) )        --> exponent: 3.141593e+00, 3.141593E+00
print( string.format( "%f, %g", math.pi, math.pi ) )        --> float and compact float: 3.141593, 3.14159
print( string.format( "%d, %i, %u", -100, -10.1, -100 ) )   --> signed, signed, unsigned integer: -100, -10, 0
print( string.format( "%o, %x, %X", 10, 10, 10 ) )          --> octal, hex, hex: 12, a, A
`````