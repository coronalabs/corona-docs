
# audio.pause()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, pause, sound
> __See also__          [audio.play()][api.library.audio.play]
>						[audio.resume()][api.library.audio.resume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Pauses playback on a channel (or all channels if no channels are specified). Has no effect on channels that aren't playing.

This function returns the number of channels actually paused or `-1` on error.


## Syntax

	audio.pause( [channel] )

##### channel ~^(required)^~
_[Number][api.type.Number]._ The channel to pause. Specifying `0` pauses all channels. If `channel` is omitted, `audio.pause()` will pause all active channels.


## Example

`````lua
local backgroundMusicChannel = audio.play( backgroundMusic, { loops=-1 }  ) 
audio.pause( backgroundMusicChannel )
`````
