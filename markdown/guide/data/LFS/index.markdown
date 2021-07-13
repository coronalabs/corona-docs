# Lua File System (LFS)

This guide discusses how to use the __Lua&nbsp;File&nbsp;System__ library, often simply referred to as __LFS__.

<div class="guides-toc">

* [Overview](#overview)
* [Directory Scanning](#directory-scanning)
* [Adding Directories](#adding-directories)
* [Deleting Directories](#deleting-directories)
* [Timestamps](#timestamps)
* [Further Reference](#reference)

</div>


<a id="overview"></a>

## Overview

__LFS__ is a powerful Lua library which allows developers to perform common file system activities that can't normally be done in plain Lua&nbsp;&mdash; things like getting file attributes, creating and removing directories (folders), and iterating over files in a directory.




<a id="directory-scanning"></a>

## Directory Scanning

Imagine a "drawing" app that allows users to create and save <nobr>image-based</nobr> files to the device's documents directory (`system.DocumentsDirectory`). In this instance, it's relatively easy to keep track of what a user does __inside__ of the app, for example by maintaining a list/database of the created drawings and updating it whenever an image file is added or removed to/from the app's documents directory.

However, for more advanced functionality like file sharing, where users can import and export drawings, Lua by itself will not suffice. This is where LFS can be extremely powerful. Essentially, every time the app is launched, LFS can be used to scan the contents of `system.DocumentsDirectory` and "check" for new drawings. This can be done as often as needed to ensure an accurate account of exactly what's inside the folder.

Here's a basic example of how to iterate over the contents of an app's documents directory using a `for` loop:

``````lua
local lfs = require( "lfs" )
local path = system.pathForFile( nil, system.DocumentsDirectory )

for file in lfs.dir( path ) do
	-- "file" is the current file or directory name
	print( "Found file or directory: " .. file )
end
``````




<a id="adding-directories"></a>

## Adding Directories

If an app downloads external assets (files) and those files must be organized in a logical manner, adding or removing directories is absolutely essential. Fortunately, LFS makes this task easy:

1. First, set the destination for the __new__ directory using `lfs.chdir()`:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
local lfs = require( "lfs" )
local path = system.pathForFile( nil, system.DocumentsDirectory )

-- Change current working directory
local success = lfs.chdir( path )  -- Returns boolean true on success
``````

</div>

2. Next, use `lfs.mkdir()` to actually create the directory:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[2]" }
if success then
	lfs.mkdir( "MyNewFolder" )
end
``````

</div>

3. Finally, if desired, store the path to the new directory in a variable:

<div class="code-indent">

``````lua
local newFolderPath = lfs.currentdir() .. "/MyNewFolder"
``````

</div>




<a id="deleting-directories"></a>

## Deleting Directories

If you need to remove (delete) a directory, use the existing [os.remove()][api.library.os.remove] function, for instance:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1]" }
local result, reason = os.remove( system.pathForFile( "MyNewFolder", system.DocumentsDirectory ) )

if result then
	print( "Directory removed!" )
else
	print( "Removal failed: " .. reason )
end
``````




<a id="timestamps"></a>

## Timestamps

In some cases, it may be necessary to periodically check the "last&nbsp;modified" timestamp of certain files, especially if the app uses any kind of syncing functionality. Timestamps may also be useful for tracking when the user last __read__ a specific file (but&nbsp;didn't necessarily change&nbsp;it).

### Setting a New Timestamp

Imagine a file called `mydata.txt` resides inside of `system.DocumentsDirectory`. To set a timestamp for when the user last read the file, use LFS to __touch__ the file. In doing so, the timestamp will be set to today/now.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
local lfs = require( "lfs" )
local filePath = system.pathForFile( "mydata.txt", system.DocumentsDirectory )

-- "Touch" the file
lfs.touch( filePath )
``````

### Retrieving an Existing Timestamp

To find out when a file was last modified, the `access` or `modification` properties of `lfs.attributes` can be accessed:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6]" }
local lfs = require( "lfs" )
local filePath = system.pathForFile( "mydata.txt", system.DocumentsDirectory )

-- Get/print last modified time
local fileAttributes = lfs.attributes( filePath )
print( "File last modified: " .. fileAttributes.modification )
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The value returned for the timestamp will be the number of seconds since <nobr>January 1, 1970</nobr> at midnight. For more information on time and dates in Solar2D, see the [Utilizing Time and Dates][tutorial.data.timeDates#longer-periods-of-time] tutorial.

</div>




<a id="reference"></a>

## Further Reference

LFS is very powerful and it can do much more than what is illustrated in this guide. Fortunately, most of the LFS functions are straightforward and easy to use. Please see the [LFS Reference](https://keplerproject.github.io/luafilesystem/manual.html#reference) for a complete listing of available functions and syntax details for each one.
