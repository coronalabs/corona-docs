
# audio.getDuration()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, duration
> __See also__          [audio.loadSound()][api.library.audio.loadSound]
>								[audio.loadStream()][api.library.audio.loadStream]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function returns the total time in milliseconds of the audio resource. If the total length cannot be determined, `-1` will be returned.

## Gotchas

Assuming a duration can actually be determined, the number returned may not be completely accurate. Particularly for sounds loaded with [audio.loadStream()][api.library.audio.loadStream], the information may be a estimate or may just be slightly off due to inaccurate metadata. The type of file and encoding you use may have an impact on the accuracy of this value.

## Syntax

	audio.getDuration( audioHandle )

##### audioHandle ~^(required)^~
_[Table][api.type.Table]._ The audio object returned by [audio.loadSound()][api.library.audio.loadSound] or [audio.loadStream()][api.library.audio.loadStream].


## Example

`````lua
local backgroundMusic = audio.loadStream( "backgroundMusic.m4a" )
local totalTime = audio.getDuration( backgroundMusic )

print( totalTime )
`````
