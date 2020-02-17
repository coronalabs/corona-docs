# object:setEnabled()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, button, ButtonWidget, setEnabled
> __See also__          [widget.newButton()][api.library.widget.newButton]
>						[ButtonWidget][api.type.ButtonWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the [ButtonWidget][api.type.ButtonWidget] as either enabled or disabled.


## Syntax

	object:setEnabled( isEnabled )

##### isEnabled ~^(required)^~
_[Boolean][api.type.Boolean]._ Set this to `false` if you wish to disable touch events on the button, `true` if you wish to re-enable the button's ability to receive touch events.

## Example

``````lua
myButton:setEnabled( false )  -- The button will no longer receive touch events.
``````
