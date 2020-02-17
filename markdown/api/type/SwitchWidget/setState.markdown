# object:setState()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, switch, radio, on-off, checkbox, SwitchWidget, setState
> __See also__          [widget.newSwitch()][api.library.widget.newSwitch]
>						[SwitchWidget][api.type.SwitchWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Used to programatically set the state of a [SwitchWidget][api.type.SwitchWidget]. This also changes the state of the switch visually.

## Syntax

	object:setState( options )

This function takes a single argument, `options`, which is a table that accepts the following parameters:

##### isOn ~^(required)^~
_[Boolean][api.type.Boolean]._ Sets the switch to either on (`true`) or off (`false`).

##### isAnimated ~^(optional)^~
_[Boolean][api.type.Boolean]._ Applies only to switches with `style` of `"onOff"`. If set to `true`, the switch will visually animate its state change.

##### onComplete ~^(optional)^~
_[Listener][api.type.Listener]._ A callback function to be called when the switch has changed state.


## Example

``````lua
-- Create a default on/off switch
local onOffSwitch = widget.newSwitch
{
    left = 100,
    top = 300,
    initialSwitchState = true
}

local function changeComplete()
    print( "Switch change complete!" )
end

-- Set the on/off switch to off
onOffSwitch:setState( { isOn=false, isAnimated=true, onComplete=changeComplete } )
``````
