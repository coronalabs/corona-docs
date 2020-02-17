# object:getRowAtIndex()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [GroupObject][api.type.GroupObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table view, list view, TableViewWidget, getRowAtIndex
> __See also__          [widget.newTableView()][api.library.widget.newTableView]
>						[TableViewWidget][api.type.TableViewWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns the row group reference to a specific __visible__ row in a [TableViewWidget][api.type.TableViewWidget].


## Syntax

	object:getRowAtIndex( rowIndex )

##### rowIndex ~^(required)^~
_[Number][api.type.Number]._ The index of the row.


## Gotchas

* The `rowIndex` value must be within the range of rows in the table view.

* This function will return `nil` if the row is not currently visible in the table view.


## Example

``````lua
local rowIndex = 4

if ( tableView:getNumRows() >= rowIndex ) then

    local ind = tableView:getRowAtIndex( rowIndex )
    if ( ind ) then
        print( "Row group:", ind )
    else
        print( "Row "..rowIndex.." is not currently visible!" )
    end
end
``````
