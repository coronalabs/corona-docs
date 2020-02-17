# object:deleteRows()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]   
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table view, list view, TableViewWidget, deleteRows
> __See also__          [widget.newTableView()][api.library.widget.newTableView]
>						[TableViewWidget][api.type.TableViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This method is used to delete rows contained inside a [TableViewWidget][api.type.TableViewWidget].


## Syntax

	object:deleteRows( rowArray [, animationOptions] )

##### rowArray ~^(required)^~
_[Array][api.type.Array]._ A Lua array of row indices to delete, for example `{ 2,3,5 }`.

##### animationOptions ~^(optional)^~
_[Table][api.type.Table]._ An optional table of time animation options for the deletion effect. This table accepts two parameters, `slideLeftTransitionTime` and `slideUpTransitionTime`, both of which represent a time in milliseconds for the animation.


## Examples

##### Default Animation Time

``````lua
tableView:deleteRows( { 2,3,5 } )
``````

##### Custom Animation Time

``````lua
tableView:deleteRows( { 2,3,5 }, { slideLeftTransitionTime=1200, slideUpTransitionTime=400 } )
``````