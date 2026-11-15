
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
	display.getSafeAreaInsets( options )

##### options ~^(optional)^~
_[Table][api.type.Table]._ A table that accepts the following key:

* `cornerAdaptation` &mdash; [String][api.type.String], either `"vertical"` or `"horizontal"`. Returns a safe area for content placed in a corner of the screen. One axis grows just enough to clear a rounded display corner or the iPad window controls: `"vertical"` brings the top and bottom insets in, and `"horizontal"` brings the left and right insets in. Use this for a small corner element, such as a pause button. Leave it out for the main layout, so you don't lose a strip along every edge.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* `cornerAdaptation` requires iOS&nbsp;26, iPadOS&nbsp;26, or tvOS&nbsp;26 or later. On other platforms and older versions, it returns the same values as calling the function without options.

* For the exact position of a camera cutout or a fold, see [display.getReservedRegions()][api.library.display.getReservedRegions].

</div>


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

-- Place a pause button in the top-left corner, clear of a rounded display corner
local cTop, cLeft = display.getSafeAreaInsets( { cornerAdaptation = "vertical" } )
local pauseButton = display.newRect( display.screenOriginX + cLeft + 20, display.screenOriginY + cTop + 20, 40, 40 )
``````
