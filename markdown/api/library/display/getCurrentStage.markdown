
# display.getCurrentStage()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          group, stage, screen
> __See also__          [display.currentStage][api.library.display.currentStage]
>						[Group Programming][guide.graphics.group] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a reference to the current stage object, which is the parent group for all display objects and groups. Currently, Corona has a single stage instance, so this function always returns a reference to the same object.


## Syntax

	display.getCurrentStage()

## Examples

##### Set Object Focus

`````lua
-- Used in conjunction with a touch event listener and the ":setFocus()" method

function object:touch( event )

    if event.phase == "began" then

		-- Get stage and call ":setFocus()" method
        local stage = display.getCurrentStage()
        stage:setFocus( self )
        self.isFocus = true

    elseif self.isFocus then
        if event.phase == "ended" or event.phase == "cancelled" then

            local stage = display.getCurrentStage()
            stage:setFocus( nil )
        end
    end

    return true
end
`````

##### Ungroup Object

`````lua
-- Ungroup an object from its current parent group by inserting it into the top-level "stage" group

local g = display.newGroup()
local obj = display.newImage( "image.png" )
g:insert( obj )

local stage = display.getCurrentStage()

-- Ungroup object by inserting into top-level stage group
stage:insert( obj )

-- Object no longer belongs to the "g" group
`````
