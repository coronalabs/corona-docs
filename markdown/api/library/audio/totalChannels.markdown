
# audio.totalChannels

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [audio.*][api.library.audio]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, channels, total channels
> __See also__          [audio.reservedChannels][api.library.audio.reservedChannels]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the total number of channels. This value is currently 32, but the limit may change in the future.

## Syntax

	audio.totalChannels


## Example

`````lua
local result = audio.totalChannels
print( result )
`````
