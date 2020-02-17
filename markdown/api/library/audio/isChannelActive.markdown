
# audio.isChannelActive()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, channel, active
> __See also__          [audio.play()][api.library.audio.play]
>								[audio.pause()][api.library.audio.pause]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns `true` if the specified channel is currently playing or paused; `false` if otherwise.

## Syntax

	audio.isChannelActive( channel )

##### channel ~^(required)^~
_[Number][api.type.Number]._ The channel you want to know is active or not.


## Example

`````lua
local isChannel1Active = audio.isChannelActive( 1 )
if isChannel1Active then
    audio.stop( 1 )
end
`````
