
# media.playVideo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, video, playback, remote video
> __See also__          [native.newVideo()][api.library.native.newVideo]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Plays the video at the specified path (both local and remote) in a device-specific popup media player.

During video playback, the media player interface takes over. If the `showControls` function argument is `true`, the user can adjust playback (start, stop, seek, etc.). Additionally, you may specify a listener to get notified when the video has ended. Note that this function is asynchronous, so any code that follows will be executed. After that, the application code will continue to run on iOS devices, but on Android devices, the application will be suspended until the video playback is complete.

Supported video formats are platform- and version-dependent. The iOS video player supports playback of movie files with the `.mov`, `.mp4`, `.m4v`, and `.3gp` filename extensions and using the following compression standards:

* H.264 Baseline Profile Level 3.0 video, up to 640&times;480 at 30 frames per second. Note that B frames are not supported in the Baseline profile.
* MPEG-4 Part 2 video (Simple Profile).

## Gotchas

### General

This API is not supported on Windows.

### Android

If the path to the video is a URL, you must add the `INTERNET` permission to the `build.settings` file in order to play the video.

``````lua
settings =
{
   android =
   {
      usesPermissions =
      {
         "android.permission.INTERNET",
      },
   },
}
``````

## Syntax

	media.playVideo( path [, baseSource ], showControls, listener )


##### path ~^(required)^~
_[String][api.type.String]._ The local filename or a remote URL for the video.

##### baseSource ~^(optional)^~
_[Constant][api.type.Constant]._ Optional parameter that controls how the local filename path is interpreted. It can either be one of the system-defined directory constants, or `media.RemoteSource` (use this to access video on a remote server).

##### showControls ~^(required)^~
_[Boolean][api.type.Boolean]._ If `true`, then the user can adjust playback (start, stop, seek, etc.).

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener to notify when the video has ended. The listener can be either a function listener or a table listener. If it's a table, it must have a completion method. The event dispatched to the listener will be a completion event.


## Example

`````lua
local onComplete = function( event )
   print( "video session ended" )
end
media.playVideo( "movie.m4v", true, onComplete )
`````
