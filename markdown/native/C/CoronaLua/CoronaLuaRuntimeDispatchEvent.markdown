# CoronaLuaRuntimeDispatchEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaRuntimeDispatchEvent
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Invokes the equivalent of <nobr>`Runtime:dispatchEvent( event )`</nobr> with the event object at `index`. The object at `index` must be a Lua table with the `name` property set to the event type.


## Gotchas

The event object at `index` is left on the stack.


## Syntax

``````c
void CoronaLuaRuntimeDispatchEvent( lua_State *L, int index )
``````
