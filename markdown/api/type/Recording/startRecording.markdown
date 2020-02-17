# object:startRecording()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Recording][api.type.Recording]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          startRecording, audio recording
> __See also__          [media.newRecording()][api.library.media.newRecording]
>						[object:stopRecording()][api.type.Recording.stopRecording]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Start recording audio.


## Gotchas

### General

Starting an audio recording will stop any audio playback. You cannot record and play audio at the same time.

### Android

To enable audio recording on Android devices, you must set the permission level in the `build.settings` file.

`````lua
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
`````

## Syntax

	object:startRecording()


## Example

``````lua
local filePath = system.pathForFile( "newRecording.aif", system.DocumentsDirectory )
local r = media.newRecording( filePath )
r:startRecording()
``````