
# media.setSoundVolume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, sound, volume, audio
> __See also__          [media.playSound()][api.library.media.playSound]
>						[media.getSoundVolume()][api.library.media.getSoundVolume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Adjusts the playback volume of an extended sound ([media.playSound()][api.library.media.playSound]). This setting can be adjusted at any time before or during the extended sound playback.


## Gotchas

Setting the global volume is a different feature and is not currently supported. Also note that event sounds ([media.playEventSound()][api.library.media.playEventSound]) do not have volume control. This is a limitation of the event sound API.

## Syntax

	media.setSoundVolume( volume )

##### volume ~^(required)^~
_[Number][api.type.Number]._ This parameter controls the volume. Values must be in the range from `0.0` (muted) to `1.0` (loudest).


## Example

`````lua
media.setSoundVolume( 0.5 )
print( "volume = " .. media.getSoundVolume() )
`````
