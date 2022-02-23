# zip.list()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [zip.*][plugin.zip]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          zip, list
> __See also__          [zip.compress()][plugin.zip.compress]
>                       [zip.uncompress()][plugin.zip.uncompress]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Lists all files in a zip archive.


## Syntax

	zip.list( options )

##### options ~^(required)^~
_[Table][api.type.Table]._ A table of options for the function call &mdash; see the next section for details.


## Options Reference

##### zipFile ~^(required)^~
_[String][api.type.String]._ The filename of the zip archive.

##### zipBaseDir ~^(required)^~
_[Constant][api.type.Constant]._ The base directory containing the zip archive.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener function invoked at the end of the operation.


## Example

``````lua
local zip = require( "plugin.zip" )

local function zipListener( event )

	if ( event.isError ) then
		print( "Error!" )
	else
		print ( event["type"] )  --> list
		print( event.response )
		--> [1] = table: 0x618001466580 {
		-->     ratio: 98
		-->     size: 2188295440
		-->     file: space.jpg
		--> [2] = table: 0x618001466580 {
		-->     ratio: 98
		-->     size: 2188295440
		-->     file: space1.jpg
	end
end

-- List all files from "test.zip" with additional file info
local zipOptions = {
	zipFile = "test.zip",
	zipBaseDir = system.DocumentsDirectory,
	listener = zipListener
}

zip.list( zipOptions )
``````
