# object:getContentPosition()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scroll view, ScrollViewWidget, getContentPosition
> __See also__          [widget.newScrollView()][api.library.widget.newScrollView]
>						[ScrollViewWidget][api.type.ScrollViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the __x__ and __y__ coordinates of the [ScrollViewWidget][api.type.ScrollViewWidget] content.

## Gotchas

This function only returns the correct values if the padding along the appropriate axis is set to `0`, in specific `leftPadding` and `rightPadding` for __x__ values or `topPadding` and `bottomPadding` for __y__ values.

## Syntax

	object:getContentPosition()

## Example

`````lua
local x, y = scrollView:getContentPosition()
`````