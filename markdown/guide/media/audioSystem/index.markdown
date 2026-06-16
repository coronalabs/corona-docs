#  Audio Usage/Functions

This guide discusses how to use the [audio][api.library.audio] library to play sound effects and streaming audio.

<div class="guides-toc">

* [Overview](#overview)
* [Sound vs. Stream](#soundstream)
* [Audio Formats](#formats)
* [Channels and Volume](#channelvolume)
* [Audio Handles](#handles)
* [Playing Audio](#playing)
* [Audio Events](#events)
* [Controlling Audio](#controlling)
* [Disposing Audio](#disposing)
* [Performance Tips](#performance)

</div>


<a id="overview"></a>

## Overview

[Audio][api.library.audio] system gives you access to advanced __OpenAL__ features. It features 32 distinct channels on which you can play sound effects or streaming audio files. The system offers a unique volume setting for each channel plus a master volume level for all channels.

The audio system is a "best&nbsp;effort" system. Requested sounds will play as quickly as possible, but there is no guarantee that they'll start or end at exact times. If you are streaming a song and there's a buffer underrun due to CPU stress, the audio system will continue playing as soon as it can, but the song may finish playing later than anticipated.

Please read further to learn about audio API functions and methods, acceptable file formats, and performance tips.




<a id="soundstream"></a>

## Sound vs. Stream

The audio system offers two functions for loading: [audio.loadSound()][api.library.audio.loadSound] and [audio.loadStream()][api.library.audio.loadStream]. There is no mandated distinction between the file you provide to either function, but the proper method should be used according to these general guidelines:

* `audio.loadSound()` — loads an entire sound into memory. It should be used for shorter audio files that may be used repeatedly throughout the app.

* `audio.loadStream()` — reads in small chunks of an audio file over the course of its duration. It should be used for longer audio tracks like background music. Note that streamed files may have a slightly higher latency cost and CPU cost than files loaded with `audio.loadSound()`.

All of the [audio][api.library.audio] APIs can be applied to files loaded via either method. However, in some cases, the differences are not entirely transparent.




<a id="formats"></a>

## Audio Formats

Audio system supports different formats depending on the environment/platform:

<div class="inner-table">

Platform			  .wav		  .mp3		  .ogg		  .aac		  .caf		  .aif
-------------------	-----------	-----------	-----------	-----------	-----------	-----------
iOS					  &#x2713;	  &#x2713;				  &#x2713;	  &#x2713;	  &#x2713;
Android				  &#x2713;	  &#x2713;	  &#x2713;
macOS				  &#x2713;	  &#x2713;	  &#x2713;	  &#x2713;	  &#x2713;	  &#x2713;
Windows Desktop		  &#x2713;	  &#x2713;	  &#x2713;    &#x2713;
-------------------	-----------	-----------	-----------	-----------	-----------	-----------

<div class="tiny-copy">

Note that Windows Desktop only supports .aac if the system has the DirectX Media Foundation installed.

</div>

</div>

### Format Notes

* Cross-platform `.wav` files must be 16-bit uncompressed.

* For highly-compressed formats such as `.mp3` and `.aac` (`.mp4`), the latter is a better option. `.aac` is the official successor to `.mp3` by the MPEG&nbsp;Group. `.mp3` had various patent and royalty issues that expired in 2017, but when `.aac` was ratified, it was agreed that there would be no royalties required for distribution.

* Ogg Vorbis (`.ogg`) is royalty-free and <nobr>patent-free</nobr>, but it is not supported on iOS.

* Be aware that certain formats — particularly highly-compressed, lossy formats like `.mp3`, `.aac`, and `.ogg`&nbsp;— can pad/remove samples at the end of an audio sample and potentially break a <nobr>"perfect-looping"</nobr> music clip. If you are experiencing gaps in looping playback, try using `.wav` and make sure that your starting and ending points are clean.

* Depending on the format — `.mp3` in particular — the [audio.getDuration()][api.library.audio.getDuration] call may return inaccurate information, particularly for files loaded via `audio.loadStream()`.




<a id="channelvolume"></a>

## Channels and Volume

As stated in the overview, there are 32 audio channels available. Each sound effect or streaming audio track must play on a distinct channel. If you don't explicitly set the channel on which you want to play audio, CORONA_CORE_PRODUCT will attempt to locate a free channel on which to play the audio file.

In some cases, it's useful to __reserve__ certain channels for different purposes. For example, you may want to set different volume levels for music, speech, and sound effects. In this case, you can reserve a few channels toward the lower end of the range and effectively prevent <nobr>auto-assignment</nobr> on those channels. This is done via the [audio.reserveChannels()][api.library.audio.reserveChannels] API, wherein you block off channels 1 to `x` via <nobr>`audio.reserveChannels( x )`</nobr>. Then, assuming you reserve a few channels for music and speech, the remaining channels can be used for <nobr>auto-assigned</nobr> sound effects.

There are various functions to check the status of a channel. These include [audio.isChannelActive()][api.library.audio.isChannelActive], [audio.isChannelPlaying()][api.library.audio.isChannelPlaying], and [audio.isChannelPaused()][api.library.audio.isChannelPaused].

### Controlling Volume

Audio system has both a "master" volume level and a volume level for each channel. Both the master volume and individual channel volumes can be controlled by passing a decimal representation of 0%-100% to the [audio.setVolume()][api.library.audio.setVolume] API. Note that the master volume is not necessarily the same as the device's internal volume, but all volume levels are scaled proportionally to that internal volume.

If you wish to set the master volume for __all__ channels, simply pass a volume level without a channel specification as follows:

``````lua
audio.setVolume( 0.5 )  --set the master volume to 50%
``````

Or, to set the volume on a specific channel, pass an optional table with a `channel` key as follows:

``````lua
audio.setVolume( 0.5, { channel=1 } )  --set the volume level of channel 1 to 50%
``````

Finally, the following functions are provided to set the minimum and maximum volume:

* `audio.setMinVolume( volume )` — clamps the minimum volume to a value. Any volumes that fall below the value will be played at the minimum volume level.

* `audio.setMaxVolume( volume )` — clamps the maximum volume to a value. Any volumes that exceed the value will be played at the maximum volume level.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The master volume proportionally controls the volume of all other channels. If you set the master volume to 40% and later set the volume of channel&nbsp;2 to `1.0`, channel&nbsp;2 will play at 100% of the master volume (40%). Similarly, if you set the master volume to 50% and then set the volume of channel&nbsp;2 to `0.2`, channel&nbsp;2 will play at 20% of the master volume (50%) for an effective volume of 10%.

* When you set the volume, that level is persistent until you set it again. If you change the volume of channel&nbsp;4, that channel will remain at that volume level even after sound finishes playing on that channel.

* If you're playing audio on <nobr>auto-assigned</nobr> channels, remember that those channels will also retain the specific volume setting that you declared. Thus, you may consider manual channel assignment for audio that requires a specific volume level.

</div>




<a id="handles"></a>

## Audio Handles

When you load an audio file using either [audio.loadSound()][api.library.audio.loadSound] or [audio.loadStream()][api.library.audio.loadStream], CORONA_CORE_PRODUCT returns a __handle__ for that audio file. This handle can then be used to reference and play the audio file, assuming the handle remains in memory.

The following example shows how to load a basic sound file into a handle `soundEffect` and play it immediately.

``````lua
local soundEffect = audio.loadSound( "chime.wav" )
audio.play( soundEffect )
``````

Note that audio handles are only used when you need to play, dispose, seek/rewind, or check the duration of an audio file. Once an audio file is playing, you cannot pause, stop, or control the volume of it by referencing its handle. Instead, you must reference the __channel__ on which it's playing, since the same file (handle) may be playing on multiple channels.




<a id="playing"></a>

## Playing Audio

### Sound

As stated earlier, the `audio.loadSound()` function loads an entire sound into memory. It should be used for shorter audio files that may be used repeatedly throughout the app. While you can load each sound into a local handle, it's often better to organize your sounds inside a Lua table using named keys for the handles:

``````lua
local soundTable = {

	chimeSound = audio.loadSound( "chime.wav" ),
	bellSound = audio.loadSound( "bell.wav" ),
	buzzSound = audio.loadSound( "buzz.aac" ),
	clickSound = audio.loadSound( "click.aac" )
}
``````

Then, with this structure in place, playing a sound effect is simple:

``````lua
audio.play( soundTable["chimeSound"] )
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Audio files loaded via the `audio.loadSound()` function should almost always be __preloaded__ at the launch of your app or the start of a new level/scene. Loading sounds during a time-critical period may cause the app to skip while the system loads the audio file into memory.

</div>

### Stream

Since the `audio.loadStream()` function reads in small chunks of an audio file over the course of its duration, audio loaded with this method does not need to be loaded in advance. Simply load and play the file as follows:

``````lua
local backgroundMusic = audio.loadStream( "backgroundMusic.wav" )
audio.play( backgroundMusic )
``````




<a id="events"></a>

## Audio Events

The audio system offers a completion event for `audio.play()` which can be used to perform an action related to the sound. For example, if you have a ticking time bomb object, you may use the `onComplete` callback to trigger an animated bomb explosion and a separate explosion sound.

To listen for the completion event of a sound, just specify the listener function in the `onComplete` value of the options table:

``````lua
local function bombExplode( event )
	--bomb has exploded!
end

local tickSound = audio.loadSound( "tick.wav" )
audio.play( tickSound, { onComplete=bombExplode } )
``````

In turn, when the listener function is called, the following `event` parameters are available:

* `event.name` — string with the value `"soundCompletion"`.
* `event.channel` — the channel number associated with the completed sound.
* `event.handle` — the audio handle associated with the completed sound.
* `event.completed` — boolean value which will be `true` if the audio file completed by itself or `false` if it was prematurely stopped.




<a id="controlling"></a>

## Controlling Audio

In addition to the [volume](#channelvolume) control methods described above, following audio control functions are provided:

<div class="inner-table">

Function													Description
-----------------------------------------------------------	--------------------------------------------------------------------------------------------------------
[audio.pause()][api.library.audio.pause]					Pauses playback on one playing channel or all playing channels.
[audio.resume()][api.library.audio.resume]					Resumes playback on one paused channel or all paused channels.
[audio.rewind()][api.library.audio.rewind]					Rewinds audio to the beginning position on one active channel/handle or all active channels.
[audio.seek()][api.library.audio.seek]						Seeks to a time position on an active channel or specific audio handle.
[audio.stop()][api.library.audio.stop]						Stops playback on one channel or all channels and clears the channel(s) so they can be played on again.
[audio.stopWithDelay()][api.library.audio.stopWithDelay]	Stops playback on one channel or all channels after a specified amount of time.
[audio.fade()][api.library.audio.fade]						Fades one channel or all channels to a specified volume over the specified amount of time.
[audio.fadeOut()][api.library.audio.fadeOut]				Fades one channel or all channels to the minimum volume over the specified amount of time.
-----------------------------------------------------------	--------------------------------------------------------------------------------------------------------
</div>




<a id="disposing"></a>

## Disposing Audio

Disposing audio files is essential if you're finished using them. This frees the memory allocated to the audio file. To dispose of an audio file, call the [audio.dispose()][api.library.audio.dispose] function and pass the __handle__ of the audio file as its sole parameter.

``````lua
audio.dispose( audioHandle )
``````

If you've organized your audio handles into a table as illustrated in [Playing Audio](#playing), a simple `pairs` loop can be used to dispose of each audio file:

``````lua
audio.stop()

for s,v in pairs( soundTable ) do
	audio.dispose( soundTable[s] )
	soundTable[s] = nil
end
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

The audio should __not__ be active (playing/paused) on any channel when you try to dispose it. Consider calling `audio.stop()` before `audio.dispose()` to ensure that the channel is freed. Also, do not attempt to use the handle after the audio file has been disposed and the memory freed.

</div>




<a id="performance"></a>

## Performance Tips

### Play Frequency

In the project `config.lua` file, you may specify the `audioPlayFrequency` parameter. This optimization hint prompts OpenAL to mix/play at a specific frequency.

``````lua
application =
{
	content =
	{
		width = 320,
		height = 480,
		scale = "letterbox",
		audioPlayFrequency = 22050
	},
}
``````

For best results, set this value no higher than you actually need. If you require high quality, set the value to `44100`. Otherwise, `22050` should suffice. Note that this value is only a "hint" and the underlying audio system is free to ignore it, although iOS seems to consistently respect it. In addition, for best performance, encode all audio files at the same frequency as this setting. For example, if you set this to `22050`, your audio files should be encoded at 22050&nbsp;Hz.

Supported values are `11025`, `22050`, and `44100`. Other values are not tested.

### Mono vs. Stereo

Mono sounds take half the amount of memory as stereo sounds and, on mobile devices, the difference is often negligible unless the user is listening through headphones.

### Linear PCM

For fastest loading/decoding time, use linear <nobr>16-bit</nobr> signed integer <nobr>little-endian</nobr> raw PCM samples. Commonly, `.wav` files use this format but you may need to confirm this depending on the source of the audio files.
