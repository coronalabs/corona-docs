
# event.completed

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [completion][api.event.completion]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          completion, completed
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Boolean property of `true` if the user has successfully completed a modal interaction such as using the camera.

## Example

``````lua
-- Video completion listener
local onVideoComplete = function( event )
	print( "video session ended" )
end

-- Capture completion listener
local function onComplete( event )
	if event.completed then
		media.playVideo( event.url, media.RemoteSource, true, onVideoComplete )
		print( event.duration )
		print( event.fileSize )
	end
end

if media.hasSource( media.Camera ) then
	media.captureVideo( { listener=onComplete } )
else
	native.showAlert( "Corona", "This device does not have a camera.", { "OK" } )
end
``````