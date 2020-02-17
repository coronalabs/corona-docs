# object:getValues()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, picker, PickerWheelWidget, getValues
> __See also__          [widget.newPickerWheel()][api.library.widget.newPickerWheel]
>						[PickerWheelWidget][api.type.PickerWheelWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a table with the currently selected value/index of each column in the [PickerWheelWidget][api.type.PickerWheelWidget].

## Syntax

	object:getValues()

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

-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

-- Get the value for each column in the wheel, by column index
local currentStyle = values[1].value
local currentColor = values[2].value
local currentSize = values[3].value

print( currentStyle, currentColor, currentSize )
``````
