# object:pause()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [SpriteObject][api.type.SpriteObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sprite, pause
> __See also__          [display.newSprite()][api.library.display.newSprite]
>						[object:setSequence()][api.type.SpriteObject.setSequence]
>						[object:play()][api.type.SpriteObject.play]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pauses the current animation, and frame remains on the currently shown frame. Playback can resume later with [object:play()][api.type.SpriteObject.play].

## Syntax

	object:pause()

## Example

``````lua
spriteObj:setSequence( "running_man" )
spriteObj:play() 

-- some time later
spriteObj:pause()
``````