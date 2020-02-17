# CoronaLuaDoCall()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaDoCall
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Does a protected call <nobr>(see Lua [pcall()][api.library.global.pcall])</nobr> on a function that's on the stack. `narg` includes the total function and the number of arguments passed to it.


## Syntax

``````c
int CoronaLuaDoCall( lua_State* L, int narg, int nresults )
``````
