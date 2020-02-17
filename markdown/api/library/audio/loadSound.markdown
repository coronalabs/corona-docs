
# audio.loadSound()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, load sound, loading
> __See also__          [audio.loadStream()][api.library.audio.loadStream]
>						[audio.play()][api.library.audio.play]
>						[Audio Usage/Functions][guide.media.audioSystem] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads an entire file completely into memory and returns a reference to the audio data. Files that are loaded completely into memory may be reused/played/shared simultaneously on multiple channels so you only need to load one instance of the file. You should use this to load all your short sounds, especially ones you may play frequently. For best results, load all the sounds at the launch of your app or the start of a new level/scene.

This function returns a handle to a sound file.

## Gotchas

Please note that you are responsible for unloading (cleaning up) any audio files you load with this API. Use the [audio.dispose()][api.library.audio.dispose] API to clean up audio handles you are completely done with them and want to unload from memory to get back more RAM.

In many usage cases, you may want to use the audio file for the entire program in which case you do not need to worry about disposing of the resource.

Audio formats supported are determined by the platform you are running on. But note that the same formats are supported between [audio.loadSound()][api.library.audio.loadSound] and [audio.loadStream()][api.library.audio.loadStream].

See the [Audio Usage/Functions][guide.media.audioSystem] guide for details on supported audio formats and notes.


## Syntax

	audio.loadSound( audiofileName [, baseDir ]  )

##### audiofileName ~^(required)^~
_[String][api.type.String]._ The name of the audio file you want to load. Supported file formats are determined by the platform you are running on.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ By default sound files are expected to be in the project folder (`system.ResourceDirectory`). If the sound file is in the application documents directory, use `system.DocumentsDirectory`.


## Example

`````lua
local laserSound = audio.loadSound( "laserBlast.wav" )
local explosionSound = audio.loadSound( "explosion.mp3" )
`````
