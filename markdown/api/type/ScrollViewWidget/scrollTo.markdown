# object:scrollTo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scroll view, ScrollViewWidget, scrollTo
> __See also__          [object:scrollToPosition()][api.type.ScrollViewWidget.scrollToPosition]
>						[widget.newScrollView()][api.library.widget.newScrollView]
>						[ScrollViewWidget][api.type.ScrollViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Makes a [ScrollViewWidget][api.type.ScrollViewWidget] scroll to a specified position constant.


## Syntax

	object:scrollTo( position, options )

##### position ~^(required)^~
_[String][api.type.String]._ This is the position you wish to scroll to. Valid options are `"top"`, `"bottom"`, `"left"`, or `"right"`.

##### options ~^(required)^~
_[Table][api.type.Table]._ A table that specifies properties of the call — see the next section for details.


## Parameter Reference

##### time ~^(optional)^~
_[Number][api.type.Number]._ Time in milliseconds to scroll to the specified position. For an instantaneous effect (no transition), set this to `0`. Default is `400`.

##### onComplete ~^(optional)^~ 
_[Function][api.type.Function]._ An optional function that will be called when the scroll completes.


## Example

``````lua
local function onScrollComplete()
    print( "Scroll complete!" )
end

scrollView:scrollTo( "bottom", { time=1200, onComplete=onScrollComplete } )
``````
