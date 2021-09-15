
# media.capturePhoto()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, camera, photo
> __See also__          [media.hasSource()][api.library.media.hasSource]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Opens a platform-specific interface to the device's camera. This function is asynchronous, meaning that it returns immediately so the calling code will continue to execute until the end of its scope; after that, the application will be suspended until the session is complete. By default, the image object is added to the top of the current stage, although there is an option to save the image to a directory instead.

## Gotchas

### General

This API is not supported on Windows&nbsp;Desktop or tvOS.

### Android

On Android, in order to use the camera, you must set the following permissions in your `build.settings` file. The external storage permission is required even if your app is not writing the camera shot to file, because Android's camera app needs permission to save its camera shot to public storage to make it available to your app.

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
		},
	},
}
``````


## Syntax

	media.capturePhoto( { listener [, destination] } )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Can be either a function listener or a table listener. If a table, it must have a completion method. The event dispatched to the listener will be a completion event with the following additional properties:

* `event.target` is a [DisplayObject][api.type.DisplayObject] based on the `mediaSource` parameter. If the chosen image is saved to a file, there is no display object added to the stage and this value will be `nil`.
* `event.completed` will be `true` if the user selected a photo; `false` if the user cancelled the camera or photo selection.

##### destination ~^(optional)^~
_[Table][api.type.Table]._ If provided, the chosen image is saved to a file. In this case, there is no [DisplayObject][api.type.DisplayObject] added to the stage and to event sent to listener. This table should be in the form <nobr>`{ [baseDir= ,] filename= }`</nobr>. If `baseDir` is specified, this is the directory [constant][api.type.Constant] to which to save the file.


## Example

`````lua
local function onComplete( event )
   local photo = event.target
   print( "photo w,h = " .. photo.width .. "," .. photo.height )
end

if media.hasSource( media.Camera ) then
	media.capturePhoto( { listener=onComplete } )
else
	native.showAlert( "Corona", "This device does not have a camera.", { "OK" } )
end
`````
