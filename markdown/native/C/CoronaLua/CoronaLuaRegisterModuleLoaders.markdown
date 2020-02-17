# CoronaLuaRegisterModuleLoaders()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaRegisterModuleLoaders
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Same as [CoronaLuaRegisterModuleLoader()][native.C.CoronaLua.CoronaLuaRegisterModuleLoader] but you register multiple name/loader pairs.


## Syntax

``````c
void CoronaLuaRegisterModuleLoaders( lua_State *L, const luaL_Reg moduleLoaders[], int nupvalues = 0 )
``````
