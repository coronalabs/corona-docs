
# audio.rewind()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, rewind
> __See also__          [audio.seek()][api.library.audio.seek]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Rewinds audio to the beginning position on either an active channel or directly on the audio handle (rewinds all channels if no arguments are specified).

This function returns `true` on success or `false` if otherwise.

## Gotchas

There are subtle behavior differences depending on whether you used audio.loadSound() or audio.loadStream() on what you are trying to rewind.

Audio loaded with [audio.loadSound()][api.library.audio.loadSound] may only rewind using the channel parameter. You may not rewind using the audio handle. This is because `audio.loadSound()` is optimized to share the audio data so you can play back multiple instances of the sound simultaneously (at different positions). Seeking (rewinding) the underlying data complicates this optimization.

In contrast, audio loaded with [audio.loadStream()][api.library.audio.loadStream] cannot be shared (you would load multiple instances of the same file if you needed multiple, simultaneous playback). So rewinding the data does not cause a conflict. So generally you are expected to rewind using the `audioHandle` parameter for audio loaded with `audio.loadStream()`. But if you rewind streamed data using the channel, it will automatically rewind as if you used the `audioHandle` parameter. So you are allowed to specify either parameter safely.

Also note that for files loaded with `audio.loadStream()` and are currently playing, you may not hear the audio immediate update until after the current buffer finishes playing. If you want seemingly instantaneous rewinding, you should pause the playback first using [audio.pause()][api.library.audio.pause], rewind, then resume playing.

## Syntax
	
	audio.rewind( [audioHandle | options] )

##### audioHandle ~^(optional)^~
_[Object][api.type.Object]._ The audio handle of the data you want to rewind. Should only be used for audio loaded with [audio.loadStream()][api.library.audio.loadStream]. Do not use the channel parameter in the same call.

##### options ~^(optional)^~
_[Table][api.type.Table]._ Table that supports a single key: `channel`, which is the channel you want the rewind operation to apply to. Best for audio loaded with [audio.loadSound()][api.library.audio.loadSound]. Do not use the `audioHandle` parameter in the same call.


## Example

`````lua
audio.rewind()  -- rewind all channels
audio.rewind( backgroundMusic ) -- rewind the audio handle
audio.rewind( { channel=1 } )  -- rewind channel 1
`````
