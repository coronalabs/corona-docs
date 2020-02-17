# widget.newSlider()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [SliderWidget][api.type.SliderWidget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, slider, sliding control
> __See also__          [SliderWidget][api.type.SliderWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a [SliderWidget][api.type.SliderWidget] object.


## Gotchas

* To conserve texture memory, a [SliderWidget][api.type.SliderWidget] object can only be created from an [image&nbsp;sheet][api.library.graphics.newImageSheet].

* [SliderWidget][api.type.SliderWidget] objects do not support [scaling][api.type.DisplayObject.scale] nor changing the width/height via [.width][api.type.DisplayObject.width] or [.height][api.type.DisplayObject.height].


## Syntax

	widget.newSlider( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification to assign to the slider. Default is `"widget_slider"`.

##### x, y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.

##### left, top ~^(optional)^~
_[Numbers][api.type.Number]._ The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.

##### orientation ~^(optional)^~
_[String][api.type.String]._ The orientation of the slider, either `"horizontal"` or `"vertical"`. Default is `"horizontal"`.

##### width, height ~^(required)^~
_[Numbers][api.type.Number]._ The width __or__ height of the slider, depending on the `orientation` setting (`width` for horizontal or `height` for vertical).

##### value ~^(optional)^~
_[Number][api.type.Number]._ Represents the starting value of the slider, as a percentage. Default is `50`, meaning that the slider handle will begin at 50%.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ The function which is called to handle slider interaction events. In this listener function, `event.phase` returns the expected touch interaction phases of `"began"`, `"moved"`, or `"ended"`. In addition, you can read the new value of the slider with `event.value`.

## Properties

#### [object.value][api.type.SliderWidget.value]

## Methods

#### [object:setValue()][api.type.SliderWidget.setValue]


## Visual Customization

The slider widget can be visually customized using an [image&nbsp;sheet][api.library.graphics.newImageSheet]. As shown in the following example, 5&nbsp;frames can be used to assemble an outer border and an inner fill bar. The outer border consists of the left&nbsp;cap (red), the middle&nbsp;span (green), and the right&nbsp;cap (yellow). The inner fill region (orange) will stretch to span the current slider fill percentage. All of the outer border frames and the inner fill frame should share the same width and height.

The handle frame can be sized differently than the other frames. Note that all slider widgets have a limit to which the handle can be dragged in either direction. In regards to visual customization, the handle will stop when its __center__ axis reaches either edge of the __middle__ span section. Thus, for a horizontal slider, the handle will stop when its center axis reaches the left or right edge of the <nobr>center-spanning</nobr> section between the end caps. The same principle applies to a vertical slider, but the limits will be the top and bottom edge of the <nobr>center-spanning</nobr> section.

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

------------------------------------------------	------------------	----------------------------------------
![][images.simulator.widget-slider]					&nbsp;&rarr;&nbsp;	![][images.simulator.widget-slider-final]
------------------------------------------------	------------------	----------------------------------------

</div>

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image&nbsp;sheet][api.library.graphics.newImageSheet] object for the slider.

### Horizontal Slider

##### leftFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the border left cap.

##### middleFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the border middle span.

##### rightFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the border right cap.

##### fillFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the middle fill span.

##### frameWidth, frameHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width/height of the border frames and middle fill span. All of these frames should share the same width and height.

##### handleFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the handle element.

##### handleWidth, handleHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width/height of the handle element frame.

### Vertical Slider

##### topFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the border top cap.

##### middleVerticalFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the border middle span.

##### bottomFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the border bottom cap.

##### fillVerticalFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the middle fill span.

##### frameWidth, frameHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width/height of the border frames and middle fill span. All of these frames should share the same width and height.

##### handleFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the handle element.

##### handleWidth, handleHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width/height of the handle element frame.


## Examples

##### Horizontal

``````lua
local widget = require( "widget" )
    
-- Slider listener
local function sliderListener( event )
    print( "Slider at " .. event.value .. "%" )
end

-- Create the widget
local slider = widget.newSlider(
	{
		x = display.contentCenterX,
		y = display.contentCenterY,
		width = 400,
		value = 10,  -- Start slider at 10% (optional)
		listener = sliderListener
	}
)
``````

##### Vertical

``````lua
local widget = require( "widget" )
    
-- Slider listener
local function sliderListener( event )
    print( "Slider at " .. event.value .. "%" )
end

-- Create the widget
local slider = widget.newSlider(
	{
		x = display.contentCenterX,
		y = display.contentCenterY,
		orientation = "vertical",
		height = 200,
		value = 10,  -- Start slider at 10% (optional)
		listener = sliderListener
	}
)
``````

##### Image Sheet

``````lua
local widget = require( "widget" )

-- Slider listener
local function sliderListener( event )
    print( "Slider at " .. event.value .. "%" )
end

-- Image sheet options and declaration
-- For testing, you may copy/save the image under "Visual Customization" above
local options = {
    frames = {
        { x=0, y=0, width=36, height=64 },
        { x=40, y=0, width=36, height=64 },
        { x=80, y=0, width=36, height=64 },
        { x=124, y=0, width=36, height=64 },
        { x=168, y=0, width=64, height=64 }
    },
    sheetContentWidth = 232,
    sheetContentHeight = 64
}
local sliderSheet = graphics.newImageSheet( "widget-slider.png", options )

-- Create the widget
local slider = widget.newSlider(
	{
		sheet = sliderSheet,
		leftFrame = 1,
		middleFrame = 2,
		rightFrame = 3,
		fillFrame = 4,
		frameWidth = 36,
		frameHeight = 64,
		handleFrame = 5,
		handleWidth = 64,
		handleHeight = 64,
		x = display.contentCenterX,
		y = display.contentCenterY,
		orientation = "horizontal",
		width = 300,
		listener = sliderListener
	}
)
``````
