
# audio.stop()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, stop, sounds, music
> __See also__          [audio.play()][api.library.audio.play]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Stops playback on a channel <nobr>(or all channels)</nobr> and clears the channel(s) so they can be played on again. Callbacks will still be invoked, but the completed flag will be set to `false`.

This function returns the number of channels actually stopped or `-1` on error.

## Gotchas

Note that `audio.stop()` does not take any handles from [audio.loadSound()][api.library.audio.loadSound] or [audio.loadStream()][api.library.audio.loadStream]. This is by design. You are intended to stop specific channels, not sound handles. Imagine multiple explosion effects all going off around the same time. In this case, it doesn't make sense to call `audio.stop()` on the explosion handle because each explosion may end at a slightly different time.

For audio loaded with [audio.loadStream()][api.library.audio.loadStream], the position of the audio will not be reset when stop is called. So when if you call [audio.play()][api.library.audio.play] again on the same handle, it will continue approximately where it left off (approximately meaning it might be a little further down because all the pre-filled buffers were discarded on the [audio.stop()][api.library.audio.stop]). This contrasts with audio loaded with [audio.loadSound()][api.library.audio.loadSound] which will start playing at the beginning of the starting position of the buffer (beginning of the sound unless you modified it with [audio.seek()][api.library.audio.seek]). So for `audio.loadStream`, you may want to call [audio.rewind()][api.library.audio.rewind] on the handle if you reuse the audio handle.

## Syntax

	audio.stop( [channel] )
	

##### channel ~^(optional)^~
_[Number][api.type.Number]._ The channel to stop. If no parameter is passed, all channels are stopped.


## Example

`````lua
local backgroundMusicChannel = audio.play( backgroundMusic, { loops=-1 }  ) 
audio.stop( backgroundMusicChannel )

-- NOTE: backgroundMusicChannel is not an audio handle. It is a number representing the channel that is playing.
`````
