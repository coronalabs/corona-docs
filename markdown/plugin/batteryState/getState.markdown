# batteryState.getState()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          battery, batteryState, getState
> __See also__          [batteryState.init()][plugin.batteryState.init]
>						[batteryState.*][plugin.batteryState]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Reads the current battery state. This method returns a table of results immediately, with the following properties:

* `level` &mdash; A [number][api.type.Number] value indicating the battery level, in the range of `0` to `1`, or `-1` if no battery.

* `state` &mdash; A [string][api.type.String] representing the state of the battery. Possible values include `"unplugged"`, `"charging"`, `"full"`, or `"unknown"`.

* `isError` &mdash; [Boolean][api.type.Boolean] value indicating whether an error occurred.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

If you want a persistent method of checking the battery state, you should follow the <nobr>listener-based</nobr> example illustrated in [batteryState.init()][plugin.batteryState.init].

</div>


## Syntax

	batteryState.getState()


## Example

``````lua
local batteryState = require( "plugin.batteryState" )

-- Initialize plugin without state listener
batteryState.init()

-- Get current battery state
local batt = batteryState.getState()

print( "Level: " .. tostring(batt.level) )
print( "State: " .. tostring(batt.state) )
print( "isError: " .. tostring(batt.isError) )
``````
