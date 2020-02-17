# object.maskY

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          mask, y, mask position, image mask, masking, clipping, bit mask
> __See also__          [object.maskX][api.type.DisplayObject.maskX]
>								[object:setMask()][api.type.DisplayObject.setMask]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieve or set the __y__ position of the [mask][api.type.Mask] applied to the display object using [object:setMask()][api.type.DisplayObject.setMask].

## Example

``````lua
-- This example moves the image mask to the position where the user moves their finger

-- Image to be masked
local image = display.newImageRect( "image.png", 768, 1024 )
image:translate( halfW, halfH )
 
-- Mask
local mask = graphics.newMask( "circlemask.png" )
image:setMask( mask )
 
function onTouch( event )

	local t = event.target
	
	if ( event.phase == "moved" ) then
		t.maskX = event.x
		t.maskY = event.y
	end
end
 
image:addEventListener( "touch", onTouch )
``````
