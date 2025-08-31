# steamworks.isSteamDeck()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, isSteamDeck
> __See also__          [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property will be `true` if the current system is running Steam Deck hardware.

<div class="guide-notebox-imp"> <div class="notebox-title-imp">Important</div>
This api is only available on 2025.3722+
</div>

If this function returns `false`, you should assume the user is not on a Steam Deck. You can still run Steam-specific APIs, but any Steam Deck-specific optimizations or input handling should be skipped.
This property is read-only and determined at application startup; it cannot change during the application's lifetime.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

if steamworks.isSteamDeck() then
    print("Running on Steam Deck! Adjusting UI and input settings for deck...")
    -- Example: Enable on-screen keyboard or adjust layout
else
    print("Not a Steam Deck. Running normal desktop mode.")
end
``````
