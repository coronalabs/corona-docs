# object:takeFocus()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scroll view, ScrollViewWidget, takeFocus
> __See also__          [widget.newScrollView()][api.library.widget.newScrollView]
>						[ScrollViewWidget][api.type.ScrollViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

If you have an object with a touch listener inside a scroll view such as a [ButtonWidget][api.type.ButtonWidget], you should call this method within the `"moved"` phase of that object's touch listener and pass the touch event's `event` table as the sole parameter of this method. This will give focus back to the scroll view, enabling it to continue to scroll.

## Syntax

	object:takeFocus( event )

##### event ~^(required)^~
_[Table][api.type.Table]._ The `event` table from the object's touch listener function.


## Example

``````lua
local widget = require( "widget" )

local scrollView = widget.newScrollView
{
    top = 100,
    left = 10,
    width = 300,
    height = 400,
    scrollWidth = 600,
    scrollHeight = 800,
    horizontalScrollDisabled = true
}

-- The touch listener function for the button (created below)
local function handleButtonEvent( event )

    local phase = event.phase

    if ( phase == "moved" ) then
        local dy = math.abs( ( event.y - event.yStart ) )
        -- If the touch on the button has moved more than 10 pixels,
        -- pass focus back to the scroll view so it can continue scrolling
        if ( dy > 10 ) then
            scrollView:takeFocus( event )
        end
    end
    return true
end

local button1 = widget.newButton
{
    left = 100,
    top = 200,
    id = "button1",
    label = "Default",
    onEvent = handleButtonEvent
}
scrollView:insert( button1 )
``````
