# object:setValue()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, stepper, increment, decrement, StepperWidget, setValue
> __See also__          [object:getValue()][api.type.StepperWidget.getValue]
>						[object.value][api.type.StepperWidget.value]
>						[widget.newStepper()][api.library.widget.newStepper]
>						[StepperWidget][api.type.StepperWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This method sets the current value of a [StepperWidget][api.type.StepperWidget]. Note that the value passed to this function will not adhere to the stepper's minimum or maximum value. For example, if the stepper has a maximum value of `10` and you pass `20` as the `value` parameter, the stepper's value will be `20`. Thus, you should only pass in a `value` integer that is within range of your stepper's minimum and maximum values, if defined.


## Syntax

	object:setValue( value )

##### value ~^(required)^~
_[Number][api.type.Number]._ Integer at which to set the stepper's current value.


## Example

``````lua
-- Create a default stepper
local stepper = widget.newStepper
{
    left = 140,
    top = 235,
    minimumValue = 0,
    maximumValue = 50,
    initialValue = 5
}

stepper:setValue( 10 )
``````
