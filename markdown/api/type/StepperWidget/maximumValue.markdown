# object.maximumValue

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [widget.*][api.library.widget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, stepper, increment, decrement, StepperWidget, maximumValue
> __See also__          [object.minimumValue][api.type.StepperWidget.minimumValue]
>						[object.value][api.type.StepperWidget.value]
>						[widget.newStepper()][api.library.widget.newStepper]
>						[StepperWidget][api.type.StepperWidget]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A read-only property that represents the maximum value of the [StepperWidget][api.type.StepperWidget].


## Examples

``````lua
-- Handle stepper events
local function onPress( event )

    print( "Stepper's maximum value is:", event.maximumValue )
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
