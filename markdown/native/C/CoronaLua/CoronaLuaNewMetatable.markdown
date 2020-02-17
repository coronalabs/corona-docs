# CoronaLuaNewMetatable()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaNewMetatable
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a metatable called `name` with the functions in `vtable`.


## Syntax

``````c
void CoronaLuaNewMetatable( lua_State* L, const char name[], const luaL_Reg vtable[] )
``````
