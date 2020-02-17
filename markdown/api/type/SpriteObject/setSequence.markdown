# object:setSequence()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [SpriteObject][api.type.SpriteObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sprite, setSequence
> __See also__          [display.newSprite()][api.library.display.newSprite]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads an animation sequence by name.

## Syntax

	object:setSequence( [ sequenceName ] )
	
##### sequenceName ~^(optional)^~
_[String][api.type.String]._ The name of the sequence you want to load (to be played). If not specified, the first frame in the currently loaded sequence will be shown instead.

## Gotchas

After changing the sequence, the sprite will not play automatically &mdash; call [object:play()][api.type.SpriteObject.play] to continue playing on the new sequence.

## Example

``````lua
spriteObj:setSequence( "running_man" )
spriteObj:play()
``````
