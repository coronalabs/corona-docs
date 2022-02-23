# memoryBitmap.newTexture()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		[MemoryBitmap][plugin.memoryBitmap.type.MemoryBitmap]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			memoryBitmap, newTexture
> __See also__			[memoryBitmap.*][plugin.memoryBitmap]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a [MemoryBitmap][plugin.memoryBitmap.type.MemoryBitmap] object which allows you to access an <nobr>in-memory</nobr> texture.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Created textures are subject to manual texture memory management. See the [Texture Loading/Management][guide.graphics.textureManagement] guide for more information.

</div>
</div>


## Syntax

	memoryBitmap.newTexture( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing the required parameters for the new object — see the next section for details.


## Parameter Reference

##### width ~^(required)^~
_[Number][api.type.Number]._ Pixel width of the new bitmap. Note that some systems require bitmap widths to be divisible by 4 in order to be stored in the GPU. In practice, this means that `width` should be divisible by 4 if `format` is `"rgb"` or `"mask"`.

##### height ~^(required)^~
_[Number][api.type.Number]._ Pixel height of the new bitmap.

##### format ~^(optional)^~
_[String][api.type.String]._ Pixel format for the new bitmap. This should be one of the following values:

* `"rgba"` (default) &mdash; <nobr>4-channel</nobr> <nobr>RGB+A</nobr> bitmap.
* `"rgb"` &mdash; <nobr>3-channel</nobr> RGB bitmap.
* `"mask"`&mdash; <nobr>1-channel</nobr> mask bitmap; this can only be used as a mask.
