# object:toBack()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          toBack, draw order
> __See also__          [object:toFront()][api.type.DisplayObject.toFront]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Moves the target object to the visual back of its parent group ([object.parent][api.type.DisplayObject.parent]).

## Gotchas

This also affects the order of the objects in the parent group array.

## Syntax

	object:toBack()

## Example

``````lua
-- This sample creates a group of display objects (playing cards).
-- Clicking on one of the cards sends it to the bottom of the parent group's visual stack.

local cards = display.newGroup()     
 
function sendToBack( event )
    if ( event.phase == "began" ) then
        event.target:toBack()
    end
    return true
end

for i=1,5 do
    local cardGroup = display.newGroup()

    -- Card outline
    local cardRect = display.newRoundedRect( 100, 100, 125, 175, 12 )
    cardRect.strokeWidth = 2
    cardRect:setFillColor( 1 )    
    cardRect:setStrokeColor( 0, 0, 0, 0.3 )
    cardGroup:insert(cardRect)

    -- Card values
    local cardValue = display.newText( cardGroup, i, cardRect.contentWidth - 72, 32, native.systemFontBold, 24 )
    cardValue:setFillColor( 1, 0, 0 )
    local cardValue2 = display.newText( cardGroup, i, 148, cardRect.contentHeight - 8 , native.systemFontBold, 24 )
    cardValue2:setFillColor( 1, 0, 0 )       

    cardGroup.x = (i * 25)
    cardGroup.y = (i * 25)
    cards:insert( cardGroup )

    cardGroup:addEventListener( "touch", sendToBack )
end
``````
