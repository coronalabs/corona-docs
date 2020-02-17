# object:isRecording()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Recording][api.type.Recording]
> __Library__           [media.*][api.library.media]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          isRecording
> __See also__          [Recording:startRecording()][api.type.Recording.startRecording]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns `true` if audio recording is currently in progress; `false` if otherwise.

## Syntax

	Recording:isRecording()

## Example

``````lua
local function recButtonPress ( event )
	if r:isRecording () then
		r:stopRecording()
		media.playSound( dataFileName, system.DocumentsDirectory, onCompleteSound )
	else
		r:startRecording()
	end
end
``````
