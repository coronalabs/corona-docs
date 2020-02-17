# widget.newProgressView()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [ProgressViewWidget][api.type.ProgressViewWidget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, progress, progressView, progressIndicator
> __See also__          [ProgressViewWidget][api.type.ProgressViewWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a [ProgressViewWidget][api.type.ProgressViewWidget] object.


## Gotchas

* To conserve texture memory, a [ProgressViewWidget][api.type.ProgressViewWidget] can only be created from an [image&nbsp;sheet][api.library.graphics.newImageSheet].

* [ProgressViewWidget][api.type.ProgressViewWidget] objects do not support [scaling][api.type.DisplayObject.scale] nor changing the width/height via [.width][api.type.DisplayObject.width] or [.height][api.type.DisplayObject.height].


## Syntax

	widget.newProgressView( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### id ~^(optional)^~
_[String][api.type.String]._ An optional identification to assign to the progress view. Default is `widget_progressView`.

##### x, y ~^(optional)^~
_[Numbers][api.type.Number]._ Coordinates for the widget's __x__ and __y__ center point. These values will be overridden by `left` and `top` if those values are defined.

##### left, top ~^(optional)^~
_[Numbers][api.type.Number]._ The left and top position where the widget will be created. If specified, these values override the `x` and `y` parameters.

##### width ~^(required)^~
_[Number][api.type.Number]._ The overall width of the progress view.

##### isAnimated ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set this to `true` if the progress change should be animated, `false` (or&nbsp;omitted) if the progress change should occur instantly.

##### fillXOffset ~^(optional)^~
_[Number][api.type.Number]._ Set this to horizontally offset the fill region of the progress view. Default is `0`.

##### fillYOffset ~^(optional)^~
_[Number][api.type.Number]._ Set this to vertically offset the fill region of the progress view. Default is `0`.


## Visual Customization

The progress view widget can be visually customized using an [image&nbsp;sheet][api.library.graphics.newImageSheet]. As shown in the following example, 6&nbsp;frames can be used to assemble an outer border and an inner fill bar. The outer border consists of the left&nbsp;cap (red), the middle&nbsp;span (green), and the right&nbsp;cap (yellow). The inner fill region consists of a left&nbsp;cap (orange), a&nbsp;middle&nbsp;span (blue), and a right&nbsp;cap (purple).

Depending on the width of the progress view, the outer border caps remain at the size stated in the image sheet and the middle frame (green) stretches to fill the width between. When the progress is set to any value higher than `0.0`, the inner left&nbsp;cap and right&nbsp;cap become visible. Then, depending on the current percentage, the middle fill span (blue) stretches to fill the distance between the two caps.

<div class="float-right" style="float: none; margin: 20px 0px 20px 0px; font-size: 125%; color: #292929; vertical-align: middle;">

------------------------------------------------	------------------	----------------------------------------
![][images.simulator.widget-progress-view]			&nbsp;&rarr;&nbsp;	![][images.simulator.widget-progress-view-final]
------------------------------------------------	------------------	----------------------------------------

</div>

##### sheet ~^(required)^~
_[ImageSheet][api.type.ImageSheet]._ The [image&nbsp;sheet][api.library.graphics.newImageSheet] object for the progress view.

##### fillOuterLeftFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the outer border left cap.

##### fillOuterMiddleFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the outer border middle span.

##### fillOuterRightFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the outer border right cap.

##### fillOuterWidth, fillOuterHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width/height of the outer border frames. All border frames should share the same width and height.

##### fillInnerLeftFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the inner fill left cap.

##### fillInnerMiddleFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the inner fill middle span.

##### fillInnerRightFrame ~^(required)^~
_[Number][api.type.Number]._ The frame index for the inner fill right cap.

##### fillWidth, fillHeight ~^(required)^~
_[Numbers][api.type.Number]._ The width/height of the inner fill frames. All fill frames should share the same width and height.


## Methods

#### [object:setProgress()][api.type.ProgressViewWidget.setProgress]
#### [object:getProgress()][api.type.ProgressViewWidget.getProgress]
#### [object:resizeView()][api.type.ProgressViewWidget.resizeView]


## Examples

##### Default

``````lua
local widget = require( "widget" )

-- Create the widget
local progressView = widget.newProgressView(
	{
		left = 50,
		top = 200,
		width = 220,
		isAnimated = true
	}
)

-- Set the progress to 50%
progressView:setProgress( 0.5 )
``````

##### Image Sheet

``````lua
local widget = require( "widget" )

-- Image sheet options and declaration
-- For testing, you can copy/save the image under "Visual Customization" above
local options = {
	width = 64,
	height = 64,
	numFrames = 6,
	sheetContentWidth = 384,
	sheetContentHeight = 64
}
local progressSheet = graphics.newImageSheet( "widget-progress-view.png", options )

-- Create the widget
local progressView = widget.newProgressView(
	{
		sheet = progressSheet,
		fillOuterLeftFrame = 1,
		fillOuterMiddleFrame = 2,
		fillOuterRightFrame = 3,
		fillOuterWidth = 64,
		fillOuterHeight = 64,
		fillInnerLeftFrame = 4,
		fillInnerMiddleFrame = 5,
		fillInnerRightFrame = 6,
		fillWidth = 64,
		fillHeight = 64,
		left = 50,
		top = 200,
		width = 220,
		isAnimated = true
	}
)

-- Set the progress to 50%
progressView:setProgress( 0.5 )
``````
