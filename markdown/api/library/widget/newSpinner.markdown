# widget.newSpinner()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [SpinnerWidget][api.type.SpinnerWidget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, spinner, activity, indicator
> __See also__          [SpinnerWidget][api.type.SpinnerWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a [SpinnerWidget][api.type.SpinnerWidget] object.


## Gotchas

* To conserve texture memory, a [SpinnerWidget][api.type.SpinnerWidget] object can only be created from an [image sheet][api.library.graphics.newImageSheet].


## Syntax

	widget.newSpinner( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification to assign to the spinner. Default is `widget_spinner`.

##### x, y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.

##### left, top ~^(optional)^~
_[Numbers][api.type.Number]._ The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.

##### width, height ~^(optional)^~
_[Numbers][api.type.Number]._ The width and height of each frame from the [image&nbsp;sheet][api.library.graphics.newImageSheet]. If you are using the default theme, these values are set automatically.


## Methods

#### [object:start()][api.type.SpinnerWidget.start]

#### [object:stop()][api.type.SpinnerWidget.stop]


<a id="single"></a>

## Single Frame Construction

A basic spinner can be built using one frame from an [image&nbsp;sheet][api.library.graphics.newImageSheet]. The image will rotate by a specified delta angle on each increment of the specified time.

![][images.simulator.widget-spinner-single]

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image&nbsp;sheet][api.library.graphics.newImageSheet] object for the spinner.

##### startFrame ~^(required)^~
_[Number][api.type.Number]._ The starting frame index of the spinner animation sequence (the index of the sole frame from the sheet).

##### deltaAngle ~^(optional)^~
_[Number][api.type.Number]._ The delta angle by which the spinner rotates per time increment (see `incrementEvery` below). For example, if you specify `30`, the spinner will rotate 30 degrees per increment.

##### incrementEvery ~^(optional)^~
_[Number][api.type.Number]._ The delay for each rotation iteration of the spinner, in milliseconds.


<a id="multi"></a>

## Multi-Frame Construction

An animated spinner can be built using multiple frames from an [image&nbsp;sheet][api.library.graphics.newImageSheet]. This spinner type will loop through the frame sequence over a specified time.

![][images.simulator.widget-spinner-multi]

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image&nbsp;sheet][api.library.graphics.newImageSheet] object for the spinner.

##### startFrame ~^(required)^~
_[Number][api.type.Number]._ The starting frame index of the spinner animation sequence (the first frame in its animation sequence).

##### count ~^(required)^~
_[Number][api.type.Number]._ The total frame count of the spinner animation sequence.

##### time ~^(optional)^~
_[Number][api.type.Number]._ The time for one complete loop of the spinner animation, in milliseconds. Default is `1000`.


## Examples

##### Single Frame

``````lua
local widget = require( "widget" )

-- Image sheet options and declaration
-- For testing, you may copy/save the image under "Single Frame Construction" above
local options = {
    width = 128,
    height = 128,
    numFrames = 1,
    sheetContentWidth = 128,
    sheetContentHeight = 128
}
local spinnerSingleSheet = graphics.newImageSheet( "widget-spinner-single.png", options )

-- Create the widget
local spinner = widget.newSpinner(
	{
		width = 128,
		height = 128,
		sheet = spinnerSingleSheet,
		startFrame = 1,
		deltaAngle = 10,
		incrementEvery = 20
	}
)

spinner:start()
``````

##### Multi-Frame

``````lua
local widget = require( "widget" )

-- Image sheet options and declaration
-- For testing, you may copy/save the image under "Multi-Frame Construction" above
local options = {
    width = 128,
    height = 128,
    numFrames = 4,
    sheetContentWidth = 512,
    sheetContentHeight = 128
}
local spinnerMultiSheet = graphics.newImageSheet( "widget-spinner-multi.png", options )

-- Create the widget
local spinner = widget.newSpinner(
	{
		width = 128,
		height = 128,
		sheet = spinnerMultiSheet,
		startFrame = 1,
		count = 4,
		time = 800
	}
)

spinner:start()
``````
