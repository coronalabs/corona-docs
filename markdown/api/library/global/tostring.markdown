# tostring()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          string, types, datatype
> __See also__          [tonumber()][api.library.global.tonumber]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This API is a useful debug tool for displaying or concatenating `nil` values. For complete control of how numbers are converted to strings, use [string.format()][api.library.string.format].

## Syntax

	tostring( e )

##### e ~^(required)^~
_Any._ Item to convert to a string type. If the metatable of `e` has a `__tostring` field, this function calls the corresponding value with `e` as the argument and passes the result of the call as its result.


## Example

`````lua
local rect = display.newRect( 0, 0, 100, 200 )
print( "Display Object: " .. tostring( rect ) )

-- OUTPUT: Display Object: table: 0x19a21df0
`````