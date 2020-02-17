# CoronaLuaNewRef()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaNewRef
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a new `CoronaLuaRef` object which holds a reference to the Lua object on the Lua stack at `index`. You can use this to store and access Lua objects from native code.


## Syntax

``````c
CoronaLuaRef CoronaLuaNewRef( lua_State *L, int index )
``````
