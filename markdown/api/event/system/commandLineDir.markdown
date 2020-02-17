
# event.commandLineDir

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [system][api.event.system]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          system, commandLineDir
> __See also__			[event.commandLineArgs][api.event.system.commandLineArgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Absolute path to the working directory that [event.commandLineArgs][api.event.system.commandLineArgs] were provided from. If relative paths to files or directories have been provided by the received command line arguments array, they are relative to this property's working directory. If desired, you can use the [Lua file system][api.library.lfs] library's <nobr>`lfs.chdir( path )`</nobr> function to change the app's current working directory to the working directory provided by this property.

## Gotchas

This property only exists for Win32 desktop apps when [event.type][api.event.system.type] is `"applicationOpen"` and the [event.commandLineArgs][api.event.system.commandLineArgs] property exists.
