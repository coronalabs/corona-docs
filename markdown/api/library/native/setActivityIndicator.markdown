
# native.setActivityIndicator()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          activity indicator
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays or hides a platform-specific activity indicator. Touch events are ignored while the indicator is shown.

Note that on Android, the activity indicator is shown as a popup dialog, while on iOS and macOS it's an overlay. For Win32 desktop apps, the mouse cursor changes to a "busy/waiting" cursor.


## Gotchas

* The indicator will not show until the Lua code block containing the `native.setActivityIndicator(true)` call has completed execution. Also, if you try to show and hide the indicator within the same code block, the indicator will not show properly. Instead, call the code to hide the activity indicator in a separate function call or callback. The code in the example uses a timer to hide the indicator after 2 seconds have elapsed.

* The native activity indicator is not part of the OpenGL canvas and does not obey the display object hierarchy, so it will always appear in front of normal display objects including images, text, and vector objects.


## Syntax

	native.setActivityIndicator( state )

##### state ~^(required)^~
_[Boolean][api.type.Boolean]._ Use `true` to show the indicator and `false` to hide it.


## Example

``````lua
native.setActivityIndicator( true )

-- Hide activity indicator after 2 seconds
timer.performWithDelay( 2000, function() 
	native.setActivityIndicator( false )
end )
``````
