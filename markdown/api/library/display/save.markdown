# display.save()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          screenshot, capture screen, save screen
> __See also__          [display.capture()][api.library.display.capture]
>								[display.captureBounds()][api.library.display.captureBounds]
>								[display.captureScreen()][api.library.display.captureScreen]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Renders the [display object][api.type.DisplayObject] referenced by first argument into a JPEG or PNG image and saves it as a new file. The display object must currently be in the display hierarchy or no image will be saved. If the object is a display group, all children are also rendered.

When content scaling is enabled, `display.save()` saves the image in the device's native resolution. For instance, if this method is used to save a 100&times;200 pixel display object, it may have more actual pixels when saved on a device with higher resolution.


## Gotchas

### Android

When an app is suspended, the Android OS removes all OpenGL textures from memory. When the app is resumed, Corona must reload all images, but the capture image no longer exists in memory. You can't use the [display.save()][api.library.display.save] function in Android `"applicationSuspend"` and `"applicationExit"` [events][api.event.system.type] because there are no OpenGL textures in memory to save.

### Save on Launch

If you need to save a display object on application launch, for example when `main.lua` is executed to initialize the app, you must call `display.save()` within a [timer.performWithDelay()][api.library.timer.performWithDelay] call. A delay of at least 100 milliseconds is recommended.

`````lua
local function saveWithDelay()
	display.save( group, "group.jpg" )
end

timer.performWithDelay( 100, saveWithDelay )
`````


## Syntax

	display.save( displayObject, options )

##### displayObject ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ The variable that references the display object/group to save.

##### options ~^(optional)^~
_[Table][api.type.Table]._ A table of options for the save — see the next section for details.


## Options Reference

##### filename ~^(required)^~
_[String][api.type.String]._ Name of the file to save as a JPEG or PNG.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ One of the following values (`system.DocumentsDirectory` is the default):

* `system.DocumentsDirectory`
* `system.ApplicationSupportDirectory`
* `system.TemporaryDirectory`
* `system.CachesDirectory`

##### backgroundColor ~^(optional)^~
_[Table][api.type.Table]._ Table array with the background clear color to use. The table format can be one of the following, where each value ranges between `0` and `1`:

* `{ gray }`
* `{ gray, alpha }`
* `{ red, green, blue }`
* `{ red, green, blue, alpha }`

##### captureOffscreenArea ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the entire object/group is saved, even parts which are not visible on screen. If omitted, the save will be constrained to the screen bounds. For legacy compatibility purposes, the deprecated `isFullResolution` option name can be used with the same effect.

##### jpegQuality ~^(optional)^~
_[Number][api.type.Number]._ A value between `0` and `1` indicating the quality of the JPEG image that is saved.  Has no affect on PNG. This only works on devices, not in the Corona Simulator.


## Syntax (Legacy)

    display.save( displayObject, filename [, baseDir] )

##### displayObject ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ The variable that references the display object/group to save.

##### filename ~^(required)^~
_[String][api.type.String]._ Name of the file to save as a JPEG or PNG.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ One of the following values (`system.DocumentsDirectory` is the default):

* `system.DocumentsDirectory`
* `system.ApplicationSupportDirectory`
* `system.TemporaryDirectory`
* `system.CachesDirectory`


## Example

`````lua
local myObject1 = display.newRect( 50, 50, 100, 150 )  -- Create a rectangle object
local myObject2 = display.newCircle( 100, 300, 50 )    -- Create a circle object

local group = display.newGroup()
 
group:insert( myObject1 )
group:insert( myObject2 )

display.save( group, { filename="entireGroup.png", baseDir=system.DocumentsDirectory, captureOffscreenArea=true, backgroundColor={0,0,0,0} } )
`````

<!---

##### Legacy Syntax

`````lua
local myObject1 = display.newRect( 50, 50, 100, 150 )  -- Create a rectangle object
local myObject2 = display.newCircle( 100, 300, 50 )    -- Create a circle object

local group = display.newGroup()
 
group:insert( myObject1 )
group:insert( myObject2 )

display.save( group, "entireGroup.png", system.DocumentsDirectory )
`````

-->
