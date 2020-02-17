# object:contentToLocal()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          display object, coordinates
> __See also__          [object.localToContent][api.type.DisplayObject.localToContent]
>								[object.contentBounds][api.type.DisplayObject.contentBounds]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Maps the given __x__ and __y__ values in content ([stage][api.type.StageObject]) coordinates to the target object's local coordinates (center point).


## Syntax

	object:contentToLocal( xContent, yContent )

##### xContent ~^(required)^~

_[Number][api.type.Number]._ The __x__ coordinate in content (display) space.

##### yContent ~^(required)^~

_[Number][api.type.Number]._ The __y__ coordinate in content (display) space.


## Return Values

This function returns the __x__ and __y__ coordinates of the given values in the object's local coordinate space. The values returned are relative to the center point of the [display&nbsp;object][api.type.DisplayObject], and these values will be negative if the given point is above or left of the object's center point.

## Example
 
``````lua
-- Rectangle that fills screen
local rect = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
rect.x = display.contentCenterX ; rect.y = display.contentCenterY
rect.strokeWidth = 4 ; rect:setStrokeColor( 1, 0, 0 )
rect:setFillColor( 0, 0, 0 )

-- Create text objects to display content and local coordinates
local contentText = display.newText( "", 0, 0, display.nativeSystemFont, 16 )
local localText = display.newText( "", 0, 0, display.nativeSystemFont, 16 )
localText.anchorX = 0 ; localText.anchorY = 0
contentText.anchorX = 0 ; contentText.anchorY = 0
 
function showCoordinates( event )
    -- Get x and y of touch event in content coordinates
    local contentX, contentY = event.x, event.y

    -- Convert to local coordinates of 
    local localX, localY = event.target:contentToLocal( contentX, contentY )        

    -- Display content and local coordinate values
    contentText.text = "CONTENT: " .. tostring(contentX) .. ", " .. tostring(contentY)
    localText.text = "LOCAL: " .. tostring(localX) .. ", " .. tostring(localY)
    contentText.x, contentText.y = event.x+20, event.y
    localText.x, localText.y = event.x+20, event.y+20
    localText.anchorX = 0 ; localText.anchorY = 0
    contentText.anchorX = 0 ; contentText.anchorY = 0
    return true
end

rect:addEventListener( "touch", showCoordinates )
``````
