
# display.imageSuffix

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          imageSuffix
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns the suffix used by the [dynamic image selection][guide.basics.configSettings] feature of Corona. If the content scaling is 1, then returns `nil`.

The suffixes are defined in a table in `config.lua`. Corona will select the closest matching suffix, defined as the one whose scale is equal to or smaller than the current content scaling factor (the ratio between the pixel dimensions of the screen and the content dimensions specified in `config.lua`). See the [Project Configuration][guide.basics.configSettings] guide for details.

## Example
 
``````lua
local imageSuffix = display.imageSuffix
print( imageSuffix )
``````
