
# audio.isChannelPlaying()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, play
> __See also__          [audio.isChannelActive()][api.library.audio.isChannelActive]
>								[audio.pause()][api.library.audio.pause]
>								[audio.play()][api.library.audio.play]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns `true` if the specified channel is currently playing; `false` if otherwise.


## Syntax

	audio.isChannelPlaying( channel )


##### channel ~^(required)^~
_[Number][api.type.Number]._ The channel you want to know is playing or not.


## Example

`````lua
local isChannel1Playing = audio.isChannelPlaying( 1 )
if isChannel1Playing then
    audio.pause( 1 )
end
`````
