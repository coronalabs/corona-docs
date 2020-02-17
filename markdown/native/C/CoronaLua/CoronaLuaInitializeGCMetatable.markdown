# CoronaLuaInitializeGCMetatable()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaInitializeGCMetatable
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Same as [CoronaLuaNewGCMetatable()][native.C.CoronaLua.CoronaLuaNewGCMetatable], but doesn't leave anything on the stack.


## Syntax

``````c
void CoronaLuaInitializeGCMetatable( lua_State* L, const char name[], lua_CFunction __gc1 )
``````
