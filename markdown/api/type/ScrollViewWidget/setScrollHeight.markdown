# object:setScrollHeight()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scroll view, ScrollViewWidget, setScrollHeight
> __See also__          [object:setScrollWidth()][api.type.ScrollViewWidget.setScrollWidth]
>						[widget.newScrollView()][api.library.widget.newScrollView]
>						[ScrollViewWidget][api.type.ScrollViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Updates the scrollable content height of a [ScrollViewWidget][api.type.ScrollViewWidget], meaning the total amount that the user can scroll the view in the vertical direction.

## Syntax

	object:setScrollHeight( newHeight )

##### newHeight ~^(required)^~
_[Number][api.type.Number]._ The new scrollable content height.

## Example

``````lua
scrollView:setScrollHeight( 2000 )
``````