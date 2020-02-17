# CoronaLuaInitializeMetatable()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaInitializeMetatable
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Same as [CoronaLuaNewMetatable()][native.C.CoronaLua.CoronaLuaNewMetatable], but doesn't leave anything on the stack.


## Syntax

``````c
void CoronaLuaInitializeMetatable( lua_State* L, const char name[], const luaL_Reg vtable[] )
``````
