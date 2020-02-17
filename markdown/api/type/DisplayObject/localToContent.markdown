# object:localToContent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          display object, coordinates
> __See also__          [object.contentToLocal][api.type.DisplayObject.contentToLocal]
>								[object.contentBounds][api.type.DisplayObject.contentBounds]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Maps the given __x__ and __y__ coordinates of an object to content ([stage][api.type.StageObject]) coordinates.

This method is useful for comparing the location of display objects in different groups. When a display object is inserted into a group, the core __x__ and __y__ properties for the object are relative to its group (parent) and not the content (stage). `object:localToContent()` can be used to return the actual content coordinates of an object, independent of its parent group.

This method is also useful to determine the content coordinates of a specific off-center point on an object, even one that is rotated or scaled. For example, you can pass an __x__ and __y__ value relative to the object's center and retrieve the specific location of that point in content (stage) coordinates. See the example code below.

Note that this method is similar to [object.contentBounds][api.type.DisplayObject.contentBounds], but it returns a specific coordinate point, not the bounding limits of the object.


## Syntax

	object:localToContent( x, y )

##### x, y ~^(required)^~
_[Numbers][api.type.Number]._ Coordinates relative to the display object's center point. Point `0,0` refers to the center point of the object.


## Return Values

This function returns the __x__ and __y__ content coordinates, relative to the top left position of the content area.


## Example

``````lua
-- Create a square
local square = display.newRect( 100, 100, 40, 40 )
square:setFillColor( 1 )

-- Create another square on top and rotate it 20 degrees
local redSquare = display.newRect( 100, 100, 40, 40 )
redSquare:setFillColor( 1, 0, 0, 0.6 )
redSquare.rotation = 20

local sqCenterX, sqCenterY = square:localToContent( 0, 0 )
print( "White square's center position in screen coordinates: ", sqCenterX, sqCenterY )

-- Get the content position of the white square's top-left corner
-- Using ( -20,-20 ) specifies the top left corner of the square, since it's 40x40 in size
local whiteTLX, whiteTLY = square:localToContent( -20, -20 )
print( "White square's top-left position in screen coordinates: ", whiteTLX, whiteTLY )

-- Get the content position of the red square's top-left corner, independent of its rotation
-- Using ( -20,-20 ) specifies the top left corner of the square, since it's 40x40 in size
local redTLX, redTLY = redSquare:localToContent( -20, -20 )
print( "Red square's top-left position in screen coordinates: ", redTLX, redTLY )
``````
