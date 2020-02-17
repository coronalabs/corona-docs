
# graphics.releaseTextures()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [graphics.*][api.library.Graphics]
> __Return value__      [TextureResource][api.type.TextureResource]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          textures, performance optimization, texture memory, images
> __See also__          [texture:releaseSelf()][api.type.TextureResource.releaseSelf]
>						[graphics.newTexture()][api.library.graphics.newTexture]
>						[Texture Loading/Management][guide.graphics.textureManagement] _(guide)_
>						[TextureResource][api.type.TextureResource]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This convenience function disposes/releases all [TextureResource][api.type.TextureResource] objects of a specific [type][api.type.TextureResource.type].


## Syntax

	graphics.releaseTextures( params )

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table containing the parameters for the [TextureResource][api.type.TextureResource] object(s) to be released — see the next section for details.


## Parameter Reference

##### type ~^(optional)^~

_[String][api.type.String]._ The [type][api.type.TextureResource.type] of the texture object(s) to dispose/release. If this parameter is omitted, all texture resource objects will be released.

* `"image"` &mdash; Releases all [TextureResource][api.type.TextureResource] objects of type [TextureResourceBitmap][api.type.TextureResourceBitmap].

* `"canvas"` &mdash; Releases all [TextureResource][api.type.TextureResource] objects of type [TextureResourceCanvas][api.type.TextureResourceCanvas].


## Example

``````lua
-- Create "TextureResource" object of type "TextureResourceBitmap"
local backgroundTexture = graphics.newTexture( { type="image", filename="background.png" } )

-- Sometime later, release all texture objects of a specific type
graphics.releaseTextures( { type="image" } )
``````
