# zip.uncompress()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [zip.*][plugin.zip]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          zip, uncompress
> __See also__          [zip.compress()][plugin.zip.compress]
>						[zip.list()][plugin.zip.list]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Extracts (uncompresses) all files from a zip archive.


## Syntax

	zip.uncompress( options )

##### options ~^(required)^~
_[Table][api.type.Table]._ A table of options for the function call &mdash; see the next section for details.


## Options Reference

##### zipFile ~^(required)^~
_[String][api.type.String]._ The zip file to extract files from.

##### zipBaseDir ~^(required)^~
_[Constant][api.type.Constant]._ The base directory containing the zip archive.

##### dstBaseDir ~^(required)^~
_[Constant][api.type.Constant]._ The destination folder to extract files to.

##### files ~^(optional)^~
_[Array][api.type.Array]._ A table specifying file names to extract from the archive. By default all files will be extracted.

##### password ~^(optional)^~
_[String][api.type.String]._ The password which was used to encrypt the zip file (standard&nbsp;Zip&nbsp;2.0&nbsp;encryption).

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener function invoked at the end of the operation.


### Example

``````lua
local zip = require( "plugin.zip" )

local function zipListener( event )

	if ( event.isError ) then
		print( "Error!" )
	else
		print ( event["type"] )  --> uncompress
		print ( event.response[1] )  --> space.jpg
		print ( event.response[2] )  --> space1.jpg
	end
end

-- Attempts to uncompress all files from "test.zip" to a destination folder
local zipOptions =
{
	zipFile = "test.zip",
	zipBaseDir = system.ResourceDirectory,
	dstBaseDir = system.DocumentsDirectory,
	files = { "space.jpg", "space1.jpg" },
	listener = zipListener
}
zip.uncompress( zipOptions )
``````
