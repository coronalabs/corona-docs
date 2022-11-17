# lfs.* (file system) 

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          lfs, LuaFileSystem, files, file system
> __See also__          [LuaFileSystem Reference](https://lunarmodules.github.io/luafilesystem/manual.html#reference)
> --------------------- ------------------------------------------------------------------------------------------

## Overview

__LuaFileSystem__ provides functionality to perform various <nobr>file-related</nobr> tasks, including but not limited to:

* Traversing directory listings.
* Creating and deleting directories (folders).
* Get file attributes.

To delete a directory or file, please refer to [os.remove()][api.library.os.remove].

To rename a directory or file, please refer to [os.rename()][api.library.os.rename].


## Examples

##### Traverse a Directory

`````lua
local lfs = require( "lfs" )

-- Get raw path to the app documents directory
local doc_path = system.pathForFile( "", system.DocumentsDirectory )

for file in lfs.dir( doc_path ) do
	-- "file" is the current file or directory name
	print( "Found file: " .. file )
end
`````

##### Working With Directories

`````lua
local lfs = require( "lfs" )

-- Get raw path to the app temporary directory
local temp_path = system.pathForFile( "", system.TemporaryDirectory )

-- Change current working directory
local success = lfs.chdir( temp_path )  --returns true on success
local new_folder_path

if ( success ) then
lfs.mkdir( "MyNewFolder" )
	new_folder_path = lfs.currentdir() .. "/MyNewFolder"
end
`````
