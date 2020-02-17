# CoronaLuaGetErrorHandler()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaGetErrorHandler
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the error handler invoked on a Lua exception. By default, this is `NULL` which means an internal Corona handler is called.


## Syntax

``````c
lua_CFunction CoronaLuaGetErrorHandler()
``````
