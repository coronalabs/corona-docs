
# event.target

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [DisplayObject][api.type.DisplayObject]
> __Event__             [sprite][api.event.sprite]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sprite
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The sprite that generated the event; its current properties may also be accessed via this property. For example, `event.target.sequence` would provide the current sequence for the sprite.

## Example
 
``````lua
local function spriteListener( event )
	print( "Sprite event: ", event.target.sequence, event.phase )
end

-- Add sprite listener (assumes "mySprite" is a valid sprite object)
mySprite:addEventListener( "sprite", spriteListener )
``````
