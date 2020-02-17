
# display.safeActualContentHeight

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          safe area, content height
> __See also__			[display.safeActualContentWidth][api.library.display.safeActualContentWidth]
>						[display.safeScreenOriginY][api.library.display.safeScreenOriginY]
>						[display.getSafeAreaInsets()][api.library.display.getSafeAreaInsets]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The height of the screen "safe&nbsp;area" in Corona content units. The "safe&nbsp;area" is the rectangular region where it's safe to place important UI elements, ensuring that they are not obscured by status bars, device aspects like a sensor bar or rounded corners, software buttons, TV overscan areas, etc.

For devices which do __not__ feature the concept of a safe area, this value is the same as [display.actualContentHeight][api.library.display.actualContentHeight].


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
