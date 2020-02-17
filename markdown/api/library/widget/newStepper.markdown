# widget.newStepper()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [StepperWidget][api.type.StepperWidget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, stepper, increment, decrement, control
> __See also__          [StepperWidget][api.type.StepperWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a [StepperWidget][api.type.StepperWidget] object. The stepper consists of a minus and plus button which can be tapped or held down to decrement/increment a value, for example, the music or sound volume setting in a game.

## Gotchas

* To conserve texture memory, a [StepperWidget][api.type.StepperWidget] object can only be created from an [image sheet][api.library.graphics.newImageSheet].

* [StepperWidget][api.type.StepperWidget] objects do not support [scaling][api.type.DisplayObject.scale] nor changing the width/height via [.width][api.type.DisplayObject.width] or [.height][api.type.DisplayObject.height].

## Syntax

	widget.newStepper( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification to assign to the stepper. Default is `widget_stepper`.

##### x, y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.

##### left, top ~^(optional)^~
_[Numbers][api.type.Number]._ The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.

##### width, height ~^(optional)^~
_[Numbers][api.type.Number]._ The width and height of each frame from the [image&nbsp;sheet][api.library.graphics.newImageSheet]. Set these only if you are using a custom image sheet for the stepper. If you are using the default theme, these values are set automatically.

##### initialValue ~^(optional)^~
_[Number][api.type.Number]._ The initial value at which the stepper begins. Default is `0`.

##### minimumValue ~^(optional)^~
_[Number][api.type.Number]._ The minimum value that the stepper can reach. Default is `0`.

##### maximumValue ~^(optional)^~
_[Number][api.type.Number]._ The maximum value that the stepper can reach. Default is no limit.

##### timerIncrementSpeed ~^(optional)^~
_[Number][api.type.Number]._ The initial speed at which each stepper increment occurs, in milliseconds. Default is `1000`. The number of increments at which the speed change occurs can be controlled via `changeSpeedAtIncrement`.

##### changeSpeedAtIncrement ~^(optional)^~
_[Number][api.type.Number]._ The number of increments at which the increment speed changes. Default is `5`. The increment speed can be controlled via `timerIncrementSpeed`.

##### onPress ~^(optional)^~
_[Listener][api.type.Listener]._ An optional function to be called as soon as a stepper segment is pressed and held. This callback function returns the following `event.phase` events: `increment`, `decrement`, `minLimit`, and `maxLimit`.


## Functions

#### [object:getValue()][api.type.StepperWidget.getValue]

#### [object:setValue()][api.type.StepperWidget.setValue]


## Properties

#### [object.value][api.type.StepperWidget.value]

#### [object.minimumValue][api.type.StepperWidget.minimumValue]

#### [object.maximumValue][api.type.StepperWidget.maximumValue]


## Visual Customization

The stepper widget can be visually customized using 5 frames from an [image&nbsp;sheet][api.library.graphics.newImageSheet].

![][images.simulator.widget-stepper]

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image&nbsp;sheet][api.library.graphics.newImageSheet] object for the stepper.

##### defaultFrame ~^(required)^~
_[Number][api.type.Number]._ The default frame used when both the minus and plus sides are active.

##### noMinusFrame ~^(required)^~
_[Number][api.type.Number]._ The frame used when the stepper reaches its minimum value, indicating no apparent result from a tap on the minus side.

##### noPlusFrame ~^(required)^~
_[Number][api.type.Number]._ The frame used when the stepper reaches its maximum value, indicating no apparent result from a tap on the plus side.

##### minusActiveFrame ~^(required)^~
_[Number][api.type.Number]._ The frame used to indicate that a tap/hold occurred on the minus side.

##### plusActiveFrame ~^(required)^~
_[Number][api.type.Number]._ The frame used to indicate that a tap/hold occurred on the plus side.


## Examples

##### Default

``````lua
local widget = require( "widget" )

local currentNumber = 0

-- Handle stepper events
local function onStepperPress( event )

    if ( "increment" == event.phase ) then
        currentNumber = currentNumber + 1
    elseif ( "decrement" == event.phase ) then
        currentNumber = currentNumber - 1
    end
    print( currentNumber )
end
        
-- Create the widget
local newStepper = widget.newStepper(
	{
		left = 150,
		top = 200,
		minimumValue = 0,
		maximumValue = 50,
		onPress = onStepperPress
	}
)
``````

##### Image Sheet

``````lua
local widget = require( "widget" )

local currentNumber = 0

-- Handle stepper events
local function onStepperPress( event )

    if ( "increment" == event.phase ) then
        currentNumber = currentNumber + 1
    elseif ( "decrement" == event.phase ) then
        currentNumber = currentNumber - 1
    end
    print( currentNumber )
end

-- Image sheet options and declaration
-- For testing, you may copy/save the image under "Visual Customization" above
local options = {
    width = 196,
    height = 100,
    numFrames = 5,
    sheetContentWidth = 980,
    sheetContentHeight = 100
}
local stepperSheet = graphics.newImageSheet( "widget-stepper.png", options )

-- Create the widget
local newStepper = widget.newStepper(
	{
		width = 196,
		height = 100,
		sheet = stepperSheet,
		defaultFrame = 1,
		noMinusFrame = 2,
		noPlusFrame = 3,
		minusActiveFrame = 4,
		plusActiveFrame = 5,
		onPress = onStepperPress
	}
)
``````
