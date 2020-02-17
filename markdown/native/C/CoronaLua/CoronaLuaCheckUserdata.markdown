# CoronaLuaCheckUserdata()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaCheckUserdata
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Same as [CoronaLuaToUserdata()][native.C.CoronaLua.CoronaLuaToUserdata] except that this returns `NULL` if the userdata at `index` doesn't have a metatable that matches `metatableName`.


## Syntax

``````c
void* CoronaLuaCheckUserdata( lua_State* L, int index, const char metatableName[] )
``````
