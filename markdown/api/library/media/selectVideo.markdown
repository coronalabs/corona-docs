
# media.selectVideo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, camera, video
> __See also__          [media.hasSource()][api.library.media.hasSource]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Opens a platform-specific interface to the device's photo library. This function is asynchronous, meaning that it returns immediately so the calling code will continue to execute until the end of its scope; after that, the application will be suspended until the session is complete.

## Gotchas

### General

This API is not supported on Windows, macOS, or tvOS.

### iOS

* On iOS, in order to use the camera, you must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

<div class="code-indent">

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSPhotoLibraryUsageDescription = "This app would like to access the photo library.",
		},
	},
}
``````

</div>

* The iPad requires the additional parameters of `origin` and `permittedArrowDirections` to specify the location and direction of the popup used to select the video.


## Syntax

	media.selectVideo ( { listener [, mediaSource] [, origin] [, permittedArrowDirections] } )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Can be either a function listener or a table listener. If a table, it must have a completion method. The event dispatched to the listener will be a completion event with the following additional properties:

* `event.url` is a [string][api.type.String] which is the URL of the video. If the operation was cancelled, this value will be `nil`.
* `event.completed` will be `true` if the user captured a video; `false` if the user cancelled the video selection.
* `event.duration` will be the number of seconds of the video if the user selected a video; `nil` if the user cancelled the video selection or the value could not be obtained. On some Android app/device combinations, this can occur if the `android.permission.READ_EXTERNAL_STORAGE` permission is missing.
* `event.fileSize` will be the number of bytes of the user selected a video; `nil` if the user cancelled the video selection or the value could not be obtained. On some Android app/device combinations, this can occur if the `android.permission.READ_EXTERNAL_STORAGE` permission is missing.

##### mediaSource ~^(optional)^~
_[Constant][api.type.Constant]._ Can be one of the following:

* `media.PhotoLibrary`
* `media.SavedPhotosAlbum`

##### origin ~^(optional)^~
_[Table][api.type.Table]._ Only applicable on iPad. Defines the bounds of the object (typically&nbsp;a&nbsp;button) from which the iPad's popup emerges from. A convenience pattern is to pass the `contentBounds` property of the object.

##### permittedArrowDirections ~^(optional)^~
_[Table][api.type.Table]._ Only applicable on iPad. An array of values which defines the directions in which the iPad's popup arrow may point. Valid values are `"up"`, `"down"`, `"left"`, `"right"`, or `"any"`. The default is `"any"`.

## Examples

##### Standard

`````lua
local function onComplete( event )
	if event.completed then
		media.playVideo( event.url )
	end
end

if media.hasSource( media.PhotoLibrary ) then
   media.selectVideo( { listener=onComplete } )
else
   native.showAlert( "Corona", "This device does not have a photo library.", { "OK" } )
end
`````

##### iPad

`````lua
-- Video completion listener
local function onVideoComplete( event )
    print( "video session ended" )
end

-- Selection completion listener
local function onComplete( event )
	if event.completed then
		media.playVideo( event.url, media.RemoteSource, true, onVideoComplete )
		print( event.duration )
		print( event.fileSize )
	end
end

local button = display.newRect( 120, 240, 80, 70 )

local function pickVideo( event )
    
	media.selectVideo(
	{
		mediaSource = media.SavedPhotosAlbum,
		listener = onComplete, 
		origin = button.contentBounds, 
		permittedArrowDirections = { "right" } 
	})
end

button:addEventListener( "tap", pickVideo )
`````
