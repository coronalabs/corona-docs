# object.isOn

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Library__           [widget.*][api.library.widget]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, switch, radio, on-off, checkbox, SwitchWidget, isOn
> __See also__          [widget.newSwitch()][api.library.widget.newSwitch]
>						[SwitchWidget][api.type.SwitchWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The read-only state of a [SwitchWidget][api.type.SwitchWidget], either `true` or `false`.

For fine-tuning purposes, this value differs slightly depending on whether the `onPress` or `onRelease` listener is specified in the switch constructor. When reading this property via the `onPress` listener type, the current state of the switch is reported, meaning its state __before__ the actual switch state change occurs. When reading this property via the `onRelease` listener type, the resulting state of the switch is reported, meaning its state __after__ the switch state change occurs.