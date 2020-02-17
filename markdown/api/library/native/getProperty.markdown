
# native.getProperty()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native property
> __See also__          [native.setProperty()][api.library.native.setProperty]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets the value of a platform-specific property.

## Syntax

	native.getProperty( key )

##### key ~^(required)^~
_[String][api.type.String]._ The property whose value will be retrieved. Supported keys include:

* `"androidSystemUiVisibility"` &mdash; Android and Fire&nbsp;OS only.
* `"applicationIconBadgeNumber"` &mdash; iOS only.
* `"applicationSupportsShakeToEdit"` &mdash; iOS only.
* `"networkActivityIndicatorVisible"` &mdash; iOS only.
* `"prefersHomeIndicatorAutoHidden"` &mdash; iOS only.
* `"windowMode"` &mdash; Applies only to macOS desktop and Win32 desktop apps.
* `"windowTitleText"` &mdash; Applies only to macOS desktop and Win32 desktop apps.
* `"mouseCursorVisible"` &mdash; Applies only to macOS desktop and Win32 desktop apps.
* `"preferredScreenEdgesDeferringSystemGestures"` &mdash; iOS only.

## Example

`````lua
local badge_num = native.getProperty( "applicationIconBadgeNumber" )
badge_num = badge_num + 1

native.setProperty( "applicationIconBadgeNumber", badge_num )
`````
