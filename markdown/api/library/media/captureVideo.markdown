
# media.captureVideo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, camera, video
> __See also__          [media.hasSource()][api.library.media.hasSource]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Opens a platform-specific interface to the device's camera. This function is asynchronous, meaning that it returns immediately so the calling code will continue to execute until the end of its scope; after that, the application will be suspended until the session is complete. A listener is required to handle the captured object (URL) which can be used in [native.newVideo()][api.library.native.newVideo] and [media.playVideo()][api.library.media.playVideo].

## Gotchas

### General

This API is not supported on Windows, macOS, or tvOS.

### Android

* In order to use the camera, you must set the following permissions in your `build.settings` file. The external storage permission is required even if your app is not writing the camera shot to file, because Android's camera app needs permission to save its camera shot to public storage to make it available to your app.

<div class="code-indent">

``````lua
settings =
{
	android =
	{
		usesPermissions =
		{
			"android.permission.CAMERA",
			"android.permission.WRITE_EXTERNAL_STORAGE",
		},
	},
}
``````

</div>

* The `preferredMaxDuration` setting might not work on all devices. In that case, the user can take a video for as long as they want. You can check the value of the video length to get the actual length and size of the recorded video.

* This function does not work on the internal Corona camera activty and will have to launch an external camera activity instead.

### iOS

On iOS, in order to use the camera, you must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSCameraUsageDescription = "This app would like to access the camera.",
			NSPhotoLibraryUsageDescription = "This app would like to access the photo library.",
			NSPhotoLibraryAddUsageDescription = "This app would like to add the photo library.",
		},
	},
}
``````

## Syntax

	media.captureVideo ( { listener [, preferredQuality] [, preferredMaxDuration] } )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Can be either a function listener or a table listener. If a table, it must have a completion method. The event dispatched to the listener will be a completion event with the following additional properties:

* `event.url` is a [String][api.type.String] which is the URL of the video. If the operation was cancelled, this value will be `nil`.
* `event.completed` will be `true` if the user captured a video; `false` if the user cancelled the video capture.
* `event.duration` will be the number of seconds of the video if the user captured a video; `nil` if the user cancelled the video capture or the value could not be obtained.
* `event.fileSize` will be the number of bytes of the user captured a video; `nil` if the user cancelled the video capture or the value could not be obtained.

##### preferredQuality ~^(optional)^~
_[String][api.type.String]._ A string indicating the quality of the video you want to take. The acceptable values are `"high"`, `"medium"`, or `"low"`. Default value is `"low"`. On Android, there is no `"medium"` quality level and if that value is passed, `"low"` will be used instead.

##### preferredMaxDuration ~^(optional)^~
_[Number][api.type.Number]._ The maximum duration of the taken video in seconds. This setting may not work on all devices and it is advised to check against the event to verify.


## Example

`````lua
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
`````
