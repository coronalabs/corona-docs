
# audio.stopWithDelay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, stop, delayed stop, stop with delay
> __See also__          [audio.play()][api.library.audio.play]
>								[audio.stop()][api.library.audio.stop]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Stops a currently playing sound after the specified time delay.

This function returns the number of channels actually applied to or `-1` on error.


## Gotchas

Note that `audio.stopWithDelay()` does not take any handles from [audio.loadSound()][api.library.audio.loadSound] or [audio.loadStream()][api.library.audio.loadStream]. This is by design, since you are intended to stop specific channels, not sound handles.

For audio loaded with [audio.loadStream()][api.library.audio.loadStream], the position of the audio will not be reset when stop is called. So when if you call [audio.play()][api.library.audio.play] again on the same handle, it will continue approximately where it left off (it might be a little further down because all of the pre-filled buffers were discarded on the [audio.stop()][api.library.audio.stop]). This contrasts with audio loaded with [audio.loadSound()][api.library.audio.loadSound] which will start playing at the beginning of the starting position of the buffer (beginning of the sound unless you modified it with [audio.seek()][api.library.audio.seek]). So for [audio.loadStream()][api.library.audio.loadStream], you may want to call [audio.rewind()][api.library.audio.rewind] on the handle if you reuse the audio handle.


## Syntax
	
	audio.stopWithDelay( duration [, options ] )

##### duration ~^(required)^~
_[Number][api.type.Number]._ Time in milliseconds after which to stop playing.

##### options ~^(optional)^~
_[Table][api.type.Table]._ Table that supports a single key, `channel`, which is the channel to stop. If no parameter is passed, all channels are stopped.


## Example

`````lua
local backgroundMusicChannel = audio.play( backgroundMusic, { loops=-1 }  ) 
audio.stopWithDelay( 30000, { channel=backgroundMusicChannel }  )
`````
