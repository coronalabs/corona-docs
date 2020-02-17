# texture:draw()

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

This method adds/renders a [display object][api.type.DisplayObject] to the internal rendering queue of the [TextureResourceCanvas][api.type.TextureResourceCanvas] object. All rendering of queued objects occurs after calling [texture:invalidate()][api.type.TextureResourceCanvas.invalidate].


## Gotchas

Inserting a display object into the rendering queue also removes the object from its current [group][api.type.GroupObject] or the [stage][api.type.StageObject], since objects cannot exist in multiple groups.


## Syntax

	texture:draw( object )

##### object ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ The object to be inserted into the rendering queue.


## Example

``````lua
local tex = graphics.newTexture( { type="canvas", width=128, height=128 } )

-- Create a circle and draw/render it to the texture
local circ = display.newCircle( 0, 0, 64 )
circ:setFillColor( { type="gradient", color1={0,0.2,1}, color2={0.8,0.8,0.8}, direction="down" } )
tex:draw( circ )

-- Schedule texture objects to be rendered to texture before next frame
tex:invalidate()
``````
