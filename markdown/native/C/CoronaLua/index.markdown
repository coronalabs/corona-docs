# CoronaLua.h

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				C header
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaLua.h
> __See also__			[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`CoronaLua.h` contains C and C++ convenience functions for interacting with the Lua state. In particular, they vastly simplify dealing with <nobr>Corona-specific</nobr> patterns such as creating events, storing <nobr>C-side</nobr> references to Lua listeners, dispatching events, calling Lua functions, etc. These functions are all prefixed with `CoronaLua`.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* In addition to these, there are functions to bridge iOS and Lua in [CoronaLuaIOS.h][native.ios.CoronaLuaIOS].

* The C++ functions are just thin wrappers around the C functions. The header is designed to work correctly with both C and C++ compilers.

* All C++ methods mirror the C functions but instead of the prefix, they are in the `Corona::Lua` namespace.

</div>


## Functions

#### [CoronaLuaGetCoronaThread()][native.C.CoronaLua.CoronaLuaGetCoronaThread]

#### [CoronaLuaNew()][native.C.CoronaLua.CoronaLuaNew]

#### [CoronaLuaDelete()][native.C.CoronaLua.CoronaLuaDelete]

#### [CoronaLuaNormalize()][native.C.CoronaLua.CoronaLuaNormalize]

#### [CoronaLuaGetContext()][native.C.CoronaLua.CoronaLuaGetContext]

#### [CoronaLuaInitializeContext()][native.C.CoronaLua.CoronaLuaInitializeContext]

#### [CoronaLuaNewRef()][native.C.CoronaLua.CoronaLuaNewRef]

#### [CoronaLuaDeleteRef()][native.C.CoronaLua.CoronaLuaDeleteRef]

#### [CoronaLuaEqualRef()][native.C.CoronaLua.CoronaLuaEqualRef]

#### [CoronaLuaNewEvent()][native.C.CoronaLua.CoronaLuaNewEvent]

#### [CoronaLuaDispatchEvent()][native.C.CoronaLua.CoronaLuaDispatchEvent]

#### [CoronaLuaIsListener()][native.C.CoronaLua.CoronaLuaIsListener]

#### [CoronaLuaPushRuntime()][native.C.CoronaLua.CoronaLuaPushRuntime]

#### [CoronaLuaRuntimeDispatchEvent()][native.C.CoronaLua.CoronaLuaRuntimeDispatchEvent]

#### [CoronaLuaNewGCMetatable()][native.C.CoronaLua.CoronaLuaNewGCMetatable]

#### [CoronaLuaNewMetatable()][native.C.CoronaLua.CoronaLuaNewMetatable]

#### [CoronaLuaInitializeGCMetatable()][native.C.CoronaLua.CoronaLuaInitializeGCMetatable]

#### [CoronaLuaInitializeMetatable()][native.C.CoronaLua.CoronaLuaInitializeMetatable]

#### [CoronaLuaPushUserdata()][native.C.CoronaLua.CoronaLuaPushUserdata]

#### [CoronaLuaToUserdata()][native.C.CoronaLua.CoronaLuaToUserdata]

#### [CoronaLuaCheckUserdata()][native.C.CoronaLua.CoronaLuaCheckUserdata]

#### [CoronaLuaRegisterModuleLoader()][native.C.CoronaLua.CoronaLuaRegisterModuleLoader]

#### [CoronaLuaRegisterModuleLoaders()][native.C.CoronaLua.CoronaLuaRegisterModuleLoaders]

#### [CoronaLuaCoronaLuaInsertPackageLoader()][native.C.CoronaLua.CoronaLuaCoronaLuaInsertPackageLoader]

#### [CoronaLuaGetErrorHandler()][native.C.CoronaLua.CoronaLuaGetErrorHandler]

#### [CoronaLuaSetErrorHandler()][native.C.CoronaLua.CoronaLuaSetErrorHandler]

#### [CoronaLuaDoCall()][native.C.CoronaLua.CoronaLuaDoCall]

#### [CoronaLuaDoBuffer()][native.C.CoronaLua.CoronaLuaDoBuffer]

#### [CoronaLuaDoFile()][native.C.CoronaLua.CoronaLuaDoFile]
