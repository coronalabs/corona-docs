# object:read()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [File][api.type.File]
> __Library__           [io.*][api.library.io]
> __Return value__      [String][api.type.String], [Number][api.type.Number], or `nil`
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          read, files
> __See also__          [io.open()][api.library.io.open]
>                       [Reading and Writing Files][guide.data.readWriteFiles]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Reads a file, according to the given formats which specify what to read. For each format, the function returns a [string][api.type.String] or a [number][api.type.Number] with the characters read, or `nil` if it cannot read data with the specified format. When called without formats, it uses a default format that reads the entire next line.


## Syntax

	File:read( [fmt1] [, fmt2] [, ...] )

##### fmt1, fmt2, ... ~^(optional)^~
_[String][api.type.String] or [Number][api.type.Number]._ The available formats are:

* `"*l"` &mdash; Reads the next line (skipping the end of line), returning `nil` on end of file (EOF). This is the **default** format.
* `"*n"` &mdash; Reads a [number][api.type.Number]; this is the only format that returns a [number][api.type.Number] instead of a [string][api.type.String].
* `"*a"` &mdash; Reads the whole file, starting at the current position. On end of file, it returns the empty string.
* [Number][api.type.Number] &mdash; Reads up to this number of characters, returning `nil` on end of file. If this number is `0`, it reads nothing and returns an empty string, or `nil` on end of file.


## Example

``````lua
-- Path for the file to read
local path = system.pathForFile( "myfile.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "r" )

if not file then
	-- Error occurred; output the cause
	print( "File error: " .. errorString )
else
	-- Read data from file
	local contents = file:read( "*a" )
	-- Output the file contents
	print( "Contents of " .. path .. "\n" .. contents )
	-- Close the file handle
	io.close( file )
end

file = nil
``````
