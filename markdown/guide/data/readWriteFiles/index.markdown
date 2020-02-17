# Reading and Writing Files

This guide discusses how to read and write files from/to the device's local storage.

<div class="guides-toc">

* [Overview](#overview)
* [Getting File Paths](#filepath)
* [Writing Files](#writing)
* [Reading Files](#reading)
* [System Directories](#directories)
* [Working With Subfolders](#subfolders)

</div>



<a id="overview"></a>

## Overview

Reading and writing files — data in the form of plain text, JSON, XML, a local SQLite database, etc. — is essential to app development. There are countless cases when your app may need to read and/or write a file, but here are a few common instances:

* Save/load user settings or other statistics.

* Save the "app&nbsp;state" to a file and read it in a future session, so the user can return to exactly the same place where they left off, even if the app has exited.

* Generate a local HTML file and load it in a [native&nbsp;Web&nbsp;view][api.library.native.newWebView].

* Load data from a file that has been downloaded from a remote server and use that data in the app.




<a id="filepath"></a>

## Getting File Paths

The `system.pathForFile()` function is the foundation of all file operations in Corona. Lua requires the entire path of a file when reading and writing, but mobile operating systems such as iOS obscure the file system via "sandboxing." This makes it difficult to determine exactly where the file resides. Fortunately, Corona has simplified this with the [system.pathForFile()][api.library.system.pathForFile] function which returns a path that is compatible with Lua's file I/O functions.

``````lua
system.pathForFile( filename [, baseDirectory] )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The `baseDirectory` argument is an optional constant that corresponds to the base directory where the file is located. If not specified, the default is [system.ResourceDirectory][api.library.system.ResourceDirectory]. See the [System&nbsp;Directories](#directories) section below for more information.

</div>




<a id="writing"></a>

## Writing Files

In the context of this guide, "writing" is synonymous with "saving" since you might need to generate new files as well as write to existing files.


Here's a basic example of how to write data to a file:

``````lua
-- Data (string) to write
local saveData = "My app state data"

-- Path for the file to write
local path = system.pathForFile( "myfile.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "w" )

if not file then
	-- Error occurred; output the cause
	print( "File error: " .. errorString )
else
	-- Write data to file
	file:write( saveData )
	-- Close the file handle
	io.close( file )
end

file = nil
``````

* `system.pathForFile()` — this returns the path for the file to write, `myfile.txt`. Also, note that the base directory is set to `system.DocumentsDirectory`. This is important because, for security reasons, you can __not__ write/save data to `system.ResourceDirectory`.

* `io.open()` — this function opens the file for writing (or&nbsp;reading). It returns a new file handle, set to `file`. The second argument, `"w"`, corresponds to the "mode" that the file will be opened in. This dictates what you'll be doing with the file. In this case, `"w"` indicates __write__ and tells Corona to create (write) a new file, or overwrite the file if it already exists. For a complete list of I/O modes, see the [io.open()][api.library.io.open] documentation.

* `file:write()` — assuming the file is opened in write-compatible mode, the `file:write()` method will write the specified string to the file handle. In this example, the contents of the `saveData` variable are written to the specified file.

* `io.close()` — whenever you perform file operations and you're finished with the file handle, do __not__ forget to call `io.close()`. This method closes the file handle and ends the I/O process.




<a id="reading"></a>

## Reading Files

To read a file, just get the file path, open the I/O in __read__ mode, and set the contents to a variable.

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

* `system.pathForFile()` — once again, you'll need the path to the file that you want to read from. When reading files, you can specify any of the four system directories (see [System&nbsp;Directories](#directories) below). For example, if you include/bundle data files as part of your app, you can __read__ these files from `system.ResourceDirectory`.

* `io.open()` — this function opens the file and returns the file handle, set to `file` in this example. This time, the second argument must be set to `"r"` which corresponds to the __read__ mode. For a complete list of I/O modes, see the [io.open()][api.library.io.open] documentation.

* `file:read()` — assuming the file is opened in read-compatible mode, the `file:read()` method will read the contents of the file and set it to the variable `savedData`. The argument for the read function specifies the format of the procedure. If you want to read the entire contents of the file (newline characters preserved), use `"*a"` as in this example. Other formats are explained in the [object:read()][api.type.File.read] documentation.

* `io.close()` — as emphasized above, whenever you perform file operations and you're finished with the file handle, call `io.close()` to close the file handle and end the I/O process.

### Reading Lines

Another common task when reading data is to process each __line__ of a file and use it for some purpose. For example, if you have a text file representing a list of products along with a price for each, you can loop through the file by lines and output or parse each line (product) individually.

The `file:lines()` function, in conjunction with a `for` loop, accomplishes this:

``````lua
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
``````

This process will return the next line on each iteration and continue until no more lines are available. Each line can be used in its entirety or parsed into smaller elements using string patterns. See the [String&nbsp;Manipulation][guide.data.luaString] guide for details.


<a id="directories"></a>

## System Directories

As noted above, `system.pathForFile()` requires a `baseDirectory` argument if you want to access a directory aside from the default `system.ResourceDirectory`.

Here are all four available system directory constants for reading/writing:

<div class="inner-table">

Directory						Permissions		Description
------------------------------	--------------	------------------------
`system.ResourceDirectory`		read			This directory refers to the core project directory which is the same location as the `main.lua` file. This is the default base directory for `system.pathForFile()`.
`system.DocumentsDirectory`		read/write		This directory is intended for files that the app cannot regenerate on its own, for example user-specific data, "app&nbsp;state" data, or anything that the app generates post-installation. Files in this directory will persist for the lifetime of the app — that is, until the app is explicitly removed from the device. On iOS, files in this location are backed up by syncing unless you specify otherwise (see&nbsp;notes&nbsp;below).
`system.TemporaryDirectory`		read/write		This directory is intended for single-session data. Files written to this location will generally persist as long as the app is running, but the operating system reserves the right to delete this data at any time. Thus, do __not__ place important data in this directory.
`system.CachesDirectory`		read/write		Files in `system.CachesDirectory` tend to have a longer lifespan than those in `system.TemporaryDirectory`, but this is not reliable and you shouldn't place important data in this directory. On iOS, files in this location are not backed up by syncing.
------------------------------	--------------	------------------------

</div>

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* On Android devices, there is no literal `system.ResourceDirectory` because all resource files reside inside a compressed APK file. See [Android&nbsp;File&nbsp;Restrictions](#androidrestrict) below for more information.

* In the Corona Simulator, equivalents of `system.DocumentsDirectory` and `system.TemporaryDirectory` are located in a sandboxed folder for each application. You can view these directories and the files within by selecting __File__&nbsp;&rarr;&nbsp;__Show&nbsp;Project&nbsp;Sandbox__ in the Simulator.

* On iOS and macOS, the `native.setSync()` API can be used to set the iCloud automatic backup flag for files in `system.DocumentsDirectory`. See [native.setSync()][api.library.native.setSync] for more information.

* When accessing `system.ResourceDirectory` via `system.pathForFile()`, setting the `filename` parameter to `nil` will return the directory path without checking if the file exists.

* If you need to check for the presence of a file, examine [Testing&nbsp;if&nbsp;Files&nbsp;Exist](#testingexist) in the next section.

</div>




<a id="subfolders"></a>

## Working With Subfolders

### Creating Subfolders

Subfolders can be added to `system.DocumentsDirectory` and `system.TemporaryDirectory` using the [LuaFileSystem][api.library.lfs] (LFS).

Here's how to create an `images` folder within `system.DocumentsDirectory`.

``````lua
local lfs = require( "lfs" )

-- Get raw path to documents directory
local docs_path = system.pathForFile( "", system.DocumentsDirectory )

-- Change current working directory
local success = lfs.chdir( docs_path )  -- Returns true on success

local new_folder_path
local dname = "images"

if ( success ) then
	lfs.mkdir( dname )
	new_folder_path = lfs.currentdir() .. "/" .. dname
end
``````


### Accessing Files in Subfolders

You can access files in a subfolder in two ways, depending on what you want to do with the file. If you want to display an image or play a sound from the subfolder, concatenate the subfolder name with the file name and then supply the base directory. For example, if you want to display the `cat.png` file in the `images` subfolder, do the following:

``````lua
local catImage = display.newImage( "images/cat.png", system.DocumentsDirectory, 0, 0 )
``````

Note that you don't use `system.pathForFile()` in API calls that require a `baseDirectory` parameter, for example `display.newImage()`, `display.newImageRect()`, `audio.loadSound()`, etc.

If you want to access a file in a subfolder for reading or writing, do the following:

``````lua
local path = system.pathForFile( "images/readme.txt", system.DocumentsDirectory )
local file, errorString = io.open( path )
``````

If the file doesn't exist, it returns `nil` — this leads to the next topic.

<a id="testingexist"></a>

### Testing if Files Exist

The following function can be used to test if a file exists in a folder or subfolder. Just remember to append the subfolder name to the file name before calling this function.

``````lua
local function doesFileExist( fname, path )

	local results = false

	-- Path for the file
	local filePath = system.pathForFile( fname, path )

	if ( filePath ) then
		local file, errorString = io.open( filePath, "r" )

		if not file then
			-- Error occurred; output the cause
			print( "File error: " .. errorString )
		else
			-- File exists!
			print( "File found: " .. fname )
			results = true
			-- Close the file handle
			file:close()
		end
	end

	return results
end

-- Check for file in "system.DocumentsDirectory"
local results = doesFileExist( "images/cat.png", system.DocumentsDirectory )

-- Check for file in "system.ResourceDirectory"
local results = doesFileExist( "images/cat.png" )
``````

### Copying Files to Subfolders

The following function copies a file from one folder to another. This is useful if you need to copy a file bundled in `system.ResourceDirectory` to `system.DocumentsDirectory`. Note that you must create the destination subfolder before using this function.

``````lua
function copyFile( srcName, srcPath, dstName, dstPath, overwrite )

	local results = false

	local fileExists = doesFileExist( srcName, srcPath )
	if ( fileExists == false ) then
		return nil  -- nil = Source file not found
	end

	-- Check to see if destination file already exists
	if not ( overwrite ) then
		if ( fileLib.doesFileExist( dstName, dstPath ) ) then
			return 1  -- 1 = File already exists (don't overwrite)
		end
	end

	-- Copy the source file to the destination file
	local rFilePath = system.pathForFile( srcName, srcPath )
	local wFilePath = system.pathForFile( dstName, dstPath )

	local rfh = io.open( rFilePath, "rb" )
	local wfh, errorString = io.open( wFilePath, "wb" )

	if not ( wfh ) then
		-- Error occurred; output the cause
		print( "File error: " .. errorString )
		return false
	else
		-- Read the file and write to the destination directory
		local data = rfh:read( "*a" )
		if not ( data ) then
			print( "Read error!" )
			return false
		else
			if not ( wfh:write( data ) ) then
				print( "Write error!" )
				return false
			end
		end
	end

	results = 2  -- 2 = File copied successfully!

	-- Close file handles
	rfh:close()
	wfh:close()

	return results
end

-- Copy "readme.txt" from "system.ResourceDirectory" to "system.DocumentsDirectory"
copyFile( "readme.txt", nil, "readme.txt", system.DocumentsDirectory, true )
``````

<a id="androidrestrict"></a>

### Android File Restrictions

File access in Corona is based on the underlying operating system which varies by platform. On iOS devices, you can access files in all of the directories described above. On Android, however, there is no literal `system.ResourceDirectory` because all resource files reside inside a compressed APK file.

Corona allows direct loading of images and audio files using the appropriate APIs, but it has limited access to resource files on Android using the file I/O APIs. Specifically, the following types can not be read from the resources directory: `.html`, `.htm`, `.3gp`, `.lua`, `.m4v`, `.mp4`, `.png`, `.jpg`, and `.ttf`.
 
Because of this limitation, if you have files of these types bundled in the core directory that you need to copy to another directory, you must change the file name so it can be accessed by the file I/O APIs. For example, if you want to move `cat.png` from the resource directory to the documents directory, it must be renamed `cat.png.txt` to be copied.

Here's how to copy `cat.png` to the documents directory on Android, assuming it's stored as `cat.png.txt`. This technique works for all platforms, so if you make it work for Android, it will work everywhere.

``````lua
copyFile( "cat.png.txt", nil, "cat.png", system.DocumentsDirectory, true )
local catImage = display.newImage( "cat.png", system.DocumentsDirectory, 0, 100 )
``````
