# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.string]
> __Event__             [adsRequest][plugin.admob.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, adsRequest, data
> __See also__            [adsRequest][plugin.admob.event.adsRequest]
>                        [admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A <nobr>JSON-formatted</nobr> string which contains the following fields:

* `adUnitId` &mdash; The AdMob ad unit ID that generated the event.
* `rewardItem` &mdash; The reward item name as defined in the AdMob dashboard. This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"reward"`.
* `rewardAmount` &mdash; The reward item amount as defined in the AdMob dashboard. This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"reward"`.
* `adValue` &mdash; The estimated revenue value for the ad impression in standard currency units <nobr>(e.g. `"0.005"` means $0.005)</nobr>. This is a string value, consistent across iOS and Android. This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"revenue"`.
* `currencyCode` &mdash; The ISO 4217 currency code for the revenue value <nobr>(e.g. `"USD"`)</nobr>. This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"revenue"`.
* `precision` &mdash; The precision type of the reported revenue value. Possible values are `0` (unknown), `1` (estimated), `2` (publisher&nbsp;provided), and `3` (precise). This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"revenue"`. See [Precision Types](#precision-types) below for details.
* `errorCode` &mdash; The error code for the event that failed. This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"failed"`.
* `errorMsg` &mdash; An error message with the reason for the failure. This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"failed"`.

## Precision Types

The `precision` field indicates the accuracy of the reported `adValue`:

| Value | Name | Description |
|---|---|---|
| `0` | Unknown | The value is not known. Returned for test ads. |
| `1` | Estimated | An estimate based on median eCPM from the ad network or mediation group. Most common in production. |
| `2` | Publisher Provided | A manually configured CPM value from mediation group settings. |
| `3` | Precise | Exact revenue reported by the ad network. Only some networks support this. |

## Example

``````lua
local json = require("json")

local function adListener( event )

    if ( event.phase == "revenue" ) then
        local data = json.decode( event.data )

        -- Revenue data
        print( data.adUnitId )       -- "ca-app-pub-XXXXXXXXXXXXXXXX/YYYYYYYYYY"
        print( data.adValue )        -- "0.005"
        print( data.currencyCode )   -- "USD"
        print( data.precision )      -- 1

    elseif ( event.phase == "reward" ) then
        local data = json.decode( event.data )

        -- Reward data
        print( data.rewardItem )     -- "coins"
        print( data.rewardAmount )   -- 100

    elseif ( event.phase == "failed" ) then
        local data = json.decode( event.data )

        -- Error data
        print( data.errorCode )      -- e.g. 3
        print( data.errorMsg )       -- e.g. "No fill"
    end
end
``````
