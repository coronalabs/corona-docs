# CoronaLuaNormalize()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaNormalize
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns an absolute index location on the Lua stack for the passed `index`. This is useful if you have negative stack indices, as these are relative to the top of the stack.


## Syntax

``````c
int CoronaLuaNormalize( lua_State *L, int index )
``````
