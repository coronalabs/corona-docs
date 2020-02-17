# object:deleteRow()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]   
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table view, list view, TableViewWidget, deleteRow
> __See also__          [object:deleteRows()][api.type.TableViewWidget.deleteRows]
>						[widget.newTableView()][api.library.widget.newTableView]
>						[TableViewWidget][api.type.TableViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This method is used to delete a row contained inside a [TableViewWidget][api.type.TableViewWidget].


## Gotchas

This method may be deprecated in the future, so it's recommended that you convert to the [object:deleteRows()][api.type.TableViewWidget.deleteRows] method which accepts multiple row deletion and animation time parameters for the deletion effect.


## Syntax

	object:deleteRow( rowIndex )

##### rowIndex ~^(required)^~
_[Number][api.type.Number]._ The row index to delete.