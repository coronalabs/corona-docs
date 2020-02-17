# CoronaLuaDeleteRef()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaDeleteRef
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Deletes a `CoronaLuaRef` reference and frees the reference to the underlying Lua object.


## Syntax

``````c
void CoronaLuaDeleteRef( lua_State *L, CoronaLuaRef ref )
``````
