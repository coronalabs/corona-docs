# CoronaExternalGetUserData()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaGraphics.h, CoronaExternalGetUserData
> __See also__			[CoronaGraphics.h][native.C.CoronaGraphics]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the `userData` that was assigned to a Lua [TextureResourceExternal][api.type.TextureResourceExternal] object which was created by a call to the [CoronaExternalPushTexture()][native.C.CoronaGraphics.CoronaExternalPushTexture] function. This function is useful when implementing the `callback.onGetField()` [callback][native.C.CoronaGraphics.CoronaExternalTextureCallbacks].

Returns `NULL` if the given stack index doesn't reference a texture object.


## Syntax

``````c
void* CoronaExternalGetUserData( lua_State *L, int index )
``````

##### L
Pointer to the Lua state from which to access the Lua [TextureResourceExternal][api.type.TextureResourceExternal] object.

##### index
`1`-based index to the [TextureResourceExternal][api.type.TextureResourceExternal] object on the Lua stack.
