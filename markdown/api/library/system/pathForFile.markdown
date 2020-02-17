# system.pathForFile()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [system.*][api.library.system]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system directory
> __See also__          [Reading and Writing Files][guide.data.readWriteFiles] _(guide)_
>						[system.ApplicationSupportDirectory][api.library.system.ApplicationSupportDirectory]
>						[system.CachesDirectory][api.library.system.CachesDirectory]
>						[system.DocumentsDirectory][api.library.system.DocumentsDirectory]
>						[system.ResourceDirectory][api.library.system.ResourceDirectory]
>						[system.TemporaryDirectory][api.library.system.TemporaryDirectory]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Generates an absolute path using system-defined directories as the base. An additional optional parameter, `baseDirectory`, specifies which base directory is used to construct the full path, with its default value being `system.ResourceDirectory`.

This function is intended for use with file I/O APIs, __not__ for display/media APIs that require a `baseDir` or `baseDirectory` parameter.


## Syntax

	system.pathForFile( filename [, baseDirectory] )

##### filename ~^(required)^~
_[String][api.type.String]._ The name of the file, or a path to the file that is relative to `baseDirectory`. Alternatively, pass `nil` to get the path to `baseDirectory`.

##### baseDirectory ~^(optional)^~
_[Constant][api.type.Constant]._ Constant corresponding to the base directory where the file is located. Default value is [system.ResourceDirectory][api.library.system.ResourceDirectory] if the parameter is not provided.


## Gotchas

### General

If the base directory is [system.ResourceDirectory][api.library.system.ResourceDirectory] and the generated path points to a <nobr>non-existent</nobr> file, `nil` is returned and a warning message is displayed in the Corona Simulator Console.

### Android File Restrictions

File access in Corona is based on the underlining operating system which varies by platform. On iOS devices, you can access files in all of the directories described above. On Android, however, there is no literal `system.ResourceDirectory` because all resource files reside inside a compressed `.apk` file.

Corona allows direct loading of images and audio files using the appropriate APIs, but it has limited access to resource files on Android using the file I/O APIs. Specifically, the following types can not be read from the resources directory: `.html`, `.htm`, `.3gp`, `.lua`, `.m4v`, `.mp4`, `.png`, `.jpg`, and `.ttf`.

Because of this limitation, if you have files of these types bundled in the core directory that you need to copy to another directory, you must change the file name so it can be accessed by the file I/O APIs. For example, if you want to move `cat.png` from the resource directory to the documents directory, it must be renamed `cat.png.txt` to be copied. See the [Reading and Writing Files][guide.data.readWriteFiles] guide for more information and examples.


## Examples

##### Get Path to Specific File

``````lua
local path = system.pathForFile( "data.txt", system.DocumentsDirectory )
local fhd = io.open( path )
 
-- Determine if file exists
if fhd then
   print( "File exists" )
   fhd:close()
else
    print( "File does not exist!" )
end
``````

##### Get Path to Base Directory

``````lua
local path = system.pathForFile( nil, system.DocumentsDirectory )
print( path )
``````
