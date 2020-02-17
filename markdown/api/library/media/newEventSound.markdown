
# media.newEventSound()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      [Userdata][api.type.Userdata]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, event sound, sound, audio
> __See also__          [media.playEventSound()][api.library.media.playEventSound]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads the event sound <nobr>(1-3 seconds)</nobr> from a sound file and returns an event sound ID that can be passed to [media.playEventSound()][api.library.media.playEventSound].


## Syntax

	media.newEventSound( audioFileName [, baseDir] )

##### audioFileName ~^(required)^~
_[String][api.type.String]._ The name of the audio file you want to load.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ If specified, this argument is the directory where the sound file is located. If missing, the default is `system.ResourceDirectory`. Other options include:

* `system.DocumentsDirectory`
* `system.ApplicationSupportDirectory`
* `system.TemporaryDirectory`
* `system.CachesDirectory`


## Gotchas

* Supported audio formats vary <nobr>per-platform</nobr>. See the [Audio Usage/Functions][guide.media.audioSystem#audio-formats] guide for details.

* There is no volume control API for event sounds. It is intended for alert sounds and the volume is controlled by the device's hardware controls.


## Example

`````lua
local soundID = media.newEventSound( "beep.mp3" )

local playBeep = function()
	media.playEventSound( soundID )
end

timer.performWithDelay( 1000, playBeep, 0 )
`````
