# object.timeScale

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [SpriteObject][api.type.SpriteObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sprite, timeScale
> __See also__          [display.newSprite()][api.library.display.newSprite]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Gets or sets the scale to be applied to the animation time. This is used to control a sprite's animation speed dynamically.

A time scale of `1.0` (default) runs the animation at normal speed. A time scale of `2.0` runs the animation twice as fast, while a time scale of `0.5` runs the animation at half speed.

## Gotchas

The maximum value allowed is `20.0`; the minimum value allowed is `0.05`. Supports up to 2 decimal places.

Setting the time scale may cause frame skipping. If you perform this in a sprite event handler where the time scale is updated rapidly, you should store the current frame, set the timescale, then set the frame back to the stored frame.

## Example

``````lua
spriteObj.timeScale = 2.0
``````
