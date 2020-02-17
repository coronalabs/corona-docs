
# media.playSound()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, play, sound, audio
> __See also__          [media.getSoundVolume()][api.library.media.getSoundVolume]
>						[media.setsoundVolume()][api.library.media.setSoundVolume]
>						[media.pauseSound()][api.library.media.pauseSound]
>						[media.stopSound()][api.library.media.stopSound]
> --------------------- ------------------------------------------------------------------------------------------

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Because of various limitations outlined below, it is recommended that the [audio][api.library.audio] library be used for playing back audio.

</div>
</div>

## Overview

Plays an extended sound <nobr>(as opposed to an [event sound][api.library.media.playEventSound])</nobr> or resumes play of a paused extended sound. You can only have one such sound file open at a time.

You can optionally specify a callback function to be called whenever playback has finished.


## Gotchas

* Only one sound can be playing using this sound API. Calling this API with a different sound file will stop the existing sound and play the new sound.

* Supported audio formats vary <nobr>per-platform</nobr>. See the [Audio Usage/Functions][guide.media.audioSystem#audio-formats] guide for details.

* The volume can be controlled by [media.getSoundVolume()][api.library.media.getSoundVolume] and [media.setSoundVolume()][api.library.media.setSoundVolume].

* The playing can be controlled by [media.pauseSound()][api.library.media.pauseSound] and [media.stopSound()][api.library.media.stopSound].


## Syntax

	media.playSound( soundfile [, baseDir] [, onComplete] )

	media.playSound( soundfile [, baseDir] [, loop] )

##### soundfile ~^(required)^~
_[String][api.type.String]._ Name of the sound file. The file must be in a format that is supported by the platform.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ If specified, this argument is the directory where the sound file is located (if you specified a filename for `sound`). The default is `system.ResourceDirectory`. Other options include:

* `system.DocumentsDirectory`
* `system.ApplicationSupportDirectory`
* `system.TemporaryDirectory`
* `system.CachesDirectory`

##### onComplete ~^(optional)^~
_[Function][api.type.Function]._ If specified, this argument is a completion listener (callback&nbsp;function) that will be called each time the sound finishes playing.

##### loop ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the sound will be played repeatedly. The default is `false`.


## Example

`````lua
media.playSound( "song.mp3" )

local function stopAfter10Seconds()
	media.stopSound()
end

timer.performWithDelay( 10000, stopAfter10Seconds )
`````
