# CoronaLuaSetErrorHandler()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaSetErrorHandler
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the error handler invoked on a Lua exception. By default, an internal Corona handler is called.


## Syntax

``````c
void CoronaLuaSetErrorHandler( lua_CFunction newValue )
``````
