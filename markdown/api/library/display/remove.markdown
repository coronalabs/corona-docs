
# display.remove()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          removing, deleting, objects
> __See also__          [object:removeSelf()][api.type.DisplayObject.removeSelf]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Removes an object or group if not `nil`.

This is the same as calling [object:removeSelf()][api.type.DisplayObject.removeSelf], but will first check if the object exists before attempting to remove.


## Syntax

	display.remove( object )

##### object ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ The variable referencing the display object <nobr>(vector, image, or group)</nobr> to be removed.

## Example

`````lua
local obj = display.newImage( "image.png" )
obj:translate( 100, 100 )

-- Remove the object
display.remove( obj )
obj = nil
`````