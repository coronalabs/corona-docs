# object:scrollToIndex()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table view, list view, TableViewWidget, scrollToIndex
> __See also__          [object:scrollToY()][api.type.TableViewWidget.scrollToY]
>						[widget.newTableView()][api.library.widget.newTableView]
>						[TableViewWidget][api.type.TableViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Makes a [TableViewWidget][api.type.TableViewWidget] scroll to a specific row.

<!---

When complete, the top of the row will be at the top position of the table view (plus its `topPadding` value, if any).

-->

## Syntax

	object:scrollToIndex( rowIndex, time, onComplete )

##### rowIndex ~^(required)^~
_[Number][api.type.Number]._ The row index to scroll to.

##### time ~^(optional)^~
_[Number][api.type.Number]._ Time in milliseconds to scroll to the specified row index. For an instantaneous effect (no&nbsp;transition), set this to `0`. Default is `400`.

##### onComplete ~^(optional)^~
_[Function][api.type.function]._ An optional function that will be called when the scroll completes.


## Example

``````lua
local function scrollComplete()
    print( "Scroll complete!" )
end

-- Scroll to row #20
tableView:scrollToIndex( 20, 800, scrollComplete )
``````
