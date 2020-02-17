
# native.newVideo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Video][api.type.Video]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          video, video view, video overlay
> __See also__          [media.playVideo()][api.library.media.playVideo]
>						[video][api.event.video]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a video object that can be moved and rotated. This API supports local videos (in&nbsp;one of the system directories) or from a remote location (streaming).

## Gotchas

* This API is not available on Windows.

* Native video objects are not part of the OpenGL canvas and do not obey the display object hierarchy, so they will always appear in front of normal display objects including images, text, and vector objects.

* On Android, video objects do not rotate.


## Syntax

	native.newVideo( x, y, width, height )

##### x ~^(required)^~
_[Number][api.type.Number]._ The __x__ coordinate that corresponds to the center of the video object.

##### y ~^(required)^~
_[Number][api.type.Number]._ The __y__ coordinate that corresponds to the center of the video object.

##### width ~^(required)^~
_[Number][api.type.Number]._ Width of the video object.

##### height ~^(required)^~
_[Number][api.type.Number]._ Height of the video object.


## Properties / Methods

See the [Video][api.type.Video] documentation for a list of methods and properties.


## Events

See the [video][api.event.video] event documentation for properties related to various [Video][api.type.Video] object events.


## Examples

##### Local Video

`````lua
local video = native.newVideo( display.contentCenterX, display.contentCenterY, 320, 480 )
 
local function videoListener( event )
    print( "Event phase: " .. event.phase )
 
    if event.errorCode then
        native.showAlert( "Error!", event.errorMessage, { "OK" } )
    end
end
 
-- Load a video and jump to 0:30
video:load( "myVideo.m4v", system.DocumentsDirectory )
video:seek( 30 )

-- Add video event listener 
video:addEventListener( "video", videoListener )

-- Play video
video:play()

-- Stop the video and remove
video:pause()
video:removeSelf()
video = nil
`````

##### Remote Video

`````lua
local video = native.newVideo( display.contentCenterX, display.contentCenterY, 640, 360 )
 
local function videoListener( event )
    print( "Event phase: " .. event.phase )
 
    if event.errorCode then
        native.showAlert( "Error!", event.errorMessage, { "OK" } )
    end
end
 
-- Load a remote video
video:load( "http://www.coronalabs.com/video/bbb/BigBuckBunny_640x360.m4v", media.RemoteSource )

-- Add video event listener 
video:addEventListener( "video", videoListener )

-- Play video
video:play()
`````
