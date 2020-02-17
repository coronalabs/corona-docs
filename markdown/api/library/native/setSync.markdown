
# native.setSync()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Boolean][api.type.Boolean] and [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sync, iCloud, backup, documents
> __See also__          [native.getSync()][api.library.native.getSync]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the iCloud automatic backup flag for files in the `system.DocumentsDirectory` and `system.ApplicationSupportDirectory` on macOS and iOS systems.

The iCloud backup is `true` by default and must be set `false` with this API to disable automatic backup of files to iCloud.

This function returns up to two values:

* `value` ([Boolean][api.type.Boolean]) &mdash; `true` if synchronization was successful, `false` if it failed. Returns `nil` on Android and Windows systems since they don't support this API.
* `errStr` ([String][api.type.String]) &mdash; Error message if `value` returned `false`.

## Gotchas

This function is for macOS and iOS platforms only.

## Syntax

	native.setSync( filename, params )

##### filename ~^(required)^~
_[String][api.type.String]._ Name of file (including path).

##### params ~^(required)^~
_[Table][api.type.Table]._ Set to `{ iCloudBackup = flag }` where `flag` is `true` to enable iCloud backup (default) or `false` to disable it.

## Examples

`````lua
-- Disable file backup
-- Assumes that a file named 'SavedData.txt' is in 'system.DocumentsDirectory'

local results, errStr = native.setSync( "SavedData.txt", { iCloudBackup = false } ) 
``````

``````lua
-- Disable file backup in a subdirectory within the Documents directory
-- Assumes that a file named 'SavedData.txt' is in a 'data' subdirectory of 'system.DocumentsDirectory'

local results, errStr = native.setSync( "data/SavedData.txt", { iCloudBackup = false } )
``````
