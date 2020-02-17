# CoronaLuaNewGCMetatable()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaNewGCMetatable
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a metatable called `name` with a finalizer function `__gc1`


## Syntax
 
``````c
void CoronaLuaNewGCMetatable( lua_State* L, const char name[], lua_CFunction __gc1 )
``````
