# pasteboard.setAllowedTypes()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setAllowedTypes, pasteboard
> __See also__          [Pasteboard][plugin.pasteboard]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the file types that your app will accept when pasting. For example, if you only wish the app to paste strings, include just `"string"` in the `allowedTypes` table.


## Syntax

	pasteboard.setAllowedTypes( allowedTypes ) 
	pasteboard.setAllowedTypes( nil )

##### allowedTypes ~^(optional)^~
_[Table][api.type.Table]._ Table containing a comma-delimited list of data types the app will accept for a paste action. Valid options include `"image"`, `"string"`, and `"url"`. You can also pass `nil` to disable all paste operations.


## Example

``````lua
local pasteboard = require( "plugin.pasteboard" )

-- Set the data types this application allows for a paste action
pasteboard.setAllowedTypes( { "string", "url", "image" } )
``````