# object:setReturnKey()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextField][api.type.TextField]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setReturnKey, native text input
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the return key value on the keyboard.


## Gotchas

* On iOS, setting the return key to `"next"` will __not__ make the OS jump to the next input field/box when the return key is pressed. However, on Android, this behavior __will__ occur. When using a key value of `"next"`, you should implement a specific focus method using [native.setKeyboardFocus()][api.library.native.setKeyboardFocus] to ensure that the focus passes to the correct field.

* Setting the return key to `"done"` causes no button to show up on the original Kindle Fire.


## Syntax

	object:setReturnKey( key )

##### key ~^(required)^~
_[String][api.type.String]._ The type name of the return button.


## Valid Key Values

<div class="inner-table">

Key					   iOS		 Android
------------------	----------	----------
`"done"`			 &#x2713;	 &#x2713;
`"go"`				 &#x2713;	 &#x2713;
`"next"`			 &#x2713;	 &#x2713;
`"search"`			 &#x2713;	 &#x2713;
`"send"`			 &#x2713;	 &#x2713;
`"none"`						 &#x2713;
`"default"`			 &#x2713;
`"join"`			 &#x2713;
`"route"`			 &#x2713;
`"emergencycall"`	 &#x2713;
------------------	----------	----------

</div>


## Example

``````lua
local textField = native.newTextField( 30, 140, 260, 150 )
textField:setReturnKey( "done" )
``````