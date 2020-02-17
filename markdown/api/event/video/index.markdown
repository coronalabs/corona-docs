
# video

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          video
> __See also__          [native.newVideo()][api.library.native.newVideo]
>						[Video][api.type.Video]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Used in conjunction with [native.newVideo()][api.library.native.newVideo] and [Video][api.type.Video] objects.


## Properties

#### [event.name][api.event.video.name]

#### [event.phase][api.event.video.phase]


## Example

``````lua
local video = native.newVideo( display.contentCenterX, display.contentCenterY, 320, 480 )

local function videoListener( event )
	print( "Event phase: " .. event.phase )
end

-- Load a video
video:load( "myVideo.m4v", system.DocumentsDirectory )

-- Add video event listener
video:addEventListener( "video", videoListener )

-- Play video
video:play()
``````
