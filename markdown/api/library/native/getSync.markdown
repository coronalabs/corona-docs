
# native.getSync()


> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Boolean][api.type.Boolean] and [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sync, icloud, backup, documents
> __See also__          [native.setSync()][api.library.native.setSync]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets the iCloud automatic backup settings for files in the `system.DocumentsDirectory` and `system.ApplicationSupportDirectory` on macOS and iOS systems.

The iCloud backup is `true` by default and must be set `false` with the [native.setSync()][api.library.native.setSync] API to disable automatic backup of files to iCloud.

This function returns up to two values:

* `value` ([Boolean][api.type.Boolean]) &mdash; The `iCloudBackup` setting (`true` or `false`) for the specified file. You must check `errStr` to see if this API returned an error. Returns `nil` on Android and Windows systems since they do not support this API.
* `errStr` ([String][api.type.String]) &mdash; Error message if `value` returned `false`.

## Gotchas

This function is for macOS and iOS platforms only.

## Syntax

	native.getSync( filename, params )

##### filename ~^(required)^~
_[String][api.type.String]._ Name of file (including path).

##### params ~^(required)^~
_[Table][api.type.Table]._ Table with the structure `{ key = "iCloudBackup" }`.

## Examples

`````lua
-- Assumes that a file named 'SavedData.txt' is in 'system.DocumentsDirectory'

local results, errStr = native.getSync( "SavedData.dat", { key = "iCloudBackup" } ) 
`````

`````lua
-- Assumes that a file named 'SavedData.txt' is in a 'data' subdirectory of 'system.DocumentsDirectory'

local results, errStr = native.getSync( "data/SavedData.dat", { key = "iCloudBackup" } )
`````
