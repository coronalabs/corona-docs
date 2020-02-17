
# audio.play()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, play, sound, music
> __See also__          [audio.pause()][api.library.audio.pause]
>						[audio.loadSound()][api.library.audio.loadSound]
>						[audio.loadStream()][api.library.audio.loadStream]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Plays the audio specified by the audio handle on a channel. If a channel is not explicitly specified, an available channel will be automatically chosen for you.

This function returns the channel number which the audio plays on, or `0` if the audio could not be played.

## Gotchas

Currently we support 32 channels. You may not play new audio on a channel that is currently active (paused or playing).

## Syntax

	audio.play( audioHandle [, options ] )


##### audioHandle ~^(required)^~
_[Object][api.type.Object]._ This is the audio data you want to play (as returned from [audio.loadSound()][api.library.audio.loadSound] and [audio.loadStream()][api.library.audio.loadStream]).

##### options ~^(optional)^~
_[Table][api.type.Table]._ Additional options for playback — see the next section for details.


## Parameter Reference

The `options` table allows you to specify additional options for playback.

`````lua
local options =
{
    channel = 1,
    loops = -1,
    duration = 30000,
    fadein = 5000,
    onComplete = callbackListener
}
`````

##### channel ~^(optional)^~
_[Number][api.type.Number]._ The channel number you want to play on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specify `0` or omit this parameter to have a channel automatically picked for you.

##### loops ~^(optional)^~
_[Number][api.type.Number]._ The number of times you want the audio to loop. `0` means that the audio will loop 0 times (the sound will play once and not loop). `1` means that the audio will play once and loop once which means you will hear the sound a total of 2 times. Passing `-1` will tell the system to infinitely loop the sample.

##### duration ~^(optional)^~
_[Number][api.type.Number]._ In milliseconds, this will cause the system to play the audio for the specified amount of time and then auto-stop the playback regardless of whether the audio has finished or not.

##### fadein ~^(optional)^~
_[Number][api.type.Number]._ In milliseconds, this will cause the system to start playing a sound at the minimum channel volume and linearly ramp up to the normal channel volume over the specified number of milliseconds.

##### onComplete ~^(optional)^~
_[Listener][api.type.Listener]._ A callback function you want to be called when playback ends. The `onComplete` callback function passes back an event table with the following properties:

* `event.name` ([string][api.type.String]) &mdash; Value of `"audio"`.
* `event.channel` ([number][api.type.Number]) &mdash; The channel number which just finished playing.
* `event.handle` ([object][api.type.Object]) &mdash; This is the audio handle you passed into `audio.play()`.
* `event.completed` ([boolean][api.type.Boolean]) &mdash; This value will be `true` if the audio stopped because it finished playing normally (played to the end of the sound). It will be `false` if the audio was stopped because of other reasons.


## Example

`````lua
-- Completion listener function
local function narrationFinished( event )
    print( "Narration Finished on channel", event.channel )
    if ( event.completed ) then
        print( "Narration completed playback naturally" )
    else
        print( "Narration was stopped before completion" )
    end
end

-- Load two audio streams and one sound
local backgroundMusic = audio.loadStream( "backgroundMusic.m4a" )
local narrationSpeech = audio.loadStream( "narrationSpeech.wav" )
local laserSound = audio.loadSound( "laserBlast.wav" )

-- Play the background music on channel 1, loop infinitely, and fade in over 5 seconds 
local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=5000 } )

-- Play the speech on any available channel, for 30 seconds at most, and invoke listener function when audio finishes
local narrationChannel = audio.play( narrationSpeech, { duration=30000, onComplete=narrationFinished } )

-- Play the laser on any available channel
local laserChannel = audio.play( laserSound )
`````
