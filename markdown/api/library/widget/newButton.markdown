# widget.newButton()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [ButtonWidget][api.type.ButtonWidget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, button
> __See also__          [ButtonWidget][api.type.ButtonWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a [ButtonWidget][api.type.ButtonWidget] object.


## Syntax

	widget.newButton( options )

This function takes a single argument, `options`, which is a table that accepts the following basic parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification string to assign for the button. Default is `widget_button`.

##### x, y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.

##### left, top ~^(optional)^~
_[Numbers][api.type.Number]._ The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.

##### isEnabled ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `false`, the button will not respond to touch events. Use [button:setEnabled()][api.type.ButtonWidget.setEnabled] to enable or disable touch events on a button after creation. Default is `true` (button&nbsp;is&nbsp;enabled).

##### onPress ~^(optional)^~
_[Listener][api.type.Listener]._ An optional function to be called when the button is pressed. The callback function does not require testing for `event.phase` since it only honors `"began"`.

##### onRelease ~^(optional)^~
_[Listener][api.type.Listener]._ An optional function to be called when the user releases the button (assuming the touch is still over the button). The callback function does not require testing for `event.phase` since it only honors `"ended"`.

##### onEvent ~^(optional)^~
_[Listener][api.type.Listener]._ An optional function that should only be specified if `onPress` and `onRelease` are not set. This callback function allows you to test for the `event.phase` of `"began"`, `"moved"`, or `"ended"`.


## Methods

#### [object:setLabel()][api.type.ButtonWidget.setLabel]

#### [object:getLabel()][api.type.ButtonWidget.getLabel]

#### [object:setEnabled()][api.type.ButtonWidget.setEnabled]


## Basic Visual Options

All buttons accept the following visual parameters in the `options` table, plus specific parameters for [2-Image](#2image), [2-Frame](#2frame), or [9-Slice](#9slice) button type construction.

<!---

##### width, height
_[Numbers][api.type.Number]._ These values vary depending on the construction type &mdash; see the appropriate construction section below.

-->

##### label ~^(optional)^~
_[String][api.type.String]._ Text label that will appear on top of the button.

##### labelAlign ~^(optional)^~
_[String][api.type.String]._ Alignment of the button label. Valid values are `left`, `right`, or `center`. Default is `center`.

##### labelColor ~^(optional)^~
_[Table][api.type.Table]._ Table of two RGB+A color settings, one each for the __default__ and __over__ states.

``````lua
labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
``````

##### labelXOffset, labelYOffset ~^(optional)^~
_[Numbers][api.type.Number]._ Optional __x__ and __y__ offsets for the button label. For example, <nobr>`labelYOffset = -8`</nobr> will shift the label 8 pixels up from default.

##### font ~^(optional)^~
_[String][api.type.String]._ Font used for the button label. Default is [native.systemFont][api.library.native.systemFont].

##### fontSize ~^(optional)^~
_[Number][api.type.Number]._ Font size (in pixels) for the button label. Default is `14`.

##### emboss ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the button label will appear embossed (inset&nbsp;effect).

##### textOnly ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the button will be constructed via a text object only <nobr>(no background element)</nobr>. Default is `false`.



<a id="2image"></a>

## 2-Image Construction

This is the easiest button to construct &mdash; just create two image files, one for the __default__ state and another for the __over__ state.

![][images.simulator.widget-button-file]

##### width, height ~^(required)^~
_[Numbers][api.type.Number]._ The width and height of the image files.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ The base directory where your custom images are located. Default is your project folder (`system.ResourceDirectory`).

##### defaultFile ~^(required)^~
_[String][api.type.String]._ The file name of the button __default__ image <nobr>(the un-pressed state)</nobr>.

##### overFile ~^(optional)^~
_[String][api.type.String]._ The file name of the button __over__ image <nobr>(the pressed state)</nobr>.



<a id="2frame"></a>

## 2-Frame Construction

This method uses two frames from an [image&nbsp;sheet][api.library.graphics.newImageSheet] &mdash; one frame each for the __default__ and __over__ states. For this method, include a reference to the image sheet as the `sheet` parameter. Then specify the frame numbers from the image sheet as `defaultFrame` and `overFrame` respectively.

![][images.simulator.widget-button-file]

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image&nbsp;sheet][api.library.graphics.newImageSheet] object for the button.

##### defaultFrame ~^(required)^~
_[Number][api.type.Number]._ The index number for the __default__ frame of the button <nobr>(the un-pressed state)</nobr>.

##### overFrame ~^(required)^~
_[Number][api.type.Number]._ The index number for the __over__ frame of the button <nobr>(the pressed state)</nobr>.


<a id="vector"></a>

## Shape Construction

This method allows you to create buttons using the following built-in Corona shape objects:

* [display.newRect()][api.library.display.newRect]
* [display.newRoundedRect()][api.library.display.newRoundedRect]
* [display.newCircle()][api.library.display.newCircle]
* [display.newPolygon()][api.library.display.newPolygon]

![][images.simulator.widget-button-shapes]

##### shape ~^(required)^~
_[String][api.type.String]._ Defines which shape to use for the button body (background). Valid options are `"rect"`, `"roundedRect"`, `"circle"`, or `"polygon"`.

##### fillColor ~^(optional)^~
_[Table][api.type.Table]._ Table of two RGB+A color settings, one each for the default and over states. These colors define the fill color of the shape.

``````lua
fillColor = { default={ 1, 0.2, 0.5, 0.7 }, over={ 1, 0.2, 0.5, 1 } }
``````

##### strokeColor ~^(optional)^~
_[Table][api.type.Table]._ Table of two RGB+A color settings, one each for the default and over states. These colors define the stroke color of the shape.

``````lua
strokeColor = { default={ 0, 0, 0 }, over={ 0.4, 0.1, 0.2 } }
``````

##### strokeWidth ~^(optional)^~
_[Number][api.type.Number]._ The width of the stroke around the shape object. Applies only if `strokeColor` is defined.

##### width, height ~^(optional)^~
_[Numbers][api.type.Number]._ The width and height of the button shape. Only applies to `"rect"` or `"roundedRect"` shapes.

##### cornerRadius ~^(optional)^~
_[Number][api.type.Number]._ Radius of the curved corners for a `"roundedRect"` shape. This value is ignored for all other shapes.

##### radius ~^(optional)^~
_[Number][api.type.Number]._ Radius for a `"circle"` shape. This value is ignored for all other shapes.

##### vertices ~^(optional)^~
_[Array][api.type.Array]._ An array of __x__ and __y__ coordinates to define a `"polygon"` shape. These coordinates will automatically be <nobr>re-centered</nobr> about the center of the polygon, and the polygon will be centered in relation to the button label. This property is ignored for all other shapes.

``````lua
vertices = { -20, -25, 40, 0, -20, 25 }
``````




<a id="9slice"></a>

## 9-Slice Construction

This method uses 9 slices from an [image&nbsp;sheet][api.library.graphics.newImageSheet] which are assembled internally to create <nobr>flexible-sized</nobr> buttons. As indicated in the following image, the 9 slices consist of the 4&nbsp;corners&nbsp;(red), the 2&nbsp;horizontal&nbsp;sides&nbsp;(green), the 2&nbsp;vertical&nbsp;sides&nbsp;(yellow), and the middle&nbsp;fill. Depending on the size of the button, the corners will remain at the size stated in the image sheet, but the sides and middle will stretch to fill the entire width and height. Note that 18 slices are necessary to construct the entire button: 9 slices each for the __default__ and __over__ states.

![][images.simulator.widget-button-9slice]

##### width, height ~^(required)^~
_[Numbers][api.type.Number]._ The flexible width and height of the 9-slice button.

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image&nbsp;sheet][api.library.graphics.newImageSheet] object for the button.

