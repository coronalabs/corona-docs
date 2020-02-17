# object:setIsLocked()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scroll view, ScrollViewWidget, setIsLocked
> __See also__          [widget.newScrollView()][api.library.widget.newScrollView]
>						[ScrollViewWidget][api.type.ScrollViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets a [ScrollViewWidget][api.type.ScrollViewWidget] to either locked (does&nbsp;not&nbsp;scroll) or unlocked (default&nbsp;behavior). Optionally, you can lock or unlock the scroll view on a specific directional axis.


## Syntax

	object:setIsLocked( isLocked [, axis] )

##### isLocked ~^(required)^~
_[Boolean][api.type.Boolean]._ Set to `true` to lock the scroll view; `false` to unlock the scroll view.

##### axis ~^(optional)^~
_[String][api.type.String]._ Directional axis upon which to lock or unlock the scroll view, either `"horizontal"` or `"vertical"`.


## Examples

##### Lock on Delay

``````lua
local scrollView = widget.newScrollView {
    width = 400,
    height = 400,
    left = 0,
    top = 0,
    scrollWidth = 800,
    scrollHeight =  1200,
    hideBackground = false
}

local function lockScrollView()
    scrollView:setIsLocked( true )
end

-- Lock the scroll view after 2 seconds
timer.performWithDelay( 2000, lockScrollView )
``````

##### Lock Specific Axis

``````lua
local scrollView = widget.newScrollView {
    width = 400,
    height = 400,
    left = 0,
    top = 0,
    scrollWidth = 800,
    scrollHeight =  1200,
    hideBackground = false
}

-- Lock the scroll view only on the horizontal axis
scrollView:setIsLocked( true, "horizontal" )
``````