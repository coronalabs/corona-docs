# steamworks.readFile

> --------------------- ------------------------------------------------------------------------------------------
> **Type** [Function][api.type.Function]
> **Return value** [String][api.type.String] or [nil][api.type.nil]
> **Revision** [REVISION_LABEL](REVISION_URL)
> **Keywords** steam, steamworks, readFile, cloud storage
> **See also** [steamworks.*][plugin.steamworks], [steamworks.writeFile][plugin.steamworks.writeFile], [steamworks.fileExists][plugin.steamworks.fileExists]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function reads the contents of a file from Steam Cloud storage. It returns the file contents as a string if successful, or `nil` if the operation failed.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>
This API is only available on 2025.3722+
</div>

Steam Cloud automatically synchronizes files across all devices where the user has the game installed. This function retrieves the most current version of the file from cloud storage.

It's recommended to check if a file exists using `steamworks.fileExists()` before attempting to read it, though this function will return `nil` for non-existent files.

## Syntax

```lua
steamworks.readFile( filename )
```

### Parameters

- **filename** (required): [String][api.type.String]. The name of the file to read from Steam Cloud storage.

### Return Value

[String][api.type.String] or [nil][api.type.nil]. Returns the file contents as a string if successful, or `nil` if the file doesn't exist or the operation failed.

## Example

```lua
local steamworks = require( "plugin.steamworks" )
local json = require( "json" )

local function loadPlayerData()
    local contents = steamworks.readFile("playerData.json")
    if contents then
        local saveData = json.decode(contents)
        print("Loaded player data:")
        print("Level:", saveData.level)
        print("Score:", saveData.score)
        print("Items:", table.concat(saveData.items, ", "))
    else
        print("Failed to read player data.")
    end
end

-- Complete load example with existence check
local function safeLoadPlayerData()
    if steamworks.fileExists("playerData.json") then
        local contents = steamworks.readFile("playerData.json")
        if contents then
            local saveData = json.decode(contents)
            return saveData
        end
    end
    return nil -- No data or failed to load
end
```
