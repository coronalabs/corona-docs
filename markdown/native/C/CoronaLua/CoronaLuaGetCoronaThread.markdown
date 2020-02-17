# CoronaLuaGetCoronaThread()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaGetCoronaThread
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gives you the main Lua state used by Corona given the Lua state corresponding to a `coroutine`. Returns `NULL` if the coroutine is not a coroutine that belongs to Corona's main Lua state. If `coroutine` happens to be Corona's main Lua state, then it returns `coroutine`.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Lua uses the word "thread" to mean coroutine, for example a cooperative <nobr>(not pre-emptive)</nobr> thread.

</div>


## Syntax

``````c
lua_State* CoronaLuaGetCoronaThread( lua_State *coroutine )
``````
