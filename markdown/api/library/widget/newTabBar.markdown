# widget.newTabBar()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [TabBarWidget][api.type.TabBarWidget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, tab bar, tabs, tab buttons
> __See also__          [TabBarWidget][api.type.TabBarWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a [TabBarWidget][api.type.TabBarWidget] object.


## Gotchas

* [TabBarWidget][api.type.TabBarWidget] objects do not support [scaling][api.type.DisplayObject.scale] nor changing the width/height via [.width][api.type.DisplayObject.width] or [.height][api.type.DisplayObject.height].

* [TabBarWidget][api.type.TabBarWidget] objects do not support changing the [anchorX][api.type.DisplayObject.anchorX] or [anchorY][api.type.DisplayObject.anchorY] properties after creation.


## Syntax

	widget.newTabBar( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification to assign to the tab bar. Default is `widget_tabBar`.

##### x, y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.

##### left, top ~^(optional)^~
_[Numbers][api.type.Number]._ The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.

##### width, height ~^(optional)^~
_[Numbers][api.type.Number]._ The width and height of the tab bar, in pixels. The default height is `52`.

##### buttons ~^(required)^~
_[Table][api.type.Table]._ A table that contains sub-tables of parameters/options for the individual tabs that span the bar. Please see [Configuring&nbsp;Tab&nbsp;Buttons](#buttons) below.


## Methods

#### [object:setSelected()][api.type.TabBarWidget.setSelected]


<a id="buttons"></a>

## Configuring Tab Buttons

Within the `options` table, the `buttons` table is required and must be defined. This table should contain <nobr>sub-tables</nobr> of parameters/options for the individual tab buttons that span the bar.

##### id ~^(optional)^~ 
_[String][api.type.String]._ An optional identification to assign to the tab button. Default is `button`.

##### label ~^(optional)^~ 
_[String][api.type.String]._ An optional text label that will appear along the bottom of the tab button area.

##### labelColor ~^(optional)^~  
_[Table][api.type.Table]._ Table of two RGB+A color settings, one each for the default and over states.

``````lua
labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
``````

##### labelXOffset, labelYOffset ~^(optional)^~
_[Numbers][api.type.Number]._ Optional __x__ and __y__ offsets for the tab button label. For example, `labelYOffset = -8` will shift the label 8 pixels up from default.

##### font ~^(optional)^~
_[String][api.type.String]._ Font used for the tab button label. Default is [native.systemFont][api.library.native.systemFont].

##### size ~^(optional)^~
_[Number][api.type.Number]._ Font size (in pixels) for the tab button label. Default is `8`.

##### selected ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set this to `true` to start the tab button in its selected/on state. Only one tab button should be set to `selected = true` on initialization.

##### onPress ~^(optional)^~
_[Function][api.type.Function]._ An optional function to be called when the tab button is pressed. The callback function does not require testing for `event.phase` since it only honors `began`.


## Visual Customization &mdash; Image Files

[TabBarWidget][api.type.TabBarWidget] objects can be visually customized using individual image files. These include:

1) an optional background image that spans the bar width and height (left-side gradient in the diagram)
2) three optional, equally-sized image files for tab highlight overlays (red, green, and yellow in the diagram)
3) two optional image files for each specified tab button which overlays the bar (ring images in the diagram)

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

------------------------------------------------	------------------	----------------------------------------
![][images.simulator.widget-tabbar-frames]			&nbsp;&rarr;&nbsp;	![][images.simulator.widget-tabbar-final]
------------------------------------------------	------------------	----------------------------------------

</div>

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ The base directory where your custom images are located. Default is your project folder (`system.ResourceDirectory`).

##### backgroundFile ~^(optional)^~
_[String][api.type.String]._ The background image file for the tab bar. This may be designed to be flexible in width/height.

### Highlight Overlay

You may configure an optional highlight overlay which will be placed in front of the background but behind the optional button image. Highlight overlays are composed of a left, middle, and right image file, each of which should be designed equal in size. However, if the tab is wider than the collective width of these three image files, the overlay will stretch to fit the width of the tab. In this case, the left and right edge images will remain at their original size, but the middle section will stretch to fill the distance between.

