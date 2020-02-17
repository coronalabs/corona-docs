# object.value

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, sliding control, SliderWidget, value
> __See also__          [object:setValue()][api.type.SliderWidget.setValue]
>						[widget.newSlider()][api.library.widget.newSlider]
>						[SliderWidget][api.type.SliderWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A read-only property that represents the current value of the [SliderWidget][api.type.SliderWidget]. This is a number between `0` and `100`, representing the percentage at which the slider handle is located.

## Example

``````lua
local sliderPercentage = mySlider.value
``````