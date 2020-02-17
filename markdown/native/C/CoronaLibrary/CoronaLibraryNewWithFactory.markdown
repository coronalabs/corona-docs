# CoronaLibraryNewWithFactory()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLibrary.h, CoronaLibraryNewWithFactory
> __See also__			[CoronaLibrary.h][native.C.CoronaLibrary]
>						[CoronaLibraryNew()][native.C.CoronaLibrary.CoronaLibraryNew]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a library object by calling the Lua chunk `factory` and leaves it at the top of the stack.

The `factory` should return an instance of [CoronaLibrary][api.type.CoronaLibrary] and should set the following table properties:

* `name` ([string][api.type.String])
* `publisherId` ([string][api.type.String])
* `version` ([number][api.type.Number])
* `revision` ([number][api.type.Number])

If `factory` succeeds, the functions in `libFuncs` are added in the same manner as [CoronaLibraryNew()][native.C.CoronaLibrary.CoronaLibraryNew].


## Syntax

``````c
int CoronaLibraryNewWithFactory(
	lua_State *L,
	lua_CFunction factory,
	const luaL_Reg libFuncs[], void *context )
``````
