# object:scrollToY()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table view, list view, TableViewWidget, scrollToY
> __See also__          [object:scrollToIndex()][api.type.TableViewWidget.scrollToIndex]
>						[widget.newTableView()][api.library.widget.newTableView]
>						[TableViewWidget][api.type.TableViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Makes a [TableViewWidget][api.type.TableViewWidget] scroll to a specific __y__ position. Note that the current __y__ position can be retrieved with [object:getContentPosition()][api.type.TableViewWidget.getContentPosition].

## Syntax

	object:scrollToY( options )

This function requires a single argument, `options`, which is a table that accepts the following parameters:

##### y ~^(required)^~
_[Number][api.type.Number]._ The __y__ position to scroll to.

##### time ~^(optional)^~
_[Number][api.type.Number]._ Time in milliseconds to scroll to the specified position. For an instantaneous effect (no&nbsp;transition), set this to `0`. Default is `400`.

##### onComplete ~^(optional)^~
_[Function][api.type.Function]._ An optional function that will be called when the scroll completes.

## Example

``````lua
local function scrollComplete()
    print( "Scroll complete!" )
end

-- Scroll the table view to -300
tableView:scrollToY( { y=-300, time=600, onComplete=scrollComplete } )
``````
