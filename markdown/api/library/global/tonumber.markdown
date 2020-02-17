# tonumber()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          number, types, datatype
> __See also__          [tostring()][api.library.global.tostring]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Tries to convert its argument to a number. If the argument is already a number or a string that can be converted to a number, `tonumber()` returns the number, otherwise, it returns `nil`.

An optional argument (`base`) specifies the base to interpret the numeral.

## Syntax

	tonumber( e [, base ] )

##### e ~^(required)^~
The item to be converted to a number.

##### base ~^(optional)^~
_[Number][api.type.Number]._ Specifies the base to interpret the numeral. The base may be any integer between `2` and `36`, inclusive. In bases above 10, the letter `A` (in either uppercase or lowercase) represents `10`, `B` represents `11`, and so forth, with `Z` representing `35`. In base 10 (default), the number can have a decimal part as well as an optional exponent part. In other bases, only unsigned integers are accepted.

## Example

`````lua
-- Convert the string "42" to a number (42)
local numString = "42"
local numValue = tonumber( numString )

if numValue ~= nil then
	print( numValue )
end
`````