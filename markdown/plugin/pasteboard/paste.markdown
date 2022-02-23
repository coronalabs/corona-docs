# pasteboard.paste()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [function][api.type.Function]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          paste, pasteboard
> __See also__          [Pasteboard][plugin.pasteboard]
>								[pasteboard.copy()][plugin.pasteboard.copy]
>								[pasteboard.clear()][plugin.pasteboard.clear]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pastes the top-most item on the pasteboard.


## Gotchas

Image copying/pasting is only supported on iOS.


## Syntax

	pasteboard.paste( [listener] )

##### listener ~^(optional)^~
_[Function][api.type.Function]._ Listener function to be called when the paste is executed. This function is passed an `event` table which may contain the following properties, depending on the type of the data pasted:

* `event.filename` ([string][api.type.String]) &mdash; Name of the image that was pasted.
* `event.baseDir` ([constant][api.type.Constant]) &mdash; The base system directory of the pasted image.
* `event.string` ([string][api.type.String]) &mdash; The pasted string.
* `event.url` ([string][api.type.String]) &mdash; The pasted URL.


## Example

``````lua
local pasteboard = require( "plugin.pasteboard" )

-- Callback function for the paste method
local function onPaste( event )

	-- Print the type of data on the pasteboard
	print( "Type of data:", pasteboard.getType() )

	-- Paste an image
	if ( event.filename ) then
		print( "filename is:", event.filename )
		print( "baseDir is:", event.baseDir )
	end
	
	-- Paste a string
	if ( event.string ) then
		print( "string is:", event.string )
	end
	
	-- Paste a URL
	if ( event.url ) then
		print( "URL is:", event.url )
	end
end

pasteboard.paste( onPaste )
``````