# CoronaLuaEqualRef()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaEqualRef
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns `1` if the Lua value represented by `ref` is equal to the value at `index`, following the semantics of the Lua `==` operator (that&nbsp;is, may call&nbsp;metamethods). Otherwise returns `0`. Also returns `0` if `index` is invalid.


## Syntax

``````c
int CoronaLuaEqualRef( lua_State *L, CoronaLuaRef ref, int index )
``````
