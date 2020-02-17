
# audio.resume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, resume, pause
> __See also__          [audio.pause()][api.library.audio.pause]
>						[audio.play()][api.library.audio.play]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Resumes playback on a channel that is paused (or all channels if no channel is specified). Should have no effect on channels that aren't paused.

This function returns the number of channels actually resumed or `-1` on error.

## Syntax

	audio.resume( [channel] )

##### channel ~^(optional)^~
_[Number][api.type.Number]._ The channel to resume. Specifying `0` (or nothing) resumes all channels.


## Example

`````lua
local backgroundMusicChannel = audio.play( backgroundMusic, { loops=-1 }  ) 
local audio.pause( backgroundMusicChannel )

-- resume after 3 seconds
timer.performWithDelay( 3000, function()

	audio.resume( backgroundMusicChannel )

end, 1 )
`````
