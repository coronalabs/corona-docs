# object:insertRow()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]   
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table view, list view, TableViewWidget, insertRow
> __See also__          [widget.newTableView()][api.library.widget.newTableView]
>						[TableViewWidget][api.type.TableViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This method is used for inserting rows into a [TableViewWidget][api.type.TableViewWidget].

## Syntax

	object:insertRow( options )

This function requires a single argument, `options`, which is a table that accepts the following parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification to assign to the row. Default value is the row's index.

##### rowHeight ~^(optional)^~
_[Number][api.type.Number]._ The total height of the row in pixels.

##### rowColor ~^(optional)^~
_[Table][api.type.Table]._ Table of two RGB+A color settings, one each for the default and over states.

<div class="code-indent" style="width:500px;">

``````lua
rowColor = { default={ 1, 1, 1 }, over={ 1, 0.5, 0, 0.2 } }
``````

</div>

##### lineColor ~^(optional)^~
_[Table][api.type.Table]._ A table of RGB+A values that define the color of the separator line, assuming lines are set to visible.

<div class="code-indent" style="width:500px;">

``````lua
lineColor = { 0.5, 0.5, 0.5 }
``````

</div>

##### isCategory ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the row will be rendered as a category row. Category rows "stick" to the top of the table view as the user scrolls, indicating that the rows underneath are part of that category.

##### params ~^(optional)^~
_[Table][api.type.Table]._ A table which can contain information pertaining to the specific row. This information can then be accessed (read) in the row rendering function via `event.row.params` and in the row touch listener via `event.target.params`.


## Example

``````lua
-- Insert 40 rows
for i = 1, 40 do

    local isCategory = false
    local rowHeight = 36
    local rowColor = { default={ 1, 1, 1 }, over={ 1, 0.5, 0, 0.2 } }
    local lineColor = { 0.5, 0.5, 0.5 }

    -- Make some rows categories
    if ( i == 1 or i == 21 ) then
        isCategory = true
        rowHeight = 40
        rowColor = { default={ 0.8, 0.8, 0.8, 0.8 } }
        lineColor = { 1, 0, 0 }
    end

    -- Insert a row into the tableView
    tableView:insertRow(
        {
            isCategory = isCategory,
            rowHeight = rowHeight,
            rowColor = rowColor,
            lineColor = lineColor,
            params = {}  -- Include custom data in the row
        }
    )
end
``````
