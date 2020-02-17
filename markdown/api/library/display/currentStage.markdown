
# display.currentStage

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [StageObject][api.type.StageObject]
> __Library__           [display.*][api.library.display]
> __Return value__		[DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          group, stage, screen
> __See also__          [display.getCurrentStage()][api.library.display.getCurrentStage]
>						[Group Programming][guide.graphics.group] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A reference to the current stage object, which is the root group for all display objects and groups. Currently, Corona has a single stage instance, so this function always returns a reference to the same object.

## Example
 
``````lua
local count = display.currentStage.numChildren
print( "Number of objects on the screen = " .. count )
``````
