# object:selectValue()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, picker, PickerWheelWidget, selectValue
> __See also__          [widget.newPickerWheel()][api.library.widget.newPickerWheel]
>						[PickerWheelWidget][api.type.PickerWheelWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Selects a specific row within a specific column of the [PickerWheelWidget][api.type.PickerWheelWidget]. Optionally allows you to snap directly/instantly to the row instead of via default scrolling motion.

## Gotchas

* This call will be ignored if the specified column is being controlled/manipulated by the user via touch at the time of execution.
* If the column is currently scrolling to another row (but&nbsp;is not under the user's&nbsp;control), this call will interrupt/override that process and proceed as commanded.
* If you have specified an `onValueSelected` listener function in the widget's constructor, that function will be called when this command executes.


## Syntax

	object:selectValue( targetColumn, targetIndex [, snapToIndex] )

##### targetColumn ~^(required)^~
_[Number][api.type.Number]._ Integer indicating the column to manipulate, from `1` to the total number of columns in the [PickerWheelWidget][api.type.PickerWheelWidget] <nobr>(left to right)</nobr>.

##### targetIndex ~^(required)^~
_[Number][api.type.Number]._ Integer indicating the row index to select within the specified column (`targetColumn`). This must be a valid row index from `1` to the total number of rows in the column.

##### snapToIndex ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the specified column+row selection will be instantly selected (no&nbsp;scrolling&nbsp;motion). Default is `false`.


## Example

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

-- Select the third row in the first column
pickerWheel:selectValue( 1, 3 )

-- After 4000 milliseconds (4 seconds), select the fourth row in the second column
timer.performWithDelay( 4000, function() pickerWheel:selectValue( 2, 4 ); end )
``````
