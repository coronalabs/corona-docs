# object:setSize()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scroll view, ScrollViewWidget, setSize, width, height
> __See also__          [object:setScrollWidth()][api.type.ScrollViewWidget.setScrollWidth]
>						[object:setScrollHeight()][api.type.ScrollViewWidget.setScrollHeight]
>						[widget.newScrollView()][api.library.widget.newScrollView]
>						[ScrollViewWidget][api.type.ScrollViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Updates the width and height of a [ScrollViewWidget][api.type.ScrollViewWidget]. Note that if the scrollWidth or scrollHeight were set or changed, they will be overridden and require to be set once more after this function is called.

## Gotchas

Calling this function will mess with the x position of the scrollbar. To fix this, call [object:setScrollHeight()][api.type.ScrollViewWidget.setScrollHeight] after calling this method. If you would not like to reset the scroll height, then it might be a good idea to hide the scrollbar completely.

## Syntax

	object:setSize( newWidth, newHeight )

##### newWidth ~^(required)^~
_[Number][api.type.Number]._ The new width.

##### newHeight ~^(required)^~
_[Number][api.type.Number]._ The new height.

## Example

`````lua
scrollView:setSize( 900, 2000 )
`````

