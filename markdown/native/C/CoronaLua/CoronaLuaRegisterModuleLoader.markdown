# CoronaLuaRegisterModuleLoader()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h, CoronaLuaRegisterModuleLoader
> __See also__			[CoronaLua.h][native.C.CoronaLua]
>						[CoronaLuaRegisterModuleLoaders()][native.C.CoronaLua.CoronaLuaRegisterModuleLoaders]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Registers `loader` corresponding to module `name`. You can pass state variables to the loader by pushing those values on to the Lua stack and specifying the number of values via `nupvalues`. 

Similar to `lua_pushcclosure()`, this function will pop `nupvalues` from the stack.


## Syntax

``````c
void CoronaLuaRegisterModuleLoader( lua_State *L, const char *name, lua_CFunction loader, int nupvalues = 0 )
``````
