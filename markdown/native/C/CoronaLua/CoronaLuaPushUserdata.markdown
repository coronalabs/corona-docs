# CoronaLuaPushUserdata()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaPushUserdata
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Wraps the pointer `ud` in a Lua userdata object and sets the userdata's metatable to `metatableName`. 

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This assumes that there will be only one Lua instance of the userdata. In other words, when the garbage collector collects the `ud`, `ud` will get deleted.

</div>


## Syntax

``````c
void CoronaLuaPushUserdata( lua_State* L, void* ud, const char metatableName[] )
``````
