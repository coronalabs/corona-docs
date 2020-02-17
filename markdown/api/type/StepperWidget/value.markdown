# object.value

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [widget.*][api.library.widget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, stepper, increment, decrement, StepperWidget, value
> __See also__          [object.minimumValue][api.type.StepperWidget.minimumValue]
>						[object.maximumValue][api.type.StepperWidget.maximumValue]
>						[object:getValue()][api.type.StepperWidget.getValue]
>						[widget.newStepper()][api.library.widget.newStepper]
>						[StepperWidget][api.type.StepperWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A read-only property that represents the current value of the [StepperWidget][api.type.StepperWidget]. This value is any number from the stepper's [minimum value][api.type.StepperWidget.minimumValue] to the stepper's [maximum value][api.type.StepperWidget.maximumValue].

## Gotchas

To read the stepper's value from outside of its listener function, use the [object:getValue()][api.type.StepperWidget.getValue] function.


## Example

``````lua
-- Handle stepper events
local function onPress( event )

    print( "Stepper's current value is:", event.value )
end

-- Create a default stepper
local stepper = widget.newStepper
{
    left = 140,
    top = 235,
    initialValue = 0,
    minimumValue = 0,
    maximumValue = 50,
    onPress = onPress
}
``````
