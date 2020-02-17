# widget.setTheme()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [widget.*][api.library.widget]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          widget, theme, set theme
> __See also__          [widget][api.library.widget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Use this function to set the overall theme of the widget library. This should be called immediately after you `require()` the widget library.


## Syntax

	widget.setTheme( theme )

##### theme ~^(required)^~
_[String][api.type.String]._ The theme name. Valid options include:

* `"widget_theme_android_holo_dark"`
* `"widget_theme_android_holo_light"`
* `"widget_theme_ios7"`
* `"widget_theme_android"` (legacy)
* `"widget_theme_ios"` (legacy)


## Example

`````lua
local widget = require( "widget" )

-- Set a default theme
widget.setTheme( "widget_theme_android_holo_light" )
`````