##### tabSelectedLeftFile ~^(required)^~
_[String][api.type.String]._ The left edge image file for the tab highlight overlay.

##### tabSelectedMiddleFile ~^(required)^~
_[String][api.type.String]._ The middle image file for the tab highlight overlay. This should be designed to be flexible in width.

##### tabSelectedRightFile ~^(required)^~
_[String][api.type.String]._ The right edge image file for the tab highlight overlay.

##### tabSelectedFrameWidth, tabSelectedFrameHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width and height of each highlight overlay image. All three sections should be designed equal in size.

### Tab Buttons

Within each sub-table of the `buttons` table (see [Configuring&nbsp;Tab&nbsp;Buttons](#buttons)), you may add additional parameters to visually customize the button. Note that individual buttons can have a unique style according to the specified images.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ The base directory where the custom image is located. Default is your project folder (`system.ResourceDirectory`).

##### defaultFile ~^(required)^~  
_[String][api.type.String]._  The file name of the tab button default image (the "un-selected" state).

##### overFile ~^(required)^~ 
_[String][api.type.String]._ The file name of the tab button over image (the "selected" state).

##### width, height ~^(required)^~
_[Numbers][api.type.Number]._ The width and height of the `defaultFile` and `overFile` images.



## Visual Customization &mdash; Image Sheet

[TabBarWidget][api.type.TabBarWidget] objects can be visually customized using frames from an [image&nbsp;sheet][api.library.graphics.newImageSheet]. These include:

1) an optional background frame that spans the bar width and height (left-side gradient in the diagram)
2) three optional, equally-sized image frames for tab highlight overlays (red, green, and yellow in the diagram)
3) two optional image frames for each specified tab button which overlays the bar (ring images in the diagram)

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

------------------------------------------------	------------------	----------------------------------------
![][images.simulator.widget-tabbar-sheet]			&nbsp;&rarr;&nbsp;	![][images.simulator.widget-tabbar-final]
------------------------------------------------	------------------	----------------------------------------

</div>

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image&nbsp;sheet][api.library.graphics.newImageSheet] object for the tab bar.

##### backgroundFrame ~^(optional)^~
_[String][api.type.String]._ The background image frame for the tab bar. This may be designed to be flexible in width/height.

##### backgroundFrameWidth, backgroundFrameHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width and height of the background frame.

### Highlight Overlay

You may configure an optional highlight overlay which will be placed in front of the background but behind the optional button image. Highlight overlays are composed of a left, middle, and right image frame, each of which should be designed equal in size. However, if the tab is wider than the collective width of these three image frames, the overlay will stretch to fit the width of the tab. In this case, the left and right edge frames will remain at their original size, but the middle section will stretch to fill the distance between.

##### tabSelectedLeftFrame ~^(required)^~
_[String][api.type.String]._ The left edge image frame for the tab highlight overlay.

##### tabSelectedMiddleFrame ~^(required)^~
_[String][api.type.String]._ The middle image frame for the tab highlight overlay. This should be designed to be flexible in width.

##### tabSelectedRightFrame ~^(required)^~
_[String][api.type.String]._ The right edge image frame for the tab highlight overlay.

##### tabSelectedFrameWidth, tabSelectedFrameHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width and height of each highlight overlay frame. All three sections should be designed equal in size.

### Tab Buttons

