# CoronaLuaCoronaLuaInsertPackageLoader()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaCoronaLuaInsertPackageLoader
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Performs the equivalent of the following Lua code:

``````lua
table.insert( package.loaders, index, loader )
``````


## Syntax

``````c
void CoronaLuaInsertPackageLoader( lua_State *L, lua_CFunction loader, int index )
``````
