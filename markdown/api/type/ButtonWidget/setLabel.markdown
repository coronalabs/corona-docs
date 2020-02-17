# object:setLabel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, button, ButtonWidget, setLabel
> __See also__          [object:getLabel()][api.type.ButtonWidget.getLabel]
>						[widget.newButton()][api.library.widget.newButton]
>						[ButtonWidget][api.type.ButtonWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets/updates the [ButtonWidget][api.type.ButtonWidget] label text.

## Syntax

	object:setLabel( label )

##### label ~^(required)^~
_[String][api.type.String]._ The new/updated label for the button.

## Example

``````lua
myButton:setLabel( "New Label" )
``````
