# CoronaExternalPushTexture()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaGraphics.h, CoronaExternalPushTexture
> __See also__			[CoronaGraphics.h][native.C.CoronaGraphics]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a new Lua [TextureResourceExternal][api.type.TextureResourceExternal] object with the given callbacks and user data, then pushes the new texture to the top of the Lua stack. This works similarly to the Lua [graphics.newTexture()][api.library.graphics.newTexture] function except that the returned texture object wraps a bitmap loaded by the caller, and the given `callbacks` argument provides an interface for Corona to access this bitmap's information and pixel data.

This function will return `1` if the texture object was successfully created and pushed to the top of the Lua stack.

This function will return `0` if it failed to create the texture object and the Lua stack was unchanged. This will happen if invalid arguments are given or if the given Lua state does not belong to an actively running Corona runtime.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

Note that pushed textures are subject to manual [texture management][guide.graphics.textureManagement] and must be [released][api.type.TextureResource.releaseSelf] when no longer needed.

</div>
</div>


## Syntax

``````c
int CoronaExternalPushTexture( lua_State *L, const CoronaExternalTextureCallbacks *callbacks, void* userData )
``````

##### L
Pointer to the Lua state to push the new [TextureResourceExternal][api.type.TextureResourceExternal] object to.

##### callbacks
Pointer to a [CoronaExternalTextureCallbacks](#CoronaExternalTextureCallbacks) structure. This provides callbacks for Corona to invoke when requesting the plugin to provide texture information, perform an operation, and other feedback information. All callbacks will receive the `userData` value provided to this function. See [CoronaExternalTextureCallbacks][native.C.CoronaGraphics.CoronaExternalTextureCallbacks] for more details.

##### userData
Pointer to user data defined by the caller. This pointer will be passed as an argument to all function callbacks defined in the [CoronaExternalTextureCallbacks][native.C.CoronaGraphics.CoronaExternalTextureCallbacks] struct.
