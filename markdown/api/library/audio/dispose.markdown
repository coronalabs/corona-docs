
# audio.dispose()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, dispose
> __See also__          [audio.loadSound()][api.library.audio.loadSound]
>								[audio.loadStream()][api.library.audio.loadStream]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Releases audio memory associated with a handle.


## Gotchas

You must not use the handle once the memory is freed. The audio should not be active <nobr>(playing or paused)</nobr> on any channel when you try to free it.


## Syntax

	audio.dispose( audioHandle )

##### audioHandle ~^(required)^~
The handle returned by [audio.loadSound()][api.library.audio.loadSound] and [audio.loadStream()][api.library.audio.loadStream] that you want to release.


## Example

`````lua
-- Load a laser sound and a background music stream into memory
local laserSound = audio.loadSound( "laserSound.wav" )
local backgroundMusic = audio.loadStream( "backgroundMusic.m4a" )

-- Play both the sound and the stream
local playLaserSound = audio.play( laserSound )
local playBackgroundMusic = audio.play( backgroundMusic )

-- Stop both the sound and the stream and 'nil' out each reference
audio.stop( playLaserSound )
playLaserSound = nil
audio.stop( playBackgroundMusic )
playBackgroundMusic = nil

-- Dispose the handles from memory and 'nil' out each reference
audio.dispose( laserSound )
audio.dispose( backgroundMusic )
laserSound = nil  --prevents the handle from being used again
backgroundMusic = nil  --prevents the handle from being used again
`````
