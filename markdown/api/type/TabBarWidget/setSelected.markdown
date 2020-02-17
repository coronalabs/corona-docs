# object:setSelected()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, tab bar, TabBarWidget, setSelected
> __See also__          [widget.newTabBar()][api.library.widget.newTabBar]
>						[TabBarWidget][api.type.TabBarWidget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Use this method to set a specific [TabBarWidget][api.type.TabBarWidget] button to its "selected" state. Optionally, you can invoke the `onPress` listener for the button at the same time.


## Syntax

	object:setSelected( buttonIndex )
	object:setSelected( buttonIndex, simulatePress )


##### buttonIndex ~^(required)^~
_[Number][api.type.Number]._ The button index on the tab bar, starting with `1` indicating the first button from the left.

##### simulatePress ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the tab button specified by `buttonIndex` will have its `onPress` listener function called. The default is `false`, meaning that the tab button will appear "selected" but the listener function will not be called.


## Example

``````lua
-- Select the third tab
tabBar:setSelected( 3 )  

-- Select the second tab button and invoke its listener function
tabBar:setSelected( 2, true ) 
``````
