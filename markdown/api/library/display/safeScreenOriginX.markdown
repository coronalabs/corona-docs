
# display.safeScreenOriginX

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Number][api.type.Number]
> __Library__			[display.*][api.library.display]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			screen, origin, safe area
> __See also__			[display.safeScreenOriginY][api.library.display.safeScreenOriginY]
>						[display.safeActualContentWidth][api.library.display.safeActualContentWidth]
>						[display.getSafeAreaInsets()][api.library.display.getSafeAreaInsets]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns the __x__ distance from the left side of the "safe&nbsp;area" boundary to the left side of the content area, in Corona content units. The "safe&nbsp;area" is the rectangular region where it's safe to place important UI elements, ensuring that they are not obscured by status bars, device aspects like a sensor bar or rounded corners, software buttons, TV overscan areas, etc.

For devices which do __not__ feature the concept of a safe area, this value is the same as [display.screenOriginX][api.library.display.screenOriginX].


## Example

``````lua
-- Create a vector rectangle sized exactly to the "safe area"
local safeArea = display.newRect(
	display.safeScreenOriginX,
	display.safeScreenOriginY,
	display.safeActualContentWidth,
	display.safeActualContentHeight
)
safeArea:translate( safeArea.width*0.5, safeArea.height*0.5 )
``````
