# object:scrollToPosition()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scroll view, ScrollViewWidget, scrollToPosition
> __See also__          [object:scrollTo()][api.type.ScrollViewWidget.scrollTo]
>						[widget.newScrollView()][api.library.widget.newScrollView]
>						[ScrollViewWidget][api.type.ScrollViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Makes a [ScrollViewWidget][api.type.ScrollViewWidget] scroll to a specific __x__ or __y__ position.


## Syntax

	object:scrollToPosition( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### x ~^(optional)^~
_[Number][api.type.Number]._ The __x__ position to scroll to. If you only want to scroll vertically, you should omit this parameter.

##### y ~^(optional)^~
_[Number][api.type.Number]._ The __y__ position to scroll to. If you only want to scroll horizontally, you should omit this parameter.

##### time ~^(optional)^~
_[Number][api.type.Number]._ Time in milliseconds to scroll to the specified coordinate(s). For an instantaneous effect (no&nbsp;transition), set this to `0`. Default is `400`.

##### onComplete ~^(optional)^~ 
_[Function][api.type.Function]._ An optional function that will be called when the scroll completes.


## Example

``````lua
local function onScrollComplete()
    print( "Scroll complete!" )
end

scrollView:scrollToPosition
{
    x = 100,
    y = -100,
    time = 800,
    onComplete = onScrollComplete
}
``````
