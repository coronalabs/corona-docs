# object:stopRecording()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Recording][api.type.Recording]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          stopRecording
> __See also__          [object:startRecording()][api.type.Recording.startRecording]
>						[media.playSound()][api.library.media.playSound]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Stops recording audio.


## Syntax

	object:stopRecording()

## Example

``````lua
local filePath = system.pathForFile( "newRecording.aif", system.DocumentsDirectory )
local r = media.newRecording( filePath )
r:startRecording()

-- Sometime later
r:stopRecording()
``````