# widget.newPickerWheel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [PickerWheelWidget][api.type.PickerWheelWidget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, picker, pickerWheel
> __See also__          [PickerWheelWidget][api.type.PickerWheelWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a [PickerWheelWidget][api.type.PickerWheelWidget] object.


## Gotchas

* To conserve texture memory, a [PickerWheelWidget][api.type.PickerWheelWidget] object can only be visually customized using an [image&nbsp;sheet][api.library.graphics.newImageSheet].

* [PickerWheelWidget][api.type.PickerWheelWidget] objects do not support [scaling][api.type.DisplayObject.scale] nor changing the width/height via [.width][api.type.DisplayObject.width] or [.height][api.type.DisplayObject.height]. If you want to implement a <nobr>custom-size</nobr> picker wheel to suit your user interface, please see [Resizable Construction](#resizable) below.


## Syntax

	widget.newPickerWheel( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification to assign to the picker wheel. Default is `widget_pickerWheel`.

##### x, y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.

##### left, top ~^(optional)^~
_[Numbers][api.type.Number]._ The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.

##### columns ~^(required)^~
_[Table][api.type.Table]._ A table which contains a sub-table for each individual column within the picker wheel. See [Configuring&nbsp;Columns](#columnconfig) below.

##### style ~^(optional)^~
_[String][api.type.String]._ Indicates the picker wheel construction style. If set to `"resizable"`, construction will adhere to the design outlined in [Resizable Construction](#resizable) below. If omitted, construction will adhere to a fixed size of 320&times;222.

##### onValueSelected ~^(optional)^~
_[Listener][api.type.Listener]._ Optional listener function which is triggered when the user selects an item in the picker wheel, or upon calling [object:selectValue()][api.type.PickerWheelWidget.selectValue].


## Methods

#### [object:getValues()][api.type.PickerWheelWidget.getValues]

#### [object:selectValue()][api.type.PickerWheelWidget.selectValue]


<a id="columnconfig"></a>

## Configuring Columns

Columns within the picker wheel are defined by an ordered series of <nobr>sub-tables</nobr> within the required `columns` table. These columns will be added to the picker wheel from left to right, in the order you define them.

Each sub-table within the `columns` table accepts the following parameters:

##### labels ~^(required)^~
_[Table][api.type.Table]._ A table of ordered values that represent the label for each row in the column. For example:

``````lua
labels = { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" }
``````

##### width ~^(optional)^~
_[Number][api.type.Number]._ By default, columns are split evenly between the picker wheel's viewable area, but a column's width can be defined via the `width` property&nbsp;&mdash; this allows you to resize each column width to better fit its defined labels.

##### align ~^(optional)^~
_[String][api.type.String]._ Specifies the alignment of the text labels within the column. Acceptable values are `"left"`, `"center"`, or `"right"`. Default is `"center"`.

##### labelPadding ~^(optional)^~
_[Number][api.type.Number]._ An optional number of pixels to pad/offset the picker column labels. If `align` is set to `"left"`, padding will occur from the left edge of the column; if `align` is set to `"right"`, padding will occur from the right edge. <nobr>Default is `6`.</nobr>

##### startIndex ~^(required)^~
_[Number][api.type.Number]._ The column's <nobr>initially-selected</nobr> row. This cannot be set higher than the column's total range of values.


## Basic Visual Options

##### font ~^(optional)^~
_[String][api.type.String]._ Font used for the picker wheel column entries. Default is [native.systemFont][api.library.native.systemFont].

##### fontSize ~^(optional)^~
_[Number][api.type.Number]._ Font size (in pixels) for the picker wheel column entries. Default is `22`.

##### fontColor ~^(optional)^~
_[Table][api.type.Table]._ Table specifying an RGB+A color for the font color of the "unselected" picker wheel labels.

``````lua
fontColor = { 0.2, 0.2, 0.2 }
``````

##### fontColorSelected ~^(optional)^~
_[Table][api.type.Table]._ Table specifying an RGB+A color for the font color of the "selected" picker wheel labels.

``````lua
fontColorSelected = { 1, 0, 0 }
``````

##### columnColor ~^(optional)^~
_[Table][api.type.Table]._ Table specifying an RGB+A color setting for the background color of the picker wheel columns.

``````lua
columnColor = { 0.8, 0.8, 0.8 }
``````




<a id="resizable"></a>

## Resizable Construction

Resizable picker wheels can be constructed at a size which fits your user interface&nbsp;&mdash; simply set `style` to `"resizable"` in the widget constructor parameters and include these additional required parameters:

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* The border/overlay frame construction is optional, but if you want to include a border, you must specify __all__ of the frame indices necessary to construct it (eight&nbsp;in&nbsp;total).

* Resizable picker wheels are __not__ compatible with legacy widget themes. If you're implementing a resizable picker wheel, you should explicitly set a <nobr>non-legacy</nobr> theme via [widget.setTheme()][api.library.widget.setTheme], such as `"widget_theme_android_holo_dark"`, `"widget_theme_android_holo_light"`, or `"widget_theme_ios7"`.

</div>

##### width ~^(required)^~
_[Number][api.type.Number]._ An integer which sets the overall width of the picker wheel.

##### rowHeight ~^(required)^~
_[Number][api.type.Number]._ An integer which sets the height of each row in the picker wheel's columns. Because picker wheels are strictly designed to display 5 rows&nbsp;&mdash; a&nbsp;center selection row for the selected options along with two additional rows above and below&nbsp;&mdash; the overall height of the picker wheel will be 5 times this value. For instance, if you set `rowHeight` to `40`, the resulting picker wheel will be 200 pixels in overall height.

<div style="margin-top: 11px;" class="clear"></div>

In addition, you can visually customize resizable picker wheels using frames from an [image&nbsp;sheet][api.library.graphics.newImageSheet].
As indicated in the following image, this includes:

* An optional border overlay of eight frames constructed from <nobr>four corners (__1__)</nobr>, upper/lower <nobr>horizontal spans (__2__)</nobr>, and left/right <nobr>vertical spans (__3__)</nobr>. The&nbsp;span frames will be stretched to fill the space between the corner frames.
* An optional <nobr>top fade span (__4__)</nobr> and <nobr>bottom fade span (__5__)</nobr>. These will be stretched to the full width of the picker wheel.
* Optional upper and lower frames <nobr>(__6__ and __7__)</nobr> which span across the vertical center to highlight the "selection" row. These will be stretched to the full width of the picker wheel.
* Optional separator/divider (__8__) that will be automatically placed between the columns (underneath&nbsp;the border overlay and above the other&nbsp;elements).

<div style="max-width: 336px">

![][images.simulator.widget-pickerwheel-resizable]

</div>

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image&nbsp;sheet][api.library.graphics.newImageSheet] object for the picker wheel.

##### topLeftFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the <nobr>top-left</nobr> corner frame of the picker wheel border/overlay.

##### topMiddleFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the <nobr>top-middle</nobr> side of the picker wheel border/overlay. This frame will be stretched to span the distance between the <nobr>top-left</nobr> and <nobr>top-right</nobr> corner frames.

##### topRightFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the <nobr>top-right</nobr> corner frame of the picker wheel border/overlay.

##### middleLeftFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the <nobr>middle-left</nobr> side of the picker wheel border/overlay. This frame will be stretched to span the distance between the <nobr>top-left</nobr> and <nobr>bottom-left</nobr> corner frames.

##### middleRightFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the <nobr>middle-right</nobr> side of the picker wheel border/overlay. This frame will be stretched to span the distance between the <nobr>top-right</nobr> and <nobr>bottom-right</nobr> corner frames.

##### bottomLeftFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the <nobr>bottom-left</nobr> corner frame of the picker wheel border/overlay.

##### bottomMiddleFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the <nobr>bottom-middle</nobr> side of the picker wheel border/overlay. This frame will be stretched to span the distance between the <nobr>bottom-left</nobr> and <nobr>bottom-right</nobr> corner frames.

##### bottomRightFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the <nobr>bottom-right</nobr> corner frame of the picker wheel border/overlay.

##### topFadeFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the top fade frame. This frame resides underneath the border/overlay and above the picker wheel columns. Its top edge aligns with the top of the picker wheel and it is stretched to span the defined width. This can be used to simulate a visual <nobr>fade-out</nobr> effect for column labels as they move outside the top edge of the wheel.

##### bottomFadeFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the bottom fade frame. This frame resides underneath the border/overlay and above the picker wheel columns. Its bottom edge aligns with the bottom of the picker wheel and it is stretched to span the defined width. This can be used to simulate a visual <nobr>fade-out</nobr> effect for column labels as they move outside the bottom edge of the wheel.

##### middleSpanTopFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the upper middle span frame. This frame resides underneath the border/overlay and above the picker wheel columns. Its top edge aligns with the top edge of the picker wheel's center selection row and it is stretched to span the defined width. If desired, the vertical alignment can be adjusted via `middleSpanOffset` as noted below.

##### middleSpanBottomFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the lower middle span frame. This frame resides underneath the border/overlay and above the picker wheel columns. Its bottom edge aligns with the bottom edge of the picker wheel's center selection row and it is stretched to span the defined width. If desired, the vertical alignment can be adjusted via `middleSpanOffset` as noted below.

##### backgroundFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the background frame that resides behind the picker wheel. This frame will be stretched to span the picker wheel's defined width and constructed height.

##### separatorFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the separator/divider frame. These separators will be automatically placed between the columns and they will be stretched to span the constructed height.

##### middleSpanOffset ~^(optional)^~
_[Number][api.type.Number]._ An offset value for both the upper and lower middle span frames. If positive, this value will offset `middleSpanTopFrame` upwards and `middleSpanBottomFrame` downwards from their default positions. This can be used to adjust the "spread" of the span frames in relation to the center selection row. Negative values are allowed.

##### borderPadding ~^(optional)^~
_[Number][api.type.Number]._ The number of pixels to pad the border/overlay on all sides. This can be used to expand the border frame beyond the picker wheel's defined width and constructed height.


## Fixed-Size Customization

Fixed-size picker wheels can be visually customized using frames from an [image&nbsp;sheet][api.library.graphics.newImageSheet]. As exhibited in the following image, this consists of three frames: an overlay (__left__), a&nbsp;background frame which resides behind the overlay (__center__), and an optional separator/divider (__right__) that will be automatically placed between the columns (underneath&nbsp;the overlay and above the&nbsp;background).

<div style="max-width: 696px">

![][images.simulator.widget-pickerwheel-standard]

</div>

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image&nbsp;sheet][api.library.graphics.newImageSheet] object for the picker wheel.

##### overlayFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the overlay edge/border frame.

##### backgroundFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the background frame that resides behind the picker wheel.

##### separatorFrame ~^(optional)^~
_[Number][api.type.Number]._ The index number for the separator/divider frame. These separators will be automatically placed between the columns.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Fixed-size picker wheels are strictly 320&times;222 pixels in size (width&times;height). If you require a <nobr>custom-size</nobr> picker wheel, please see [Resizable Construction](#resizable) above.

* When implementing <nobr>fixed-size</nobr> picker wheels, the total width of all columns should be 280&nbsp;pixels, leaving a 20&nbsp;pixel border on the left and right.

</div>


## Examples

##### Default &mdash; Resizable

``````lua
local widget = require( "widget" )

-- Set up the picker wheel columns
local columnData = 
{ 
	{ 
		align = "left",
		width = 124,
		labelPadding = 20,
		startIndex = 2,
		labels = { "Hoodie", "Short Sleeve", "Long Sleeve", "Sweatshirt" }
	},
	{
		align = "left",
		width = 96,
		labelPadding = 10,
		startIndex = 1,
		labels = { "Dark Grey", "White", "Black", "Orange" }
	},
	{
		align = "left",
		width = 60,
		labelPadding = 10,
		startIndex = 3,
		labels = { "S", "M", "L", "XL", "XXL" }
	}
}

-- Create the widget
local pickerWheel = widget.newPickerWheel(
{
	x = display.contentCenterX,
	top = display.contentHeight - 160,
	columns = columnData,
	style = "resizable",
	width = 280,
	rowHeight = 32,
	fontSize = 14
})

-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

-- Get the value for each column in the wheel, by column index
local currentStyle = values[1].value
local currentColor = values[2].value
local currentSize = values[3].value

print( currentStyle, currentColor, currentSize )
``````

##### Default &mdash; Fixed-Size

``````lua
local widget = require( "widget" )

-- Set up the picker wheel columns
local columnData =
{
	{
		align = "left",
		width = 126,
		startIndex = 2,
		labels = { "Hoodie", "Short Sleeve", "Long Sleeve", "Sweatshirt" }
	},
	{
		align = "left",
		width = 106,
		labelPadding = 10,
		startIndex = 1,
		labels = { "Dark Grey", "White", "Black", "Orange" }
	},
	{
		align = "left",
		labelPadding = 10,
		startIndex = 3,
		labels = { "S", "M", "L", "XL", "XXL" }
	}
}

-- Create the widget
local pickerWheel = widget.newPickerWheel(
{
	x = display.contentCenterX,
	top = display.contentHeight - 222,
	fontSize = 18,
	columns = columnData
})	

-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

-- Get the value for each column in the wheel, by column index
local currentStyle = values[1].value
local currentColor = values[2].value
local currentSize = values[3].value

print( currentStyle, currentColor, currentSize )
``````

##### Image Sheet &mdash; Resizable

``````lua
local widget = require( "widget" )

-- Set up the picker wheel columns
local columnData = 
{ 
	{ 
		align = "left",
		width = 124,
		labelPadding = 20,
		startIndex = 2,
		labels = { "Hoodie", "Short Sleeve", "Long Sleeve", "Sweatshirt" }
	},
	{
		align = "left",
		width = 96,
		labelPadding = 10,
		startIndex = 1,
		labels = { "Dark Grey", "White", "Black", "Orange" }
	},
	{
		align = "left",
		width = 60,
		labelPadding = 10,
		startIndex = 3,
		labels = { "S", "M", "L", "XL", "XXL" }
	}
}

-- Image sheet options and declaration
local options = {
	frames =
	{
		{ x=0, y=0, width=20, height=20 },
		{ x=20, y=0, width=120, height=20 },
		{ x=140, y=0, width=20, height=20 },
		{ x=0, y=20, width=20, height=120 },
		{ x=140, y=20, width=20, height=120 },
		{ x=0, y=140, width=20, height=20 },
		{ x=20, y=140, width=120, height=20 },
		{ x=140, y=140, width=20, height=20 },
		{ x=180, y=0, width=32, height=80 },
		{ x=224, y=0, width=32, height=80 },
		{ x=276, y=0, width=32, height=20 },
		{ x=276, y=60, width=32, height=20 },
		{ x=276, y=100, width=12, height=32 }
	},
	sheetContentWidth = 312,
	sheetContentHeight = 160
}
local pickerWheelSheet = graphics.newImageSheet( "widget-pickerwheel-resizable.png", options )

-- Create the widget
local pickerWheel = widget.newPickerWheel(
{
	x = display.contentCenterX,
	top = display.contentHeight - 176,
	columns = columnData,
	style = "resizable",
	width = 280,
	rowHeight = 32,
	fontSize = 14,
	sheet = pickerWheelSheet,
	topLeftFrame = 1,
	topMiddleFrame = 2,
	topRightFrame = 3,
	middleLeftFrame = 4,
	middleRightFrame = 5,
	bottomLeftFrame = 6,
	bottomMiddleFrame = 7,
	bottomRightFrame = 8,
	topFadeFrame = 9,
	bottomFadeFrame = 10,
	middleSpanTopFrame = 11,
	middleSpanBottomFrame = 12,
	separatorFrame = 13,
	middleSpanOffset = 4,
	borderPadding = 8
})

-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

-- Get the value for each column in the wheel, by column index
local currentStyle = values[1].value
local currentColor = values[2].value
local currentSize = values[3].value

print( currentStyle, currentColor, currentSize )
``````

##### Image Sheet &mdash; Fixed-Size

``````lua
local widget = require( "widget" )

-- Set up the picker wheel columns
local columnData =
{
	{
		align = "left",
		width = 126,
		startIndex = 2,
		labels = { "Hoodie", "Short Sleeve", "Long Sleeve", "Sweatshirt" }
	},
	{
		align = "left",
		width = 106,
		labelPadding = 10,
		startIndex = 1,
		labels = { "Dark Grey", "White", "Black", "Orange" }
	},
	{
		align = "left",
		labelPadding = 10,
		startIndex = 3,
		labels = { "S", "M", "L", "XL", "XXL" }
	}
}

-- Image sheet options and declaration
local options = {
	frames = 
	{
		{ x=0, y=0, width=320, height=222 },
		{ x=328, y=0, width=320, height=222 },
		{ x=656, y=0, width=12, height=222 }
	},
	sheetContentWidth = 668,
	sheetContentHeight = 222
}
local pickerWheelSheet = graphics.newImageSheet( "widget-pickerwheel-standard.png", options )

-- Create the widget
local pickerWheel = widget.newPickerWheel(
{
	x = display.contentCenterX,
	top = display.contentHeight - 222,
	columns = columnData,
	fontSize = 18,
	sheet = pickerWheelSheet,
	overlayFrame = 1,
	backgroundFrame = 2,
	separatorFrame = 3
})

-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

-- Get the value for each column in the wheel, by column index
local currentStyle = values[1].value
local currentColor = values[2].value
local currentSize = values[3].value

print( currentStyle, currentColor, currentSize )
``````
