
# audio.seek()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, seek, position
> __See also__          [audio.rewind()][api.library.audio.rewind]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Seeks to a time position on either an active channel or directly on the audio handle.

This function returns `true` on success or `false` if otherwise.

## Gotchas

There are subtle behavior differences depending on whether you used [audio.loadSound()][api.library.audio.loadSound] or [audio.loadStream()][api.library.audio.loadStream] on what you are trying to seek:

* For audio preloaded with [audio.loadSound()][api.library.audio.loadSound], you may only seek using the `options` table parameter containing a `channel` parameter. You may __not__ seek using the `audioHandle` parameter. This is because [audio.loadSound()][api.library.audio.loadSound] is optimized to share the audio data so you can play back multiple instances of the sound simultaneously (at&nbsp;different positions). Seeking the underlying data complicates this optimization.

* In contrast, for streaming audio loaded with [audio.loadStream()][api.library.audio.loadStream], you are expected to seek using the `audioHandle` parameter, but if you seek streamed data using the `channel` parameter, it will automatically seek as if you used the `audioHandle` parameter (so,&nbsp;you are allowed to specify either parameter safely).

Also note that for files loaded with [audio.loadStream()][api.library.audio.loadStream] which are currently playing, you may not hear the audio update immediately until after the current buffer finishes playing. If you want seemingly "instantaneous" seeking, you should stop the playback first using [audio.stop()][api.library.audio.stop], seek, then start playing.


## Syntax
	
	audio.seek( time [, audioHandle ] [, options ] )

##### time ~^(required)^~
_[Number][api.type.Number]._ The time in milliseconds within the audio handle you want to seek to.

##### audioHandle ~^(optional)^~
_[Object][api.type.Object]._ The audio handle of the data you want to seek. This should only be used for audio loaded with [audio.loadStream()][api.library.audio.loadStream]. Do not use the `options.channel` parameter in the same call.

##### options ~^(optional)^~
_[Table][api.type.Table]._ Table that supports a single key, `channel`, which is the channel you want the seek operation to apply to. This is best for audio loaded with [audio.loadSound()][api.library.audio.loadSound]. Do not use the `audioHandle` parameter in the same call.


## Examples

##### Preloaded Audio

``````lua
audio.seek( 5000, { channel=1 } )  -- Seek channel 1 to 5 seconds
``````

##### Streaming Audio

``````lua
audio.seek( 4000, backgroundMusic )  -- Seek the audio handle to 4 seconds
``````
