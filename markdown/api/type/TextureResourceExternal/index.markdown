# TextureResourceExternal

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [TextureResource][api.type.TextureResource]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          textures, performance optimization, texture memory, images
> __See also__          [TextureResource][api.type.TextureResource]
>                       [Texture Loading/Management][guide.graphics.textureManagement] _(guide)_
>                       [texture.type][api.type.TextureResource.type]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The object created by various plugins, with a [type][api.type.TextureResource.type] property of `"external"`.


## Gotchas

* Even if textures of this type are created by plugins, they are still subject to [manual management][guide.graphics.textureManagement].

* Make sure to [release][api.type.TextureResource.releaseSelf] objects of this type when they are no longer needed.


## Properties

#### [texture.width][api.type.TextureResourceExternal.width]

#### [texture.height][api.type.TextureResourceExternal.height]


## Methods

#### [texture:invalidate()][api.type.TextureResourceExternal.invalidate]
