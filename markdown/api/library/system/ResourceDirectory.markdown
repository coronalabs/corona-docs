# system.ResourceDirectory

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Constant][api.type.Constant]
> __Library__           [system.*][api.library.system]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system directory, ResourceDirectory
> __See also__          [system.pathForFile()][api.library.system.pathForFile]
>						[system.ApplicationSupportDirectory][api.library.system.ApplicationSupportDirectory]
>						[system.CachesDirectory][api.library.system.CachesDirectory]
>						[system.DocumentsDirectory][api.library.system.DocumentsDirectory]
>						[system.TemporaryDirectory][api.library.system.TemporaryDirectory]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Used with [system.pathForFile()][api.library.system.pathForFile] to create a path for retrieving files where all the application assets exist, for example image and sound files. This is often called the "app&nbsp;bundle."

This property can also be used with other APIs requesting `baseDir` as a parameter, for example [display.newImageRect()][api.library.display.newImageRect]. The resource directory is generally the default directory if no other directory is specified.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

You should __not__ create, modify, or add files to this directory. Doing so will prevent the device from verifying the integrity of your application; in some cases the device will treat your application as malware and refuse to launch it.

</div>

<div class="guide-notebox">
<div class="notebox-title">Note</div>

In the Corona Simulator, this will be in a sandboxed folder on a <nobr>per-application</nobr> basis, but unlike the `/Documents` and `/tmp` directories, the resource directory is not viewable via <nobr>__File__ &rarr; __Show&nbsp;Project&nbsp;Sandbox__</nobr>.

</div>


## Gotchas

To restate what was mentioned above: `system.ResourceDirectory` is where your `main.lua` file and generally all of your asset (resource) files are stored. For security reasons, this directory is <nobr>read-only</nobr> and enforced by the operating system, not by Corona.

### Android

File access in Corona is based on the underlining operating system which varies by platform. On iOS devices, you can access files in all of the directories described above. On Android, however, there is no literal `system.ResourceDirectory` because all resource files reside inside a compressed `.apk` file.

Corona allows direct loading of images and audio files using the appropriate APIs, but it has limited access to resource files on Android using the file I/O APIs. Specifically, the following types can not be read from the resources directory: `.html`, `.htm`., `.3gp`, `.m4v`, `.mp4`, `.png`, `.jpg`, and `.ttf`.
 
Because of this limitation, if you have files of these types bundled in the core directory that you need to copy to another directory, you must change the file name so it can be accessed by the file I/O APIs. For example, if you want to move `cat.png` from the resource directory to the documents directory, it must be renamed `cat.png.txt` to be copied. See [here][guide.data.readWriteFiles#working-with-subfolders] for details.


## Syntax

	system.ResourceDirectory

## Example

``````lua
-- Get path for file "data.txt" in the resource directory
local path = system.pathForFile( "data.txt", system.ResourceDirectory )

-- Open the file from the path
local fh = io.open( path, "r" )

if fh then
	-- File exists; read its contents into a string
	local contents = fh:read( "*a" )
	print( "Contents of " .. path .. "\n" .. contents )
end

io.close( fh )
``````
