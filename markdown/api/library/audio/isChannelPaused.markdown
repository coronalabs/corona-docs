
# audio.isChannelPaused()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, channel, paused
> __See also__          [audio.pause()][api.library.audio.pause]
>								[audio.play()][api.library.audio.play]
>								[audio.isChannelActive()][api.library.audio.isChannelActive]
>								[audio.isChannelPlaying()][api.library.audio.isChannelPlaying]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns `true` if the specified channel is currently paused; `false` if not.


## Syntax

	audio.isChannelPaused( channel )

##### channel ~^(required)^~
_[Number][api.type.Number]._ The channel you want to know is paused or not.


## Example

`````lua
local isChannel1Paused = audio.isChannelPaused( 1 )
if isChannel1Paused then
    audio.resume( 1 )
end
`````
