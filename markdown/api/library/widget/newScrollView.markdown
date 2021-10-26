# widget.newScrollView()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [ScrollViewWidget][api.type.ScrollViewWidget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, scrollview, scrollbox, scrolling content
> __See also__          [ScrollViewWidget][api.type.ScrollViewWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a [ScrollViewWidget][api.type.ScrollViewWidget] object.


## Gotchas

* The [ScrollViewWidget][api.type.ScrollViewWidget] objects contains a mask which constrains its view to the defined width and height. There is a nested masking limit of 3, so care must be taken when inserting masked objects into other masked objects which act as containers, including [display.newContainer][api.library.display.newContainer], [widget.newScrollView][api.library.widget.newScrollView], [widget.newTableView][api.library.widget.newTableView], or a masked [display&nbsp;group][api.type.GroupObject]. Other display objects that utilize masks include [display.newText][api.library.display.newText], [display.newEmbossedText][api.library.display.newEmbossedText], and any other [masked][api.type.Mask] display object. For example, a text object (one&nbsp;mask) inside a container (one&nbsp;mask) inside yet another container (one&nbsp;mask) would reach but not exceed the limit of 3 nested masks.

* The [ScrollViewWidget][api.type.ScrollViewWidget] widget does not support [scaling][api.type.DisplayObject.scale] nor changing the width/height via [.width][api.type.DisplayObject.width] or [.height][api.type.DisplayObject.height].


## Syntax

	widget.newScrollView( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification string to assign to the scroll view. Default is `widget_scrollView`.

##### x, y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.

##### left, top ~^(optional)^~
_[Numbers][api.type.Number]._ The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.

##### width, height ~^(required)^~
_[Numbers][api.type.Number]._ The visible (on&nbsp;screen) width and height of the scroll view.

##### scrollWidth, scrollHeight ~^(optional)^~
_[Numbers][api.type.Number]._ The width and height of the total scrollable content area. This can be changed after the scroll view widget has been created via the [object:setScrollWidth()][api.type.ScrollViewWidget.setScrollWidth] and [object:setScrollHeight()][api.type.ScrollViewWidget.setScrollHeight] methods. Note that these values automatically update when you insert objects into the scroll view.

##### friction ~^(optional)^~
_[Number][api.type.Number]._ Determines how fast the content travels when it is flicked. The default value is `0.972`.

##### horizontalScrollDisabled ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the scroll view will not scroll horizontally.

##### verticalScrollDisabled ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the scroll view will not scroll vertically.

##### isLocked ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the scroll view will be locked, meaning it cannot be scrolled.

##### isBounceEnabled ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `false`, the bounce effect at the limits of the scrolling will be disabled. Default is `true`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ The function used to listen for [ScrollViewWidget][api.type.ScrollViewWidget] motion/scroll events. In this listener function, `event.phase` returns the expected touch interaction phases of `"began"`, `"moved"`, or `"ended"`. In addition, a `"stopped"` phase can be detected when the scroll view flick/swipe momentum naturally comes to a stop. Finally, the scroll limit in any direction can be detected by `event.limitReached`. If this occurs, `event.direction` returns the direction in which the scroll view was moving when the limit was reached.


## Methods

#### [object:getContentPosition()][api.type.ScrollViewWidget.getContentPosition]
#### [object:getView()][api.type.ScrollViewWidget.getView]
#### [object:scrollToPosition()][api.type.ScrollViewWidget.scrollToPosition]
#### [object:scrollTo()][api.type.ScrollViewWidget.scrollTo]
#### [object:setIsLocked()][api.type.ScrollViewWidget.setIsLocked]
#### [object:setScrollWidth()][api.type.ScrollViewWidget.setScrollWidth]
#### [object:setScrollHeight()][api.type.ScrollViewWidget.setScrollHeight]
#### [object:takeFocus()][api.type.ScrollViewWidget.takeFocus]
#### [object:setSize()][api.type.ScrollViewWidget.setSize]


## Visual Options

##### backgroundColor ~^(optional)^~
_[Table][api.type.Table]._ Table containing the RGB+A background color setting. Default is white.

``````lua
backgroundColor = { 0.8, 0.8, 0.8 }
``````

##### hideBackground ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the background of the scroll view will be hidden, but it still receives touches.

##### hideScrollBar ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the scroll bar will not appear for the scroll view.

##### scrollBarOptions ~^(optional)^~
_[Table][api.type.Table]._ Table containing the [image&nbsp;sheet][api.library.graphics.newImageSheet] specifications for a custom scroll bar. Customizing the scroll bar requires 3 frames from an image sheet. Each frame needs to be a square of equal size. Inside the `scrollBarOptions` table, you must specify 4 required parameters: `sheet`, `topFrame`, `middleFrame`, and `bottomFrame`.

``````lua
scrollBarOptions = {
    sheet = scrollBarSheet,  -- Reference to the image sheet
    topFrame = 1,            -- Number of the "top" frame
    middleFrame = 2,         -- Number of the "middle" frame
    bottomFrame = 3          -- Number of the "bottom" frame
}
``````

##### topPadding, bottomPadding ~^(optional)^~
_[Numbers][api.type.Number]._ The number of pixels from the top and bottom of the scroll view at which the scrollable content area will stop when it reaches the top/bottom limits. The default value for both is `0`.

##### leftPadding, rightPadding ~^(optional)^~
_[Numbers][api.type.Number]._ The number of pixels from the left and right of the scroll view at which the scrollable content area will stop when it reaches the left/right limits. The default value for both is `0`.


## Inserting/Removing Objects

Visual content can be added to or removed from a scroll view via the [object:insert()][api.type.GroupObject.insert] and [object:remove()][api.type.GroupObject.remove] functions respectively.


## Examples

##### Basic ScrollView

``````lua
local widget = require( "widget" )
 
-- ScrollView listener
local function scrollListener( event )

    local phase = event.phase
    if ( phase == "began" ) then print( "Scroll view was touched" )
    elseif ( phase == "moved" ) then print( "Scroll view was moved" )
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end

    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        if ( event.direction == "up" ) then print( "Reached bottom limit" )
        elseif ( event.direction == "down" ) then print( "Reached top limit" )
        elseif ( event.direction == "left" ) then print( "Reached right limit" )
        elseif ( event.direction == "right" ) then print( "Reached left limit" )
        end
    end

    return true
end

-- Create the widget
local scrollView = widget.newScrollView(
	{
		top = 100,
		left = 10,
		width = 300,
		height = 400,
		scrollWidth = 600,
		scrollHeight = 800,
		listener = scrollListener
	}
)

-- Create a image and insert it into the scroll view
local background = display.newImageRect( "assets/scrollimage.png", 768, 1024 )
scrollView:insert( background )
``````

##### ScrollView + Custom Scroll Bar

``````lua
local widget = require( "widget" )
 
-- ScrollView listener
local function scrollListener( event )

    local phase = event.phase
    if ( phase == "began" ) then print( "Scroll view was touched" )
    elseif ( phase == "moved" ) then print( "Scroll view was moved" )
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end

    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        if ( event.direction == "up" ) then print( "Reached bottom limit" )
        elseif ( event.direction == "down" ) then print( "Reached top limit" )
        elseif ( event.direction == "left" ) then print( "Reached right limit" )
        elseif ( event.direction == "right" ) then print( "Reached left limit" )
        end
    end

    return true
end

-- Create image sheet for custom scroll bar
local scrollBarOpt = {
    width = 20,
    height = 20,
    numFrames = 3,
    sheetContentWidth = 20,
    sheetContentHeight = 60
}
local scrollBarSheet = graphics.newImageSheet( "scrollBar.png", scrollBarOpt )

-- Create the widget
local scrollView = widget.newScrollView(
	{
		top = 100,
		left = 10,
		width = 300,
		height = 400,
		scrollWidth = 600,
		scrollHeight = 800,
		listener = scrollListener,
		scrollBarOptions = {
			sheet = scrollBarSheet,
			topFrame = 1,
			middleFrame = 2,
			bottomFrame = 3
		}
	}
)

-- Create a image and insert it into the scroll view
local background = display.newImageRect( "assets/scrollimage.png", 768, 1024 )
scrollView:insert( background )
``````
