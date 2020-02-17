# CoronaLuaDispatchEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaDispatchEvent
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Invokes the listener corresponding to `listenerRef`, passing the value at the top of the stack as the Corona event table. You should use [CoronaLuaNewEvent()][native.C.CoronaLua.CoronaLuaNewEvent] to create this event. This function pops the value from the top of the stack.


## Syntax

``````c
void CoronaLuaDispatchEvent( lua_State *L, CoronaLuaRef listenerRef, int nresults )
``````
