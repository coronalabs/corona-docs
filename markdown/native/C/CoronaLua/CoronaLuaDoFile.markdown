# CoronaLuaDoFile()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaDoFile
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Same as [CoronaLuaDoCall()][native.C.CoronaLua.CoronaLuaDoCall] except the function is the chunk contained in `file`.


## Syntax

``````c
int CoronaLuaDoFile( lua_State *L, const char* file, int narg, bool clear )
``````
