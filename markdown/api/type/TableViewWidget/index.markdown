# TableViewWidget

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__			[GroupObject][api.type.GroupObject]
> __Library__			[widget.*][api.library.widget]
> __Return Value__		[Group][api.type.GroupObject]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			table view, list view, TableViewWidget
> __See also__			[widget.newTableView()][api.library.widget.newTableView]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

TableViewWidget objects are created using [widget.newTableView()][api.library.widget.newTableView].


## Gotchas

The TableViewWidget object contains a mask which constrains its view to the defined width and height. There is a nested masking limit of 3, so care must be taken when inserting masked objects into other masked objects which act as containers, including [display.newContainer][api.library.display.newContainer], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], or a masked [display&nbsp;group][api.type.GroupObject]. Other display objects that utilize masks include [display.newText][api.library.display.newText], [display.newEmbossedText][api.library.display.newEmbossedText], and any other [masked][api.type.Mask] display object. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.


## Properties

_(Inherits properties from [GroupObject][api.type.GroupObject])_


## Methods

_(Inherits methods from [GroupObject][api.type.GroupObject])_

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