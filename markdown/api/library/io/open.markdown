
# io.open()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [io.*][api.library.io]
> __Return value__      [Object][api.type.Object]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          io, open, file
> __See also__          [io.close()][api.library.io.close]
>						[io.read()][api.library.io.read]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function opens a file for reading or writing, in the string (default) or binary mode. It returns a new file handle or, in case of errors, `nil` plus an error message. This function can also be used to create a new file.


## Syntax

	io.open( file [, mode] )

##### file ~^(required)^~
_[Object][api.type.Object]._ File to open. You must use [system.pathForFile()][api.library.system.pathForFile] to create a file name and path to the `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory`, or `system.CachesDirectory` [constants][api.type.Constant].

##### mode ~^(optional)^~
_[String][api.type.String]._ Determines which file mode to open the file in. The mode string can be any of the following:

* `"r"` &mdash; Read mode (the default); the file pointer is placed at the beginning of the file.

* `"w"` &mdash; Write-only mode; overwrites the file if the file exists. If the file does not exist, creates a new file for writing.

* `"a"` &mdash; Append mode (write only); the file pointer is at the end of the file if the file exists (the file is in the append mode). If the file does not exist, it creates a new file for writing.

* `"r+"` &mdash; Update mode (read/write); all previous data is preserved. The file pointer will be at the beginning of the file. If the file exists, it will only be overwritten if you explicitly write to it.

* `"w+"` &mdash; Update mode (read/write); all previous data is erased. Overwrites the existing file if the file exists. If the file does not exist, creates a new file for reading and writing.

* `"a+"` &mdash; Append update mode (read/write); previous data is preserved and writing is only allowed at the end of file. The file pointer is at the end of the file if the file exists (the file opens in the append mode). If the file does not exist, it creates a new file for reading and writing.

The mode string can also have a `'b'` at the end, which is needed in some systems to open the file in binary mode. This string is exactly what is used in the standard C function fopen.


## Gotchas

For security reasons, you are not allowed to **write** files in the `system.ResourceDirectory` (the directory where the application is stored; your project directory; where `main.lua` resides). You must specify the `system.DocumentsDirectory`, `system.TemporaryDirectory`, or `system.CachesDirectory` parameter in [system.pathForFile()][api.library.system.pathForFile] function when opening the file for writing.


## Example

`````lua
-- Path for the file to read
local path = system.pathForFile( "myfile.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "r" )

if not file then
	-- Error occurred; output the cause
	print( "File error: " .. errorString )
else
	-- Output lines
	for line in file:lines() do
		print( line )
	end
	-- Close the file handle
	io.close( file )
end

file = nil
`````
