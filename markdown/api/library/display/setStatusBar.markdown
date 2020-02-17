
# display.setStatusBar()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          status bar, hide status bar, change status bar
> __See also__          [display.topStatusBarContentHeight][api.library.display.topStatusBarContentHeight]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hides or changes the appearance of the status bar on most devices.


## Gotchas

* On iOS devices, there is an optional parameter in the <nobr>`iphone` &rarr; `plist`</nobr> section of `build.settings` ([guide][guide.distribution.buildSettings]) which also controls whether the status bar is hidden or not. This API overrides the `plist` setting __after__ the app loads. While the app is loading (when&nbsp;the splash screen is&nbsp;visible), the `plist` setting will control whether the status bar is visible or not.

* macOS desktop and Win32 desktop apps do not support status bars.


## Syntax

	display.setStatusBar( mode )

##### mode ~^(required)^~
_[Constant][api.type.Constant]._ This argument should be one of the following:

* `display.HiddenStatusBar`
* `display.DefaultStatusBar`
* `display.TranslucentStatusBar`
* `display.DarkStatusBar`
* `display.LightTransparentStatusBar`
* `display.DarkTransparentStatusBar`


## Example

``````lua
display.setStatusBar( display.HiddenStatusBar )
``````
