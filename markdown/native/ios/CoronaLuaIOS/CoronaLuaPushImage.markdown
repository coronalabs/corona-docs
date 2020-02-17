# CoronaLuaPushImage()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iOS, CORONA_NATIVE_PRODUCT, CoronaLuaIOS.h, CoronaLuaPushImage
> __See also__          [CoronaLuaIOS.h][native.ios.CoronaLuaIOS]
>						[CoronaLuaPushValue()][native.ios.CoronaLuaIOS.CoronaLuaPushValue]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a display object using `image` and pushes it to the top of the stack. If successful, returns `1` indicating that the object was pushed onto the Lua stack; otherwise <nobr>returns `0`</nobr>.


## Syntax

``````c
int CoronaLuaPushImage( lua_State *L, UIImage *image )
``````
