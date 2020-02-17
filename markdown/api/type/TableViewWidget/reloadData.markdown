# object:reloadData()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]   
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table view, list view, TableViewWidget, reloadData
> __See also__          [widget.newTableView()][api.library.widget.newTableView]
>						[TableViewWidget][api.type.TableViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This method is used to reload <nobr>(re-render)</nobr> the visible rows of a [TableViewWidget][api.type.TableViewWidget].

## Syntax

	object:reloadData()

## Example

``````lua
-- Declare/upvalue a "fillColor" table for later reference
local fillColor = { 0, 0, 0 }

-- Handle row rendering
local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    local rowTitle = display.newText( row, "Row " .. row.index, 0, 0, nil, 14 )
    -- Set the row title fill color based on the "fillColor" table values
    rowTitle:setFillColor( fillColor[1], fillColor[2], fillColor[3] )

    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.x = 0
    rowTitle.y = rowHeight * 0.5
end

-- Create the tableView
local tableView = widget.newTableView
{
    left = 200,
    top = 200,
    height = 330,
    width = 300,
    onRowRender = onRowRender
}

-- Insert 40 rows
for i = 1, 40 do
    -- Insert a row into the tableView
    tableView:insertRow{}
end

-- Basic function to change fill color and reload data
local function tableViewReload()
    -- Change parameters of upvalue "fillColor" table
    fillColor = { 1,0,0 }
    -- Reload (re-render) visible rows
    tableView:reloadData()
end

-- After 2 seconds, call "tableViewReload()" function
timer.performWithDelay( 2000, tableViewReload, 1 )
``````
