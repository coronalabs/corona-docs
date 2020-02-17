# CoronaLibraryNew()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLibrary.h, CoronaLibraryNew
> __See also__			[CoronaLibrary.h][native.C.CoronaLibrary]
>						[CoronaLibraryNewWithFactory()][native.C.CoronaLibrary.CoronaLibraryNewWithFactory]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a library object in Lua and leaves it at the top of the stack.

This object is a Lua table that is an instance of [CoronaLibrary][api.type.CoronaLibrary]. It initializes the table with the functions in `libFuncs`. If `context` is <nobr>non-`NULL`</nobr>, each of those functions is registered as a closure with `context` as the first upvalue. That upvalue is stored as __light__ userdata, so the caller is responsible for the lifetime of this object.


## Syntax

``````c
int CoronaLibraryNew(
	lua_State *L,
	const char *libName, const char *publisherId, int version, int revision,
	const luaL_Reg libFuncs[], void *context )
``````
