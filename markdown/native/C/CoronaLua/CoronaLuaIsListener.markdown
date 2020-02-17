# CoronaLuaIsListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaIsListener
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns whether the function at `index` is a Corona [listener][api.type.Listener].


## Syntax

``````c
bool CoronaLuaIsListener( lua_State *L, int index, const char *eventName )
``````
