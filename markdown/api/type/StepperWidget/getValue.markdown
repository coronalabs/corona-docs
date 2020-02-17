# object:getValue()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, stepper, increment, decrement, StepperWidget, getValue
> __See also__          [object:setValue()][api.type.StepperWidget.setValue]
>						[object.value][api.type.StepperWidget.value]
>						[widget.newStepper()][api.library.widget.newStepper]
>						[StepperWidget][api.type.StepperWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This method gets the current value of a [StepperWidget][api.type.StepperWidget]. Unlike [object.value][api.type.StepperWidget.value], this is not restricted to usage within the stepper's listener function.

## Syntax

	object:getValue()


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

print( stepper:getValue() )
``````
