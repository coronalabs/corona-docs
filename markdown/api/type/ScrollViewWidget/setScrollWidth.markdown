# object:setScrollWidth()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scroll view, ScrollViewWidget, setScrollWidth
> __See also__          [object:setScrollHeight()][api.type.ScrollViewWidget.setScrollHeight]
>						[widget.newScrollView()][api.library.widget.newScrollView]
>						[ScrollViewWidget][api.type.ScrollViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Updates the scrollable content width of a [ScrollViewWidget][api.type.ScrollViewWidget], meaning the total amount that the user can scroll the view in the horizontal direction.

## Syntax

	object:setScrollWidth( newWidth )

##### newWidth ~^(required)^~
_[Number][api.type.Number]._ The new scrollable content width.

## Example

`````lua
scrollView:setScrollWidth( 900 )
`````

