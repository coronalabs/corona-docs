# texture:invalidate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextureResourceExternal][api.type.TextureResourceExternal]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [TextureResourceExternal][api.type.TextureResourceExternal]
>						[TextureResource][api.type.TextureResource]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Calling this function will update the texture from the source provided by a plugin.


## Gotchas

This update will happen before the next frame is rendered, not immediately.


## Syntax

    texture:invalidate()
