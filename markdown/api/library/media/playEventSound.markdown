
# media.playEventSound()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, sound, event sound, audio
> __See also__          [media.newEventSound()][api.library.media.newEventSound]
>						[media.playSound()][api.library.media.playSound]
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

Plays an event sound <nobr>(1-3 seconds)</nobr>. The first argument may be either an event sound ID or a filename for the event sound. This function is recommended for short sounds, especially to avoid performance hiccups.


## Gotchas

* There is no volume control API for event sounds. It is intended for alert sounds and the volume is controlled by the device's hardware controls.

* Supported audio formats vary <nobr>per-platform</nobr>. See the [Audio Usage/Functions][guide.media.audioSystem#audio-formats] guide for details.

* For Android devices, the sound should be preloaded with the [media.newEventSound()][api.library.media.newEventSound] API.


## Syntax

	media.playEventSound( sound [, baseDir] [, completionListener] )

##### sound ~^(required)^~
_[Userdata][api.type.Userdata] or [String][api.type.String]._ The first argument is either an event sound ID <nobr>(from [media.newEventSound()][api.library.media.newEventSound])</nobr> or a filename for the event sound.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ If specified, this argument is the directory where the sound file is located, if you specified a filename for `sound`. The default is `system.ResourceDirectory`. Other options include:

* `system.DocumentsDirectory`
* `system.ApplicationSupportDirectory`
* `system.TemporaryDirectory`
* `system.CachesDirectory`

##### completionListener ~^(optional)^~
_[Function][api.type.Function]._ If specified, a listener function that will be called each time the event sound is played. Note, however, that Android does not support this functionality.


## Example

`````lua
local soundID = media.newEventSound( "beep.caf" )

local playBeep = function()
	media.playEventSound( soundID )
end

timer.performWithDelay( 7500, playBeep, 0 )
`````
