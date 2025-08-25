# steamworks.deleteFile

> --------------------- ------------------------------------------------------------------------------------------
> **Type** [Function][api.type.Function]
> **Return value** [Boolean][api.type.Boolean]
> **Revision** [REVISION_LABEL](REVISION_URL)
> **Keywords** steam, steamworks, deleteFile, cloud storage
> **See also** [steamworks.*][plugin.steamworks], [steamworks.writeFile][plugin.steamworks.writeFile], [steamworks.fileExists][plugin.steamworks.fileExists]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function deletes a file from Steam Cloud storage. It returns `true` if the file was successfully deleted, `false` otherwise.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>
This API is only available on 2025.3722+
</div>

When a file is deleted from Steam Cloud, the deletion is synchronized across all devices where the user has the game installed. The file will be permanently removed from cloud storage.

It's recommended to check if a file exists using `steamworks.fileExists()` before attempting to delete it to avoid unnecessary operations.

## Syntax

```lua
steamworks.deleteFile( filename )
```

### Parameters

- **filename** (required): [String][api.type.String]. The name of the file to delete from Steam Cloud storage.

### Return Value

[Boolean][api.type.Boolean]. Returns `true` if the file was successfully deleted from Steam Cloud, `false` if the operation failed or the file doesn't exist.

## Example

```lua
local steamworks = require( "plugin.steamworks" )

local function deletePlayerData()
    if steamworks.fileExists("playerData.json") then
        if steamworks.deleteFile("playerData.json") then
            print("Player data deleted from Steam Cloud.")
        else
            print("Failed to delete player data.")
        end
    else
        print("No file to delete.")
    end
end

-- Call the delete function
deletePlayerData()
```