Within each sub-table of the `buttons` table (see [Configuring&nbsp;Tab&nbsp;Buttons](#buttons)), you may add additional parameters to visually customize the button. Note that individual buttons can have a unique style according to the specified frames.

##### defaultFrame ~^(required)^~  
_[String][api.type.String]._   The index number for the default frame of the tab button (the "un-selected" state).

##### overFrame ~^(required)^~ 
_[String][api.type.String]._ The index number for the over frame of the tab button (the "selected" state).


## Examples

##### Default

``````lua
local widget = require( "widget" )

-- Function to handle button events
local function handleTabBarEvent( event )
	print( event.target.id )  -- Reference to button's 'id' parameter
end

-- Configure the tab buttons to appear within the bar
local tabButtons = {
	{
		label = "Tab1",
		id = "tab1",
		selected = true,
		onPress = handleTabBarEvent
	},
	{
		label = "Tab2",
		id = "tab2",
		onPress = handleTabBarEvent
	},
	{
		label = "Tab3",
		id = "tab3",
		onPress = handleTabBarEvent
	}
}

-- Create the widget
local tabBar = widget.newTabBar(
	{
		top = display.contentHeight-120,
		width = display.contentWidth,
		buttons = tabButtons
	}
)
``````

##### Image Files

``````lua
local widget = require( "widget" )

-- Function to handle button events
local function handleTabBarEvent( event )
	print( event.target.id )  -- Reference to button's 'id' parameter
end

-- Configure the tab buttons to appear within the bar
local tabButtons = {
	{
		width = 72, 
		height = 120,
		defaultFile = "tabBarIconDef.png",
		overFile = "tabBarIconOver.png",
		label = "Tab1",
		id = "tab1",
		selected = true,
		size = 16,
		labelYOffset = -8,
		onPress = handleTabBarEvent
	},
	{
		width = 72, 
		height = 120,
		defaultFile = "tabBarIconDef.png",
		overFile = "tabBarIconOver.png",
		label = "Tab2",
		id = "tab2",
		size = 16,
		labelYOffset = -8,
		onPress = handleTabBarEvent
	},
	{
		width = 72, 
		height = 120,
		defaultFile = "tabBarIconDef.png",
		overFile = "tabBarIconOver.png",
		label = "Tab3",
		id = "tab3",
		size = 16,
		labelYOffset = -8,
		onPress = handleTabBarEvent
	}
}

-- Create the widget
local tabBar = widget.newTabBar(
	{
		left = 0,
		top = display.contentHeight-120,
		width = 580,
		height = 120,
		backgroundFile = "tabBarBack.png",
		tabSelectedLeftFile = "tabBarSelL.png",
		tabSelectedRightFile = "tabBarSelR.png",
		tabSelectedMiddleFile = "tabBarSelM.png",
		tabSelectedFrameWidth = 40,
		tabSelectedFrameHeight = 120,
		buttons = tabButtons
	}
)
``````

##### Image Sheet

``````lua
local widget = require( "widget" )

-- Function to handle button events
local function handleTabBarEvent( event )
	print( event.target.id )  -- Reference to button's 'id' parameter
end

-- Image sheet options and declaration
-- For testing, you may copy/save the image under "Visual Customization: Image Sheet" above
local options = {
	frames =
	{
		{ x=4, y=0, width=24, height=120 },
		{ x=32, y=0, width=40, height=120 },
		{ x=72, y=0, width=40, height=120 },
		{ x=112, y=0, width=40, height=120 },
		{ x=152, y=0, width=72, height=120 },
		{ x=224, y=0, width=72, height=120 }
	},
	sheetContentWidth = 296,
	sheetContentHeight = 120
}
local tabBarSheet = graphics.newImageSheet( "widget-tabbar-sheet.png", options )

-- Configure the tab buttons to appear within the bar
local tabButtons = {
	{
		defaultFrame = 5,
		overFrame = 6,
		label = "Tab1",
		id = "tab1",
		selected = true,
		size = 16,
		labelYOffset = -8,
		onPress = handleTabBarEvent
	},
	{
		defaultFrame = 5,
		overFrame = 6,
		label = "Tab2",
		id = "tab2",
		size = 16,
		labelYOffset = -8,
		onPress = handleTabBarEvent
	},
	{
		defaultFrame = 5,
		overFrame = 6,
		label = "Tab3",
		id = "tab3",
		size = 16,
		labelYOffset = -8,
		onPress = handleTabBarEvent
	}
}

local tabBar = widget.newTabBar(
	{
		sheet = tabBarSheet,
		left = 0,
		top = display.contentHeight-120,
		width = 580,
		height = 120,
		backgroundFrame = 1,
		tabSelectedLeftFrame = 2,
		tabSelectedMiddleFrame = 3,
		tabSelectedRightFrame = 4,
		tabSelectedFrameWidth = 40,
		tabSelectedFrameHeight = 120,
		buttons = tabButtons
	}
)
``````
