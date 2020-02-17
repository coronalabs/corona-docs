# object:setValue()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, sliding control, SliderWidget, setValue
> __See also__          [object.value][api.type.SliderWidget.value]
>						[widget.newSlider()][api.library.widget.newSlider]
>						[SliderWidget][api.type.SliderWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Changes the [SliderWidget][api.type.SliderWidget] handle position, as well as the [object.value][api.type.SliderWidget.value] property.

## Syntax

	object:setValue( percent )

##### percent ~^(required)^~
_[Number][api.type.Number]._ The slider's handle location by percentage.

## Example

``````lua
-- Set slider to 30% full
mySlider:setValue( 30 )
``````