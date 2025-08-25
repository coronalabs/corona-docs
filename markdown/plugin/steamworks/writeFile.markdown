# steamworks.writeFile

> --------------------- ------------------------------------------------------------------------------------------
> **Type** [Function][api.type.Function]
> **Return value** [Boolean][api.type.Boolean]
> **Revision** [REVISION_LABEL](REVISION_URL)
> **Keywords** steam, steamworks, writeFile, cloud storage
> **See also** [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function writes data to a file in Steam Cloud storage. It returns `true` if the file was successfully written, `false` otherwise.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>
This API is only available on 2025.3722+
</div>

Steam Cloud provides automatic synchronization of save files across different devices where the user has the game installed. Files written using this function will be automatically backed up and synchronized by Steam.

The function accepts a filename and data string, and uses Steam's Remote Storage API to write the data to the cloud.

## Syntax

```lua
steamworks.writeFile( filename, data )
```

### Parameters

- **filename** (required): [String][api.type.String]. The name of the file to write to Steam Cloud storage.
- **data** (required): [String][api.type.String]. The data to write to the file.

### Return Value

[Boolean][api.type.Boolean]. Returns `true` if the file was successfully written to Steam Cloud, `false` if the operation failed.

## Example

```lua
local steamworks = require( "plugin.steamworks" )
local json = require( "json" )

local function savePlayerData()
    local saveData = {
        level = 5,
        score = 12345,
        items = { "sword", "shield", "potion" }
    }
    
    local jsonData = json.encode(saveData)
    
    if steamworks.writeFile("playerData.json", jsonData) then
        print("Player data saved to Steam Cloud!")
    else
        print("Failed to save player data.")
    end
end

-- Call the save function
savePlayerData()
```