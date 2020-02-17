
# event.url

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [completion][api.event.completion]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          completion, url
> --------------------- ------------------------------------------------------------------------------------------

## Overview

When the completion event is dispatched after a user has selected or captured a video with [media.captureVideo()][api.library.media.captureVideo] or [media.selectVideo()][api.library.media.selectVideo], this property indicates the URL to the video file. You can use this URL in [native.newVideo()][api.library.native.newVideo] or [media.playVideo()][api.library.media.playVideo].

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
