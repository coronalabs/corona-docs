# CoronaLuaCreateDictionary()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iOS, CORONA_NATIVE_PRODUCT, CoronaLuaIOS.h, CoronaLuaCreateDictionary
> __See also__          [CoronaLuaIOS.h][native.ios.CoronaLuaIOS]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates and returns a `NSDictionary` corresponding to the table at `index`. This `NSDictionary` contains the <nobr>Obj-C</nobr> equivalent of Lua types.

The following indicates how Lua values in the table are converted to <nobr>Obj-C</nobr> values:

* Lua [boolean][api.type.Boolean] &rarr; `NSNumber`
* Lua [number][api.type.Number] &rarr; `NSNumber`
* Lua [string][api.type.String] &rarr; `NSString`
* Lua [table][api.type.Table] &rarr; `NSDictionary`


## Syntax

``````c
NSDictionary* CoronaLuaCreateDictionary( lua_State *L, int index )
``````
