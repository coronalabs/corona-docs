
# media.newRecording()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      [Recording][api.type.Recording]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, recording, audio
> __See also__          [object:startRecording][api.type.Recording.startRecording]
>						[object:stopRecording][api.type.Recording.stopRecording]
>						[media.playSound()][api.library.media.playSound]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Create an object for audio recording ([Recording][api.type.Recording]).

## Gotchas

### General

This API is not supported on tvOS.

### Android

* On Android, to enable audio recording on devices, you must set the permission level in the `build.settings` file:

<div class="code-indent">

``````lua
settings =
{
	android =
	{
		usesPermissions =
		{
			"android.permission.RECORD_AUDIO",
		},
	},
}
``````

</div>

* On Android, the default format for recorded files is `.wav`. To record to the `.3gp` format, simply append `.3gp` to the end of the path. Note that `.3gp` files can only be played by the [media.playSound()][api.library.media.playSound] function.

### iOS

On iOS, to enable audio recording on devices, you must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSMicrophoneUsageDescription = "This app would like to access the microphone.",
		},
	},
}
``````


## Syntax

	media.newRecording( [path] )

##### path ~^(optional)^~
_[String][api.type.String]._ The path of the file in which to record audio data. If no file is specified, the output goes nowhere.


## Supported Formats

The following platforms can only record to the following audio formats:

<div class="inner-table">

Platform		Supported Audio Formats
--------------	------------------------------
iOS				`.aif`
Android			`.wav` (default), `.3gp` (not supported by the "Nabi&nbsp;2" tablet)
macOS			`.aif`
Windows			`.wav`
--------------	------------------------------

</div>


## Example

`````lua
local filePath = system.pathForFile( "newRecording.aif", system.DocumentsDirectory )
r = media.newRecording( filePath )
r:startRecording()
`````
