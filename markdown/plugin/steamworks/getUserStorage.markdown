# steamworks.getUserStorage

> --------------------- ------------------------------------------------------------------------------------------
> **Type** [Function][api.type.Function]
> **Return value** [Table][api.type.Table] or [nil][api.type.nil]
> **Revision** [REVISION_LABEL](REVISION_URL)
> **Keywords** steam, steamworks, getUserStorage, cloud storage, quota
> **See also** [steamworks.*][plugin.steamworks], [steamworks.writeFile][plugin.steamworks.writeFile]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function retrieves information about the user's Steam Cloud storage quota. It returns a table containing total and available storage bytes, or `nil` if the operation failed.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>
This API is only available on 2025.3722+
</div>

Steam Cloud storage has limits per application, and this function allows you to check how much storage space is available before writing large files. This is useful for managing save data and preventing storage-related errors.

The function queries Steam's Remote Storage API to get the current quota information for the user's cloud storage.

## Syntax

```lua
steamworks.getUserStorage()
```

### Parameters

None.

### Return Value

[Table][api.type.Table] or [nil][api.type.nil]. Returns a table with storage information if successful, or `nil` if the operation failed.

The returned table contains the following fields:
- **totalBytes** ([Number][api.type.Number]): Total cloud storage space allocated to the application in bytes
- **availableBytes** ([Number][api.type.Number]): Remaining available storage space in bytes

## Example

```lua
local steamworks = require( "plugin.steamworks" )

local function checkStorageSpace()
    local storageInfo = steamworks.getUserStorage()
    if storageInfo then
        local totalMB = storageInfo.totalBytes / (1024 * 1024)
        local availableMB = storageInfo.availableBytes / (1024 * 1024)
        local usedMB = totalMB - availableMB
        
        print("Steam Cloud Storage:")
        print("Total: " .. string.format("%.2f MB", totalMB))
        print("Used: " .. string.format("%.2f MB", usedMB))
        print("Available: " .. string.format("%.2f MB", availableMB))
        
        -- Check if we have enough space for a save file
        local saveDataSize = 1024 -- Estimated save file size in bytes
        if storageInfo.availableBytes >= saveDataSize then
            print("Sufficient storage space available")
            return true
        else
            print("Warning: Low storage space!")
            return false
        end
    else
        print("Failed to retrieve storage information.")
        return false
    end
end

-- Before saving large data, check available space
local function safeSavePlayerData(saveData)
    local storageInfo = steamworks.getUserStorage()
    if not storageInfo then
        print("Cannot check storage - proceeding anyway")
    else
        local jsonData = json.encode(saveData)
        local dataSize = string.len(jsonData)
        
        if storageInfo.availableBytes < dataSize then
            print("Error: Not enough cloud storage space!")
            print("Need: " .. dataSize .. " bytes")
            print("Available: " .. storageInfo.availableBytes .. " bytes")
            return false
        end
    end
    
    -- Proceed with save
    return steamworks.writeFile("playerData.json", json.encode(saveData))
end
```
