
# display.getSafeAreaInsets()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Library__			[display.*][api.library.display]
> __Return value__		[Numbers][api.type.Number]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			safe area, insets
> __See also__          [display.safeScreenOriginX][api.library.display.safeScreenOriginX]
>						[display.safeScreenOriginY][api.library.display.safeScreenOriginY]
>						[display.safeActualContentWidth][api.library.display.safeActualContentWidth]
>						[display.safeActualContentHeight][api.library.display.safeActualContentHeight]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns four numbers corresponding to the top, left, bottom, and right "safe&nbsp;area" insets. The "safe&nbsp;area" is the rectangular region where it's safe to place important UI elements, ensuring that they are not obscured by status bars, device aspects like a sensor bar or rounded corners, software buttons, TV overscan areas, etc.

Essentially, these inset values represent the distance, in content units, between the corresponding screen edge and the imaginary boundary line where such elements will not interfere with or obscure screen content.


## Syntax

	display.getSafeAreaInsets()


## Example

``````lua
-- Gather insets (function returns these in the order of top, left, bottom, right)
local topInset, leftInset, bottomInset, rightInset = display.getSafeAreaInsets()

-- Create a vector rectangle sized exactly to the "safe area"
local safeArea = display.newRect(
	display.screenOriginX + leftInset, 
	display.screenOriginY + topInset, 
	display.actualContentWidth - ( leftInset + rightInset ), 
	display.actualContentHeight - ( topInset + bottomInset )
)
safeArea:translate( safeArea.width*0.5, safeArea.height*0.5 )
``````
