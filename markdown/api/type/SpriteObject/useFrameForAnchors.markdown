# object:useFrameForAnchors()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__ [Function][api.type.Function]
> __Object__ [SpriteObject][api.type.SpriteObject]
> __Library__ [display.*][api.library.display]
> __Return value__ none
> __Revision__ [REVISION_LABEL](REVISION_URL)
> __Keywords__ sprite, useFrameForAnchors, anchor
> __See also__ [display.newSprite()][api.library.display.newSprite]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets a frame in the currently loaded sequence as the reference for anchor points. Anchor point calculations will be performed as if this was the current frame, even when another is actually being displayed. Without
this, sequences with variable-sized frames (possibly with trimming) can jump around during scaling and rotation, due to the anchor point resolving to a different position.

## Syntax

object:useFrameForAnchors( [frameIndex] )

##### frameIndex ~^(optional)^~

_[Number][api.type.Number]._ The frame index in the currently loaded sequence you want to use as reference. The default is the current frame, or 1 is none has been set. In a sprite sequence, `1` indicates the first
frame <nobr>(not `0`)</nobr>.