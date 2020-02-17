# object:getView()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scroll view, ScrollViewWidget, getView
> __See also__          [widget.newScrollView()][api.library.widget.newScrollView]
>						[ScrollViewWidget][api.type.ScrollViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a reference to the [ScrollViewWidget][api.type.ScrollViewWidget] object's view.

## Syntax

	object:getView()


## Example

`````lua
local scrollView = widget.newScrollView {
	width = 280,
	height = 400,
	left = 100,
	top = 200,
	scrollWidth = 800,
	scrollHeight =  1200
}

local view = scrollView:getView()
`````