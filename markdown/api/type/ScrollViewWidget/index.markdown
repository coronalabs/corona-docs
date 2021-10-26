# ScrollViewWidget

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__ 			[GroupObject][api.type.GroupObject]
> __Library__           [widget.*][api.library.widget]
> __Return Value__		[Group][api.type.GroupObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scroll view, ScrollViewWidget
> __See also__          [widget.newScrollView()][api.library.widget.newScrollView]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

ScrollViewWidget objects are created using [widget.newScrollView()][api.library.widget.newScrollView].


## Gotchas

The ScrollViewWidget object contains a mask which constrains its view to the defined width and height. There is a nested masking limit of 3, so care must be taken when inserting masked objects into other masked objects which act as containers, including [display.newContainer][api.library.display.newContainer], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], or a masked [display&nbsp;group][api.type.GroupObject]. Other display objects that utilize masks include [display.newText][api.library.display.newText], [display.newEmbossedText][api.library.display.newEmbossedText], and any other [masked][api.type.Mask] display object. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.


## Properties

_(Inherits properties from [GroupObject][api.type.GroupObject])_


## Methods

_(Inherits methods from [GroupObject][api.type.GroupObject])_

#### [object:getContentPosition()][api.type.ScrollViewWidget.getContentPosition]
#### [object:getView()][api.type.ScrollViewWidget.getView]
#### [object:scrollToPosition()][api.type.ScrollViewWidget.scrollToPosition]
#### [object:scrollTo()][api.type.ScrollViewWidget.scrollTo]
#### [object:setIsLocked()][api.type.ScrollViewWidget.setIsLocked]
#### [object:setScrollWidth()][api.type.ScrollViewWidget.setScrollWidth]
#### [object:setScrollHeight()][api.type.ScrollViewWidget.setScrollHeight]
#### [object:takeFocus()][api.type.ScrollViewWidget.takeFocus]
#### [object:setSize()][api.type.ScrollViewWidget.setSize]
