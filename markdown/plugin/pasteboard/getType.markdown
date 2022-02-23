# pasteboard.getType()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          getType, pasteboard
> __See also__          [Pasteboard][plugin.pasteboard]
>								[pasteboard.setAllowedTypes()][plugin.pasteboard.setAllowedTypes]
>								[pasteboard.copy()][plugin.pasteboard.copy]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the type of data of the top-most item on the pasteboard. Returns either `"string"`, `"url"`, `"image"` when data is present. Otherwise returns `nil`.


## Syntax

	pasteboard.getType() 


## Example

``````lua
local pasteboard = require( "plugin.pasteboard" )

-- Get the type of data on the pasteboard
local dataType = pasteboard.getType()
``````