##### middleFrame, middleOverFrame ~^(required)^~
_[Numbers][api.type.Number]._ The __default__ <nobr>(un-pressed)</nobr> and __over__ (pressed) frames of the middle fill region.

##### topLeftFrame, topLeftOverFrame ~^(required)^~
_[Numbers][api.type.Number]._ The __default__ <nobr>(un-pressed)</nobr> and __over__ (pressed) frames of the <nobr>top-left</nobr> corner.

##### topMiddleFrame, topMiddleOverFrame ~^(required)^~
_[Numbers][api.type.Number]._ The __default__ <nobr>(un-pressed)</nobr> and __over__ (pressed) frames of the <nobr>top-middle</nobr> side.

##### topRightFrame, topRightOverFrame ~^(required)^~
_[Numbers][api.type.Number]._ The __default__ <nobr>(un-pressed)</nobr> and __over__ (pressed) frames of the <nobr>top-right</nobr> corner.

##### middleRightFrame, middleRightOverFrame ~^(required)^~
_[Numbers][api.type.Number]._ The __default__ <nobr>(un-pressed)</nobr> and __over__ (pressed) frames of the <nobr>middle-right</nobr> side.

##### bottomRightFrame, bottomRightOverFrame ~^(required)^~
_[Numbers][api.type.Number]._ The __default__ <nobr>(un-pressed)</nobr> and __over__ (pressed) frames of the <nobr>bottom-right</nobr> corner.

##### bottomMiddleFrame, bottomMiddleOverFrame ~^(required)^~
_[Numbers][api.type.Number]._ The __default__ <nobr>(un-pressed)</nobr> and __over__ (pressed) frames of the <nobr>bottom-middle</nobr> side.

