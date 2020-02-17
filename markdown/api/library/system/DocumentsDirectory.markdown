# system.DocumentsDirectory

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Constant][api.type.Constant]
> __Library__           [system.*][api.library.system]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system directory, DocumentsDirectory
> __See also__          [system.pathForFile()][api.library.system.pathForFile]
>						[system.ApplicationSupportDirectory][api.library.system.ApplicationSupportDirectory]
>						[system.CachesDirectory][api.library.system.CachesDirectory]
>						[system.ResourceDirectory][api.library.system.ResourceDirectory]
>						[system.TemporaryDirectory][api.library.system.TemporaryDirectory]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Used with [system.pathForFile()][api.library.system.pathForFile] to create a path for storing and retrieving files that need to persist between application sessions. The path is `/Documents`.

This property can also be used with other APIs requesting `baseDir` as a parameter, for example [display.newImageRect()][api.library.display.newImageRect], [display.save()][api.library.display.save], etc.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* In the Corona Simulator, this will be in a sandboxed folder on a <nobr>per-application</nobr> basis. You can view its directories/files via <nobr>__File__ &rarr; __Show&nbsp;Project&nbsp;Sandbox__</nobr>.

* On iOS, this information is backed up by syncing.

</div>


## Syntax

	system.DocumentsDirectory


## Example

``````lua
-- Get path for file "data.txt" in the documents directory
local path = system.pathForFile( "data.txt", system.DocumentsDirectory )

-- Open the file from the path
local fh, reason = io.open( path, "r" )

if fh then
	-- File exists; read its contents into a string
	local contents = fh:read( "*a" )
	print( "Contents of " .. path .. "\n" .. contents )
	
else
	-- File open failed; output the reason
	print( "File open failed: " .. reason )

	-- Create file since it doesn't exist yet
	fh = io.open( path, "w" )

	if fh then
		print( "Created file" )
	else
		print( "Create file failed!" )
	end

	local numbers = { 1,2,3,4,5,6,7,8,9 }
	fh:write( "Feed me data!\n", numbers[1], numbers[2], "\n" )

	for _,v in ipairs( numbers ) do 
		fh:write( v, " " )
	end

	fh:write( "\nNo more data\n" )
end
 
io.close( fh )
``````
