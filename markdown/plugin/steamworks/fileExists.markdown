# steamworks.fileExists

> --------------------- ------------------------------------------------------------------------------------------
> **Type** [Function][api.type.Function]
> **Return value** [Boolean][api.type.Boolean]
> **Revision** [REVISION_LABEL](REVISION_URL)
> **Keywords** steam, steamworks, fileExists, cloud storage
> **See also** [steamworks.*][plugin.steamworks], [steamworks.writeFile][plugin.steamworks.writeFile], [steamworks.deleteFile][plugin.steamworks.deleteFile]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function checks if a file exists in Steam Cloud storage. It returns `true` if the file exists, `false` otherwise.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>
This API is only available on 2025.3722+
</div>

This function is commonly used to verify the presence of save files before attempting to load, delete, or overwrite them. It provides a safe way to check for file existence without attempting to read the file contents.

The function queries Steam's Remote Storage API to determine if the specified file is present in the user's cloud storage.

## Syntax

```lua
steamworks.fileExists( filename )
```

### Parameters

- **filename** (required): [String][api.type.String]. The name of the file to check for in Steam Cloud storage.

### Return Value

[Boolean][api.type.Boolean]. Returns `true` if the file exists in Steam Cloud storage, `false` if the file doesn't exist or if the operation failed.

## Example

```lua
local steamworks = require( "plugin.steamworks" )

-- Load player data
local function loadPlayerData()
    if not steamworks.fileExists("playerData.json") then
        print("No saved data found.")
        return
    end
    
    -- File exists, proceed with loading
    local fileData = steamworks.readFile("playerData.json")
    if fileData then
        local saveData = json.decode(fileData)
        print("Player data loaded: Level " .. saveData.level)
    else
        print("Failed to read player data.")
    end
end

-- Check for save file before showing load option
if steamworks.fileExists("playerData.json") then
    print("Save file found - Load Game option available")
else
    print("No save file - Starting new game")
end
```
