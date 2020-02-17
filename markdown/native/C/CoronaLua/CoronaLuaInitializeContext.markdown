# CoronaLuaInitializeContext()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaInitializeContext
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initializes a platform-specific pointer. The `metatableName` argument may be `NULL`. However, if you want the pointer to be freed, you must specify a valid metatable containing a `__gc` method which gives you a way to finalize the pointer.


## Syntax

``````c
void CoronaLuaInitializeContext( lua_State *L, void *context, const char *metatableName )
``````
