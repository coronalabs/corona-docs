# widget.newTableView()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [TableViewWidget][api.type.TableViewWidget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, tableview, lists, listview
> __See also__          [TableViewWidget][api.type.TableViewWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a [TableViewWidget][api.type.TableViewWidget] object.


## Gotchas

* The [TableViewWidget][api.type.TableViewWidget] object contains a mask which constrains its view to the defined width and height. There is a nested masking limit of 3, so care must be taken when inserting masked objects into other masked objects which act as containers, including [display.newContainer][api.library.display.newContainer], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], or a masked [display&nbsp;group][api.type.GroupObject]. Other display objects that utilize masks include [display.newText][api.library.display.newText], [display.newEmbossedText][api.library.display.newEmbossedText], and any other [masked][api.type.Mask] display object. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.

* The [TableViewWidget][api.type.TableViewWidget] object does not support [scaling][api.type.DisplayObject.scale].


## Syntax

	widget.newTableView( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification string to assign to the table view. Default is `widget_tableView`.

##### x, y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.

##### left, top ~^(optional)^~
_[Numbers][api.type.Number]._ The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.

##### width, height ~^(optional)^~
_[Numbers][api.type.Number]._ The width and height of the table view.

##### friction ~^(optional)^~
_[Number][api.type.Number]._ Determines how fast the content travels when it is flicked up or down. The default value is `0.972`.

##### maxVelocity ~^(optional)^~
_[Number][api.type.Number]._ Limits the maximum scrolling speed of the table view. The default value is `2`.

##### isLocked ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the table view will be locked, meaning it cannot be scrolled vertically.

##### isBounceEnabled ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `false`, the table view will simply stop scrolling when it reaches the upper or lower limit. Default is `true`.

##### rowTouchDelay ~^(optional)^~
_[Number][api.type.Number]._ Specifies the delay, in milliseconds, until the row touch event is propagated. Default is `110` milliseconds.

##### onRowRender ~^(optional)^~
_[Listener][api.type.Listener]._ The function used to listen for [TableViewWidget][api.type.TableViewWidget] row rendering events. This function is called when a row is added via [object:insertRow()][api.type.TableViewWidget.insertRow], when all visible rows are <nobr>re-rendered</nobr> via [object:reloadData()][api.type.TableViewWidget.reloadData], or when an <nobr>off-screen</nobr> row moves back on screen. In this function, `event.row` is a reference to the row that was rendered.

##### onRowTouch ~^(optional)^~
_[Listener][api.type.Listener]._ The function used to listen for [TableViewWidget][api.type.TableViewWidget] touch/tap events. In this listener function, the `event.phase` values include `"tap"`, `"press"`, `"release"`, `"swipeLeft"`, and `"swipeRight"`. In addition, `event.target` is a reference to the row that was interacted with and `event.target.index` is the index number of that row.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ The function used to listen for [TableViewWidget][api.type.TableViewWidget] touch/scroll events. In this listener function, `event.phase` returns the expected touch interaction phases of `"began"`, `"moved"`, or `"ended"`. In addition, a `"stopped"` phase can be detected when the table view flick/swipe momentum naturally comes to a stop. Finally, the scroll limit in either direction can be detected by `event.limitReached`. If this occurs, `event.direction` returns either `"up"` or `"down"` depending on the direction the table view was moving when the limit was reached.


## Methods

#### [object:insertRow()][api.type.TableViewWidget.insertRow]
#### [object:reloadData()][api.type.TableViewWidget.reloadData]
#### <strike> [object:deleteRow()][api.type.TableViewWidget.deleteRow] </strike>
#### [object:deleteRows()][api.type.TableViewWidget.deleteRows]
#### [object:deleteAllRows()][api.type.TableViewWidget.deleteAllRows]
#### [object:scrollToY()][api.type.TableViewWidget.scrollToY]
#### [object:scrollToIndex()][api.type.TableViewWidget.scrollToIndex]
#### [object:setIsLocked()][api.type.TableViewWidget.setIsLocked]
#### [object:getContentPosition()][api.type.TableViewWidget.getContentPosition]
#### [object:getNumRows()][api.type.TableViewWidget.getNumRows]
#### [object:getRowAtIndex()][api.type.TableViewWidget.getRowAtIndex]


## Visual Options

The table view widget can be visually customized using the following parameters within the `options` table:

##### noLines ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, lines will not separate individual rows. The default value is `false`.

##### backgroundColor ~^(optional)^~
_[Table][api.type.Table]._ Table containing the RGB+A background color setting. Default is white.

``````lua
backgroundColor = { 0.8, 0.8, 0.8 }
``````

##### hideBackground ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the background of the table view will be hidden, but it still receives touches.

##### hideScrollBar ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the scroll bar will not appear for the table view.

##### scrollBarOptions ~^(optional)^~
_[Table][api.type.Table]._ Table containing the [image&nbsp;sheet][api.library.graphics.newImageSheet] specifications for a custom scroll bar. Customizing the scroll bar requires 3 frames from an image sheet. Each frame needs to be a square of equal size. Inside the `scrollBarOptions` table, you must specify 4 required parameters: `sheet`, `topFrame`, `middleFrame`, and `bottomFrame`.

``````lua
scrollBarOptions = {
    sheet = scrollBarSheet,  -- Reference to the image sheet
    topFrame = 1,            -- Number of the "top" frame
    middleFrame = 2,         -- Number of the "middle" frame
    bottomFrame = 3          -- Number of the "bottom" frame
}
``````

##### topPadding, bottomPadding ~^(optional)^~
_[Numbers][api.type.Number]._ These numbers represent the number of pixels from the top and bottom of the table view at which the content will stop when it reaches the respective limit. The default value for both is `0`.


## Inserting Rows

When you create a table view, it simply creates an empty region of the specified width and height. The actual rows are "rendered" via the [object:insertRow()][api.type.TableViewWidget.insertRow] function.

To accomplish this, some basic setup is required. First, write a target listener function to render new rows, for example:

``````lua
local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    local rowTitle = display.newText( row, "Row " .. row.index, 0, 0, nil, 14 )
    rowTitle:setFillColor( 0 )

    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.x = 0
    rowTitle.y = rowHeight * 0.5
end
``````

Next, specify the function in the `onRowRender` parameter of the table view declaration. At this point, you can call [object:insertRow()][api.type.TableViewWidget.insertRow] to insert a new row, or execute the call in a loop to render several rows at once. Please refer to the usage examples below.


## Examples

##### Basic TableView

``````lua
local widget = require( "widget" )

-- The "onRowRender" function may go here (see example under "Inserting Rows", above)

-- Create the widget
local tableView = widget.newTableView(
	{
		left = 200,
		top = 200,
		height = 330,
		width = 300,
		onRowRender = onRowRender,
		onRowTouch = onRowTouch,
		listener = scrollListener
	}
)

-- Insert 40 rows
for i = 1, 40 do
    -- Insert a row into the tableView
    tableView:insertRow{}
end
``````

##### TableView with Category Rows

``````lua
local widget = require( "widget" )

-- The "onRowRender" function may go here (see example under "Inserting Rows", above)

-- Create the widget
local tableView = widget.newTableView(
	{
		left = 200,
		top = 200,
		height = 330,
		width = 300,
		onRowRender = onRowRender,
		onRowTouch = onRowTouch,
		listener = scrollListener
	}
)

-- Insert 40 rows
for i = 1, 40 do

    local isCategory = false
    local rowHeight = 36
    local rowColor = { default={1,1,1}, over={1,0.5,0,0.2} }
    local lineColor = { 0.5, 0.5, 0.5 }

    -- Make some rows categories
    if ( i == 1 or i == 21 ) then
        isCategory = true
        rowHeight = 40
        rowColor = { default={0.8,0.8,0.8,0.8} }
        lineColor = { 1, 0, 0 }
    end

    -- Insert a row into the tableView
    tableView:insertRow(
        {
            isCategory = isCategory,
            rowHeight = rowHeight,
            rowColor = rowColor,
            lineColor = lineColor
        }
    )
end
``````

##### TableView with Custom Scroll Bar

``````lua
local widget = require( "widget" )

-- The "onRowRender" function may go here (see example under "Inserting Rows", above)

-- Create image sheet for custom scroll bar
local scrollBarOpt = {
    width = 20,
    height = 20,
    numFrames = 3,
    sheetContentWidth = 20,
    sheetContentHeight = 60
}
local scrollBarSheet = graphics.newImageSheet( "scrollBar.png", scrollBarOpt )

-- Create the widget
local tableView = widget.newTableView(
	{
		left = 200,
		top = 200,
		height = 330,
		width = 300,
		onRowRender = onRowRender,
		onRowTouch = onRowTouch,
		listener = scrollListener,
		scrollBarOptions = {
			sheet = scrollBarSheet,
			topFrame = 1,
			middleFrame = 2,
			bottomFrame = 3
		}
	}
)

-- Insert 40 rows
for i = 1, 40 do

    -- Insert a row into the tableView
    tableView:insertRow(
        {
            isCategory = false,
            rowHeight = 36,
            rowColor = { default={1,1,1}, over={1,0.5,0,0.2} },
            lineColor = { 0.5, 0.5, 0.5 }
        }
    )
end
``````
