
# object.blendMode

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          additive blends, blend mode, blending
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Allows you to change the blend mode on a specific object. 

See [fill.blendMode][api.type.Paint.blendMode] for a complete list of blend modes.

## Examples

``````lua
local laser = display.newImage( "blendmode_laser.png" )
laser.blendMode = "add"
``````