##### bottomLeftFrame, bottomLeftOverFrame ~^(required)^~
_[Numbers][api.type.Number]._ The __default__ <nobr>(un-pressed)</nobr> and __over__ (pressed) frames of the <nobr>bottom-left</nobr> corner.

##### middleLeftFrame, middleLeftOverFrame ~^(required)^~
_[Numbers][api.type.Number]._ The __default__ <nobr>(un-pressed)</nobr> and __over__ (pressed) frames of the <nobr>middle-left</nobr> side.


## Examples

##### Default

``````lua
local widget = require( "widget" )

-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end

-- Create the widget
local button1 = widget.newButton(
	{
		left = 100,
		top = 200,
		id = "button1",
		label = "Default",
		onEvent = handleButtonEvent
	}
)
``````

##### 2-Image

``````lua
local widget = require( "widget" )

-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end

local button1 = widget.newButton(
	{
		width = 240,
		height = 120,
		defaultFile = "buttonDefault.png",
		overFile = "buttonOver.png",
		label = "button",
		onEvent = handleButtonEvent
	}
)

-- Center the button
button1.x = display.contentCenterX
button1.y = display.contentCenterY

-- Change the button's label text
button1:setLabel( "2-Image" )
``````

##### 2-Frame

``````lua
local widget = require( "widget" )

-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end

-- Image sheet options and declaration
-- For testing, you may copy/save the image under "2-Frame Construction" above
local options = {
    width = 240,
    height = 120,
    numFrames = 2,
    sheetContentWidth = 480,
    sheetContentHeight = 120
}
local buttonSheet = graphics.newImageSheet( "widget-button-file.png", options )

-- Create the widget
local button1 = widget.newButton(
	{
		sheet = buttonSheet,
		defaultFrame = 1,
		overFrame = 2,
		label = "button",
		onEvent = handleButtonEvent
	}
)

-- Center the button
button1.x = display.contentCenterX
button1.y = display.contentCenterY

-- Change the button's label text
button1:setLabel( "2-Frame" )
``````

##### Shape

``````lua
local widget = require( "widget" )

-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end

-- Create the widget
local button1 = widget.newButton(
	{
		label = "button",
		onEvent = handleButtonEvent,
		emboss = false,
		-- Properties for a rounded rectangle button
		shape = "roundedRect",
		width = 200,
		height = 40,
		cornerRadius = 2,
		fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
		strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
		strokeWidth = 4
	}
)

-- Center the button
button1.x = display.contentCenterX
button1.y = display.contentCenterY

-- Change the button's label text
button1:setLabel( "Shape" )
``````

##### 9-Slice

``````lua
local widget = require( "widget" )

-- Function to handle button events
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        print( "Button was pressed and released" )
    end
end

-- Image sheet options and declaration
-- For testing, you may copy/save the image under "9-Slice Construction" above
local options = {
    frames =
    {
        { x=0, y=0, width=21, height=21 },
        { x=21, y=0, width=198, height=21 },
        { x=219, y=0, width=21, height=21 },
        { x=0, y=21, width=21, height=78 },
        { x=21, y=21, width=198, height=78 },
        { x=219, y=21, width=21, height=78 },
        { x=0, y=99, width=21, height=21 },
        { x=21, y=99, width=198, height=21 },
        { x=219, y=99, width=21, height=21 },
        { x=240, y=0, width=21, height=21 },
        { x=261, y=0, width=198, height=21 },
        { x=459, y=0, width=21, height=21 },
        { x=240, y=21, width=21, height=78 },
        { x=261, y=21, width=198, height=78 },
        { x=459, y=21, width=21, height=78 },
        { x=240, y=99, width=21, height=21 },
        { x=261, y=99, width=198, height=21 },
        { x=459, y=99, width=21, height=21 }
    },
    sheetContentWidth = 480,
    sheetContentHeight = 120
}
local buttonSheet = graphics.newImageSheet( "widget-button-9slice.png", options )

-- Create the widget
local button1 = widget.newButton(
	{
		width = 340,
		height = 100,
		sheet = buttonSheet,
		topLeftFrame = 1,
		topMiddleFrame = 2,
		topRightFrame = 3,
		middleLeftFrame = 4,
		middleFrame = 5,
		middleRightFrame = 6,
		bottomLeftFrame = 7,
		bottomMiddleFrame = 8,
		bottomRightFrame = 9,
		topLeftOverFrame = 10,
		topMiddleOverFrame = 11,
		topRightOverFrame = 12,
		middleLeftOverFrame = 13,
		middleOverFrame = 14,
		middleRightOverFrame = 15,
		bottomLeftOverFrame = 16,
		bottomMiddleOverFrame = 17,
		bottomRightOverFrame = 18,
		label = "button"
	}
)

-- Center the button
button1.x = display.contentCenterX
button1.y = display.contentCenterY

-- Change the button's label text
button1:setLabel( "9-Slice" )
``````
