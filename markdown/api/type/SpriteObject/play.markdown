# object:play()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [SpriteObject][api.type.SpriteObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          play
> __See also__          [display.newSprite()][api.library.display.newSprite]
>						[object:setSequence()][api.type.SpriteObject.setSequence]
>						[object:pause()][api.type.SpriteObject.pause]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Play an animation sequence, starting at the current frame. This does not reset looping.

Note that [object:setSequence()][api.type.SpriteObject.setSequence] must be called before the sequence can be played. Play can also be called after [object:pause()][api.type.SpriteObject.pause].

## Sprite Events

[Sprite events][api.event.sprite] are dispatched to the object's listener. These events tell what phase of the animation playback the sprite is in. These can have one of the following phases:

* `"began"` the sprite began playing
* `"ended"` the sprite finished playing
* `"bounce"` the sprite bounces from forward to backward while playing
* `"loop"` the sprite loops from the beginning of the sequence
* `"next"` the sprite plays a subsequent frame that's none of the above phases

See [event.phase][api.event.sprite.phase] for more information.


## Syntax

	object:play()

## Example

``````lua
spriteObj:setSequence( "man" )
spriteObj:play()

-- add the event listener to the sprite object

local function spriteListener( event )
    print( "Sprite event: " .. event.phase )
end

-- Add sprite listener
spriteObj:addEventListener( "sprite", spriteListener )

``````

