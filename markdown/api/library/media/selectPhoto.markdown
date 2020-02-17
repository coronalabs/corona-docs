
# media.selectPhoto()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          media, camera, photo
> __See also__          [media.hasSource()][api.library.media.hasSource]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Opens a platform-specific interface to the device's photo library. This function is asynchronous, meaning that it returns immediately so the calling code will continue to execute until the end of its scope; after that, the application will be suspended until the session is complete. By default, the image object is added to the top of the current stage, although there is an option to save the image to a directory instead.

## Gotchas

### General

This API is not supported on Windows&nbsp;Desktop.

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

* The iPad requires the additional parameters of `origin` and `permittedArrowDirections` to specify the location and direction of the popup used to select the photo.


## Syntax

	media.selectPhoto ( { listener [, mediaSource] [, destination] [, origin] [, permittedArrowDirections] } )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Can be either a function listener or a table listener. If a table, it must have a completion method. The event dispatched to the listener will be a completion event with the following additional properties:

* `event.target` is a [DisplayObject][api.type.DisplayObject] based on the `mediaSource` parameter. If the chosen image is saved to a file, there is no display object added to the stage and this value will be `nil`.
* `event.completed` will be `true` if the user selected a photo; `false` if the user cancelled the camera or photo selection.

	media.selectPhoto( { listener=sessionComplete } )

##### mediaSource ~^(optional)^~
_[Constant][api.type.Constant]._ Can be one of the following:

* `media.PhotoLibrary`
* `media.SavedPhotosAlbum`

##### destination ~^(optional)^~
_[Table][api.type.Table]._ If provided, the chosen image is saved to a file. In this case, there is no [DisplayObject][api.type.DisplayObject] added to the stage. This table should be in the form <nobr>`{ [baseDir= ,] filename= }`</nobr>. If `baseDir` is specified, this is the directory [constant][api.type.Constant] to which to save the file.

##### origin ~^(optional)^~
_[Table][api.type.Table]._ Only applicable on iPad. Defines the bounds of the object (typically&nbsp;a&nbsp;button) from which the iPad's popup emerges from. A convenience pattern is to pass the `contentBounds` property of the object.

##### permittedArrowDirections ~^(optional)^~
_[Table][api.type.Table]._ Only applicable on iPad. An array of values which defines the directions in which the iPad's popup arrow may point. Valid values are `"up"`, `"down"`, `"left"`, `"right"`, or `"any"`. The default is `"any"`.

## Examples

##### Standard

`````lua
local function onComplete( event )
   local photo = event.target
   print( "photo w,h = " .. photo.width .. "," .. photo.height )
end

if media.hasSource( media.PhotoLibrary ) then
   media.selectPhoto( { mediaSource=media.PhotoLibrary, listener=onComplete } )
else
   native.showAlert( "Corona", "This device does not have a photo library.", { "OK" } )
end
`````

##### iPad

`````lua
-- Selection completion listener
local function onComplete( event )
	local photo = event.target
   
	if photo then
		print( "photo w,h = " .. photo.width .. "," .. photo.height )
	end
end

local button = display.newRect( 120, 240, 80, 70 )

local function pickPhoto( event )

    media.selectPhoto(
	{
		mediaSource = media.SavedPhotosAlbum,
		listener = onComplete, 
		origin = button.contentBounds, 
		permittedArrowDirections = { "right" },
		destination = { baseDir=system.TemporaryDirectory, filename="image.jpg" } 
	})
end

button:addEventListener( "tap", pickPhoto )
`````
