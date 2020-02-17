# texture:setBackground()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextureResourceCanvas][api.type.TextureResourceCanvas]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [TextureResource][api.type.TextureResource]
>                       [TextureResourceCanvas][api.type.TextureResourceCanvas]
>						[texture:invalidate()][api.type.TextureResourceCanvas.invalidate]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the fill color of the texture, also known as the "clear&nbsp;color" or the background. The entire texture will be set to the specified color during the next scheduled <nobr>non-accumulative</nobr> rendering. Default is transparent.


## Syntax

	texture:setBackground( gray )
	texture:setBackground( gray, alpha )
	texture:setBackground( red, green, blue )
	texture:setBackground( red, green, blue, alpha )

##### gray, red, green, blue, alpha ~^(optional)^~
_[Numbers][api.type.Number]._ Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the texture without anything rendered to it.


## Example

``````lua
local tex = graphics.newTexture( { type="canvas", width=128, height=128 } )

-- Set texture background to magenta
tex:setBackground( 1, 0, 1 )
tex:invalidate()
``````
