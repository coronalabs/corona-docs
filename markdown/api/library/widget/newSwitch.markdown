# widget.newSwitch()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [SwitchWidget][api.type.SwitchWidget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, switch, radio, onoff, checkbox, control
> __See also__          [SwitchWidget][api.type.SwitchWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a [SwitchWidget][api.type.SwitchWidget] object.

## Gotchas

* To conserve texture memory, a [SwitchWidget][api.type.SwitchWidget] object can only be created from an [image sheet][api.library.graphics.newImageSheet].

* [SwitchWidget][api.type.SwitchWidget] objects do not support [scaling][api.type.DisplayObject.scale] nor changing the width/height via [.width][api.type.DisplayObject.width] or [.height][api.type.DisplayObject.height].

## Syntax

	widget.newSwitch( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification to assign to the switch. Default is `"widget_switch"`.

##### x, y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.

##### left, top ~^(optional)^~
_[Numbers][api.type.Number]._ The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.

##### initialSwitchState ~^(optional)^~
_[Boolean][api.type.Boolean]._ The initial state of the switch &mdash; `true` for on/selected or `false` for off/deselected. Default is `false`.

##### style ~^(optional)^~
_[String][api.type.String]._ The switch style. Valid options are `"radio"`, `"checkbox"` and `"onOff"`. Default is `"onOff"`.

##### onPress ~^(optional)^~
_[Listener][api.type.Listener]._ An optional function to be called when the switch is pressed. The callback function does not require testing for `event.phase` since it only honors `"began"`. When reading the [object.isOn][api.type.SwitchWidget.isOn] property via this listener type, the current state of the switch is reported, meaning its `.isOn` state __before__ the actual switch state change occurs.

##### onRelease ~^(optional)^~
_[Listener][api.type.Listener]._ An optional function to be called when the user releases the switch (assuming the touch is still over the switch). The callback function does not require testing for `event.phase` since it only honors `"ended"`. When reading the [object.isOn][api.type.SwitchWidget.isOn] property via this listener type, the resulting state of the switch is reported, meaning its `.isOn` state __after__ the switch state change occurs.

##### onEvent ~^(optional)^~
_[Listener][api.type.Listener]._ An optional function that should only be specified if `onPress` and `onRelease` are not set. This callback function allows you to test for the `event.phase` of `"began"`, `"moved"`, or `"ended"`.

## Methods

#### [object:setState()][api.type.SwitchWidget.setState]

## Properties

#### [object.isOn][api.type.SwitchWidget.isOn]


## Visual Customization

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image sheet][api.library.graphics.newImageSheet] object for the switch.

### Radio or Checkbox Switch

Radio and checkbox switches can be visually customized using two frames of equal size from an [image&nbsp;sheet][api.library.graphics.newImageSheet]. Just declare the image sheet and specify the two frames as `frameOn` and `frameOff` in the widget constructor.

![][images.simulator.widget-radio-checkbox]

##### frameOn ~^(required)^~
_[Number][api.type.Number]._ The index number for the "on" frame of the radio/checkbox switch.

##### frameOff ~^(required)^~
_[Number][api.type.Number]._ The index number for the "off" frame of the radio/checkbox switch.

##### width, height (required)
_[Numbers][api.type.Number]._ The width/height of each frame.

### On/Off Switch

The on/off switch can be visually customized using 4 frames from an [image&nbsp;sheet][api.library.graphics.newImageSheet] (left), plus a [mask][guide.media.imageMask] image (middle), resulting in an assembled switch (right).

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

--------------------------------------------	-----	--------------------------------------------	------------------	----------------------------------------
![][images.simulator.widget-on-off-sheet]		  +		![][images.simulator.widget-on-off-mask]		&nbsp;&rarr;&nbsp;	![][images.simulator.widget-on-off-final]
--------------------------------------------	-----	--------------------------------------------	------------------	----------------------------------------

</div>

The `onOffBackgroundFrame` frame (upper left) slides behind the masked region of the widget. This frame is typically a combination of the "on" side of the switch and the "off" side. The handle will be positioned in the horizontal center of this frame, so depending on your design, you can create two distinct sides for the switch, separated by the handle.

The actual handle can have both a "default" and "over" frame &mdash; the latter being visually distinct in some way as to indicate that the user is manipulating the handle. If you don't want to indicate any visual difference, you can specify the same frame number for `onOffHandleDefaultFrame` and `onOffHandleOverFrame`.

The overlay border (`onOffOverlayFrame`) resides behind the handle but in front of the masked background slider. Remember that when designing the [mask][guide.media.imageMask] image, the visible (white) region of the mask should generally be the same size as the interior open area of the overlay border. Also, the mask must adhere to the requirements of all masks outlined [here][api.library.graphics.newMask].

##### onOffBackgroundFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the sliding background frame. This will be masked by the image defined for `onOffMask`.

##### onOffBackgroundWidth, onOffBackgroundHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width/height of the background frame.

##### onOffMask ~^(required)^~
_[String][api.type.String]._ The file name (including the extension and any subfolder path) of the mask image, for example `"myWidgetAssets/switchMask.png"`. This image must adhere to the mask requirements outlined [here][api.library.graphics.newMask].

##### onOffHandleDefaultFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the handle "default" (un-pressed) appearance.

##### onOffHandleOverFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the handle "over" (pressed) appearance.

##### onOffOverlayFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the overlay border.

##### onOffOverlayWidth, onOffOverlayHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width/height of the overlay border.

##### offDirection ~^(optional)^~
_[String][api.type.String]._ The side of the `onOffBackgroundFrame` frame that is considered "off" from a visual standpoint. Default is `"right"` but this value can be set to `"left"`. Change this value only if you wish to reverse the "on" and "off" sides of the switch.


## Grouping Radio Buttons

Radio buttons can be grouped (associated) by placing multiple buttons in the same display group. Buttons in the same group will behave as <nobr>HTML-based</nobr> radio buttons, in which only one button can be selected at a given time. When another button in the group is selected, the others will be automatically switched off. See the usage example below.


## Examples

##### Radio Buttons

`````lua
local widget = require( "widget" )

-- Handle press events for the buttons
local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end

-- Create a group for the radio button set
local radioGroup = display.newGroup()

-- Create two associated radio buttons (inserted into the same display group)
local radioButton1 = widget.newSwitch(
	{
		left = 150,
		top = 200,
		style = "radio",
		id = "RadioButton1",
		initialSwitchState = true,
		onPress = onSwitchPress
	}
)
radioGroup:insert( radioButton1 )

local radioButton2 = widget.newSwitch(
	{
		left = 250,
		top = 200,
		style = "radio",
		id = "RadioButton2",
		onPress = onSwitchPress
	}
)
radioGroup:insert( radioButton2 )
``````

##### Checkboxes

``````lua
local widget = require( "widget" )

-- Handle press events for the checkbox
local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end

-- Create the widget
local checkboxButton = widget.newSwitch(
	{
		left = 250,
		top = 200,
		style = "checkbox",
		id = "Checkbox",
		onPress = onSwitchPress
	}
)
``````

##### On-Off Switch

``````lua
local widget = require( "widget" )

-- Handle press events for the checkbox
local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end

-- Create the widget
local onOffSwitch = widget.newSwitch(
	{
		left = 250,
		top = 200,
		style = "onOff",
		id = "onOffSwitch",
		onPress = onSwitchPress
	}
)
``````

##### Image Sheet &mdash; Radio Buttons

``````lua
local widget = require( "widget" )

-- Handle press events for the buttons
local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end

-- Image sheet options and declaration
local options = {
    width = 100,
    height = 100,
    numFrames = 2,
    sheetContentWidth = 200,
    sheetContentHeight = 100
}
local radioButtonSheet = graphics.newImageSheet( "radioButtonSheet.png", options )

-- Create a group for the radio button set
local radioGroup = display.newGroup()

-- Create two associated radio buttons (inserted into the same display group)
local radioButton1 = widget.newSwitch(
	{
		left = 150,
		top = 200,
		style = "radio",
		id = "RadioButton1",
		width = 100,
		height = 100,
		initialSwitchState = true,
		onPress = onSwitchPress,
		sheet = radioButtonSheet,
		frameOff = 1,
		frameOn = 2
	}
)
radioGroup:insert( radioButton1 )

local radioButton2 = widget.newSwitch(
	{
		left = 250,
		top = 200,
		style = "radio",
		id = "RadioButton2",
		width = 100,
		height = 100,
		onPress = onSwitchPress,
		sheet = radioButtonSheet,
		frameOff = 1,
		frameOn = 2
	}
)
radioGroup:insert( radioButton2 )
``````

##### Image Sheet &mdash; Checkboxes

``````lua
local widget = require( "widget" )

-- Handle press events for the checkbox
local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end

-- Image sheet options and declaration
local options = {
    width = 100,
    height = 100,
    numFrames = 2,
    sheetContentWidth = 200,
    sheetContentHeight = 100
}
local checkboxSheet = graphics.newImageSheet( "checkboxSheet.png", options )

-- Create the widget
local checkbox = widget.newSwitch(
	{
		left = 250,
		top = 200,
		style = "checkbox",
		id = "Checkbox",
		width = 100,
		height = 100,
		onPress = onSwitchPress,
		sheet = checkboxSheet,
		frameOff = 1,
		frameOn = 2
	}
)
``````

##### Image Sheet &mdash; On-Off Switch

``````lua
local widget = require( "widget" )

-- Handle press events for the checkbox
local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end

-- Image sheet options and declaration
-- For testing, you may copy/save the image under "Visual Customization: On/Off Switch" above
local options = {
    frames = {
        { x=0, y=0, width=160, height=44 },
        { x=0, y=45, width=42, height=42 },
        { x=44, y=45, width=42, height=42 },
        { x=88, y=44, width=96, height=44 }
    },
    sheetContentWidth = 184,
    sheetContentHeight = 88
}
local onOffSwitchSheet = graphics.newImageSheet( "widget-on-off-sheet.png", options )

-- Create the widget
local onOffSwitch = widget.newSwitch(
	{
		left = 250,
		top = 200,
		style = "onOff",
		id = "OnOffSwitch",
		onPress = onSwitchPress,

		sheet = onOffSwitchSheet,
    
		onOffBackgroundFrame = 1,
		onOffBackgroundWidth = 160,
		onOffBackgroundHeight = 44,
		onOffMask = "widget-on-off-mask.png",

		onOffHandleDefaultFrame = 2,
		onOffHandleOverFrame = 3,

		onOffOverlayFrame = 4,
		onOffOverlayWidth = 96,
		onOffOverlayHeight = 44
	}
)
``````
