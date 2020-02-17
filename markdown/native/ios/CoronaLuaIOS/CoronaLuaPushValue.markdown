# CoronaLuaPushValue()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iOS, CORONA_NATIVE_PRODUCT, CoronaLuaIOS.h, CoronaLuaPushValue
> __See also__          [CoronaLuaIOS.h][native.ios.CoronaLuaIOS]
>						[CoronaLuaPushImage()][native.ios.CoronaLuaIOS.CoronaLuaPushImage]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pushes a Lua value onto the top of the stack corresponding to the <nobr>Obj-C</nobr> object `value`. Returns `1` if a corresponding Lua value can be created; `0` otherwise.

The following <nobr>Obj-C</nobr> values can be converted:

* `NSNumber` &rarr; Lua [boolean][api.type.Boolean] __or__ Lua [number][api.type.Number] (if&nbsp;not `BOOL`, conversion is assumed to be&nbsp;double)
* `NSString` &rarr; Lua [string][api.type.String]
* `NSArray` &rarr; Lua [table][api.type.Table] (`1`-based, sequential, numerical indices)
* `NSDictionary` &rarr; Lua [table][api.type.Table]


## Syntax

``````c
int CoronaLuaPushValue( lua_State *L, id value )
``````
