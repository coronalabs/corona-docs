# CoronaLuaNewEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaNewEvent
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a Lua table with the `name` property set to `eventName` and pushes it to the top of the Lua stack.


## Syntax

``````c
void CoronaLuaNewEvent( lua_State *L, const char *eventName )
``````
