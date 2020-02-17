
# media.hasSource()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, camera, photo library
> __See also__          [media.selectPhoto()][api.library.media.selectPhoto]
>						[media.capturePhoto()][api.library.media.capturePhoto]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Determines if the given media source, such as a camera or photo library, is available on the platform. This function should be called before calling [media.selectPhoto()][api.library.media.selectPhoto] or [media.capturePhoto()][api.library.media.capturePhoto] to determine if that media service is available. Returns `true` if the media source is available on the platform/device. Returns `false` if not.

## Gotchas

`media.hasSource( media.Camera )` returns two [booleans][api.type.Boolean]. If the first boolean is `true`, this means that the device has a camera __and__ the app has permission to access it. If the second boolean is `true`, this means that the device has a camera. With these two booleans, the following logic applies:

* The first being `true` implies the second is `true`.
* The first being `true` and the second being `false` should not happen.
* The first being `false` and the second being `true` means that the device has a camera, but the app does __not__ have permission to access it.
* Both being `false` means the device does __not__ have a camera.

### iOS

* For `media.hasSource( media.Camera )`, the first boolean will only be `false` if the device does __not__ have a camera, __or__ the user has explicitly denied camera access to the app. 

* iOS will handle requesting permission to access the Camera or Photos the first time the user attempts this through the app.

## Syntax

	media.hasSource( mediaSource )

##### mediaSource ~^(required)^~
_[Constant][api.type.Constant]._ Can be one of the following:

* `media.PhotoLibrary`
* `media.Camera`
* `media.SavedPhotosAlbum`

## Examples

##### Checking for Photo Library

``````lua
local onComplete = function( event )
	print( "Returned from camera view." )
end

if ( media.hasSource( media.PhotoLibrary ) ) then
	media.selectPhoto( { mediaSource=media.PhotoLibrary, listener=onComplete } )
else
	native.showAlert( "Corona", "This device does not have a camera.", { "OK" } )
end
``````

##### Checking/Requesting Camera Access

``````lua
local onComplete = function( event )
	print( "Returned from camera view." )
end

local hasAccessToCamera, hasCamera = media.hasSource( media.Camera )

if ( hasAccessToCamera == true ) then
	-- There is access to the camera
	media.capturePhoto( { listener = onComplete } )
elseif ( hasCamera == true and native.canShowPopup( "requestAppPermission" ) ) then
	-- A camera exists, but there is no access to it!
	native.showPopup( "requestAppPermission", { appPermission="Camera" } )
else
	native.showAlert( "Corona", "This device does not have a camera.", { "OK" } )
end
``````
