
# audio.loadStream()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Object][api.type.Object] (audio handle)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, load, stream
> __See also__          [audio.loadSound()][api.library.audio.loadSound]
>						[audio.dispose()][api.library.audio.dispose]
>						[Audio Usage/Functions][guide.media.audioSystem] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads (opens) a file to be read as streaming audio. Streamed files are read in little chunks at a time to minimize memory use. These are intended for large/long files like background music and speech. Unlike files loaded with [audio.loadSound()][api.library.audio.loadSound], these cannot be shared simultaneously across multiple channels. If you need to play multiple simulataneous instances of the same file, you must load multiple instances of the file.

This function returns a handle to a sound file.

## Gotchas

Please note that you are responsible for unloading (cleaning up) any audio files you load with this API. Use the [audio.dispose()][api.library.audio.dispose] API to clean up audio handles you are completely done with them and want to unload from memory to get back more RAM.

In many usage cases, you may want to use the audio file for the entire program in which case you do not need to worry about disposing of the resource.

Also note that streamed files may have slightly higher latency costs than files loaded with [audio.loadSound()][api.library.audio.loadSound]. They also may have slightly higher runtime (CPU) cost to play than files loaded with [audio.loadSound()][api.library.audio.loadSound].

See the [Audio Usage/Functions][guide.media.audioSystem] guide for details on supported audio formats and notes.

## Syntax

	audio.loadStream( audioFileName [, baseDir ]  )

##### audioFileName ~^(required)^~
_[String][api.type.String]._ The name of the audio file you want to load. Supported file formats are determined by the platform you are running on.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ By default sound files are expected to be in the project folder (`system.ResourceDirectory`). If the sound file is in the application documents directory, use `system.DocumentsDirectory`.

## Example

`````lua
local backgroundMusic = audio.loadStream("backgroundMusic.m4a")
local narrationSpeech = audio.loadStream("narrationSpeech.wav")
`````
