# texture:invalidate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextureResourceCanvas][api.type.TextureResourceCanvas]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [TextureResource][api.type.TextureResource]
>                       [TextureResourceCanvas][api.type.TextureResourceCanvas]
>						[texture:draw()][api.type.TextureResourceCanvas.draw]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This method schedules display objects queued for rendering via [texture:draw()][api.type.TextureResourceCanvas.draw] to be rendered to the texture before the next frame.


## Syntax

	texture:invalidate( [params] )

##### params ~^(optional)^~
_[String][api.type.String]_ or _[Table][api.type.Table]._ If specified, one of the following options are valid. If omitted, accumulative rendering of objects from the rendering queue occurs.

* Pass a [string][api.type.String] value of `"cache"` to clear the texture and subsequently render objects from the cache to the texture:

<div class="code-indent" style="width:500px;">

`texture:invalidate( "cache" )`

</div>

* If you need to render display objects without clearing the texture, pass a [table][api.type.Table] with keys of `source` and `accumulate`. This switches off accumulative rendering and uses the cache as the source for rendering to the texture.

<div class="code-indent" style="width:500px;">

`texture:invalidate( { source="cache", accumulate=false } )`

</div>
