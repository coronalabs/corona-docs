
# native.setProperty()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native property
> __See also__          [native.getProperty()][api.library.native.getProperty]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets a platform-specific property.

## Syntax

	native.setProperty( key, value )

##### key ~^(required)^~
_[String][api.type.String]._ The property whose value will be changed. Supported keys include:

* `"androidSystemUiVisibility"` &mdash; Android only; see [androidSystemUiVisibility](#androidSystemUiVisibility) below for permissible `value` options.
* `"applicationIconBadgeNumber"` &mdash; iOS only; specify an [integer][api.type.Number].
* `"applicationSupportsShakeToEdit"` &mdash; iOS only; specify a [boolean][api.type.Boolean] for `value`.
* `"networkActivityIndicatorVisible"` &mdash; iOS only; specify a [boolean][api.type.Boolean] for `value`.
* `"prefersHomeIndicatorAutoHidden"` &mdash; iOS only; specify a [boolean][api.type.Boolean] for `value`. If set, iPhone X software home indicator would autohide if screen is not interacted with.
* `"windowMode"` &mdash; Applies only to macOS desktop and Win32 desktop apps; sets the window mode. Supported values include `"normal"`, `"minimized"`, `"maximized"`, or `"fullscreen"`. Default is `"normal"`.
* `"windowTitleText"` &mdash; Applies only to macOS desktop and Win32 desktop apps; sets the window's title bar text to the specified [string][api.type.String].
* `"mouseCursorVisible"` &mdash; Applies only to macOS desktop and Win32 desktop apps. Shows or hides the mouse cursor while it is hovering over the application window. Specify a [boolean][api.type.Boolean] for `value`.
* `"preferredScreenEdgesDeferringSystemGestures"` &mdash; iOS only; specify a [boolean][api.type.Boolean] for `value`. If set, system gestures (Control Center, notification bar, etc.) would not work immediately, but require additional swipe to activate. When possible this setting should be left at default `false` but can be useful to prevent accidental activation of system gestures in swipe heavy games.

##### value ~^(required)^~
_[Number][api.type.Number], [String][api.type.String], or [Boolean][api.type.Boolean]._ The value to set the specified property to, as represented by `key`.


<a id="androidSystemUiVisibility"></a>

### androidSystemUiVisibility

Only available on Android and Fire&nbsp;OS devices. If the version of Android does not support the value, nothing will happen.

* `"immersiveSticky"` &mdash; Only on Android KitKat (Api&nbsp;19) and higher __or__ Fire&nbsp;OS&nbsp;2 <nobr>(fork of API 15)</nobr> and higher. On Android&nbsp;KitKat and higher or Fire&nbsp;OS&nbsp;4 and higher, it will cause the status and navigation bars to disappear and then, if the user swipes from the top or bottom, they will reappear and then disappear again. On Fire&nbsp;OS&nbsp;2 or 3, the status bar and [Soft Key Bar](https://developer.amazon.com/public/solutions/devices/fire-tablets/app-development/03--soft-key-bar) will be hidden and this will not change according to any swiping action.
* `"immersive"` &mdash; Only on Android KitKat (Api&nbsp;19) and higher __or__ Fire&nbsp;OS&nbsp;2 <nobr>(fork of API 15)</nobr> and higher. On Android&nbsp;KitKat and higher or Fire&nbsp;OS&nbsp;4 and higher, it will cause the status and navigation bars to disappear and then, if the user swipes from the top or bottom, they will reappear and stay&nbsp;&mdash; in this case, a [resize][api.event.resize] event will be triggered and the objects on the screen will need to be manually <nobr>re-rendered</nobr> (this&nbsp;is because the content scaling for the device changes and the objects will not have the correct aspect ratio unless they are removed and&nbsp;restored). On Fire&nbsp;OS&nbsp;2 or 3, it has the same effect as `"immersiveSticky"`.
* `"lowProfile"` &mdash; Only on Android Ice Cream Sandwich (Api&nbsp;14) or above. Dims the navigation bar icons.
* `"default"` &mdash; Resets the value.

## Examples

##### Icon Badge Number

`````lua
-- Sets application icon badge number to 10 (iOS only)
native.setProperty( "applicationIconBadgeNumber", 10 )
`````

##### Android System UI Visibility

`````lua
-- Sets system UI visibility (Android KitKat or above)
native.setProperty( "androidSystemUiVisibility", "immersiveSticky" )
`````

##### Window Mode

`````lua
-- Sets the window mode (Win32 desktop and macOS desktop apps only)
native.setProperty( "windowMode", "maximized" )
`````

##### Window Title

`````lua
-- Sets the window title text (Win32 desktop and macOS desktop apps only)
native.setProperty( "windowTitleText", "Window Title Test" )
`````
