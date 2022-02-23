# zip.compress()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [zip.*][plugin.zip]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          zip, compress
> __See also__          [zip.uncompress()][plugin.zip.uncompress]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates or adds files to a zip archive.


## Syntax

	zip.compress( options )
	
##### options ~^(required)^~
_[Table][api.type.Table]._ A table of options for the function call &mdash; see the next section for details.


## Options Reference

##### zipFile ~^(required)^~
_[String][api.type.String]._ The zip file to compress files to.

##### zipBaseDir ~^(required)^~
_[Constant][api.type.Constant]._ The base directory containing the zip archive.

##### srcBaseDir ~^(required)^~
_[Constant][api.type.Constant]._ The base directory containing the files to add to the zip archive.

##### srcFiles ~^(required)^~
_[Array][api.type.Array]._ A table specifying a set of file names to compress into the archive.

##### password ~^(optional)^~
_[String][api.type.String]._ An optional password for the zip file, using standard Zip&nbsp;2.0 encryption (WinZip&nbsp;AES&nbsp;encryption is currently not&nbsp;supported).

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener function invoked at the end of the operation.


## Example

``````lua
local zip = require( "plugin.zip" ) 

local function zipListener( event )

	if ( event.isError ) then
		print( "Error!" )
	else
		print ( event["type"] )  --> compress
		print ( event.response[1] )  --> space.jpg
		print ( event.response[2] )  --> space1.jpg
		print ( event.response[3] )  --> space2.jpg
	end
end

-- Attempts to compress files in the "srcFiles" parameter to "test.zip"
local zipOptions = { 
	zipFile = "test.zip",
	zipBaseDir = system.DocumentsDirectory,
	srcBaseDir = system.ResourceDirectory,
	srcFiles = { "space.jpg", "space1.jpg", "space2.jpg" },
	listener = zipListener
}
zip.compress( zipOptions )
``````
