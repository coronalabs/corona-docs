# display.captureBounds()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          screenshot, capture bounds, save bounds
> __See also__          [display.save()][api.library.display.save]
>								[display.capture()][api.library.display.capture]
>								[display.captureScreen()][api.library.display.captureScreen]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Captures a portion of the screen and returns it as a new [DisplayObject][api.type.DisplayObject]. You can specify what portion of the screen to capture by passing in rectangular bounds. You can optionally save the capture image as a file to the device's photo library.

Calling this method places the captured image on the screen in front of other display objects. Use [object:removeSelf()][api.type.DisplayObject.removeSelf] to remove this object from the screen.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This capture function will only capture what is rendered in OpenGL. It will __not__ capture native display objects such as text input boxes/fields, web&nbsp;popups, ads, etc.

</div>


<a id="gotchas"></a>

## Gotchas

### Android

When an app is suspended, the Android OS removes all OpenGL textures from memory. When the app is resumed, Corona must reload all images, but the capture image no longer exists in memory. If you need to restore a captured image in Android, one solution is as follows:

* Save the returned capture image to file via the [display.save()][api.library.display.save] function. Note that you can't use the [display.save()][api.library.display.save] function in Android `"applicationSuspend"` and `"applicationExit"` [events][api.event.system.type] because there are no OpenGL textures in memory to save.
* Display the image saved to file via [display.newImageRect()][api.library.display.newImageRect], using the captured object's bounds.

In addition, if you include the `saveToPhotoLibrary` [option](#options-reference) as `true`, you must set the following permission in the `build.settings` file:

`````lua
settings =
{
    android =
    {
        usesPermissions =
        {
            "android.permission.WRITE_EXTERNAL_STORAGE",
        },
    },
}
`````

### iOS

On iOS, if you include the `saveToPhotoLibrary` [option](#options-reference) as `true`, you must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSPhotoLibraryUsageDescription = "This app would like to access the photo library.",
			NSPhotoLibraryAddUsageDescription = "This app would like to add the photo library.",
		},
	},
}
``````

### macOS

Saves screen capture images as JPEG files to the current user's `Pictures` folder.

Note that if you plan to submit your application to the Mac&nbsp;App&nbsp;Store, it will be __sandboxed__. This means that special entitlements for read/write files in the `Pictures` folder must be requested. To do this, simply add an `entitlements` entry within the <nobr>`settings` &rarr; `osx`</nobr> table of `build.settings` as indicated below. For further details, see Apple's [documentation](https://developer.apple.com/library/content/documentation/Miscellaneous/Reference/EntitlementKeyReference/Chapters/EnablingAppSandbox.html).

``````lua
settings = 
{
	osx = {
		entitlements = {
			["com.apple.security.assets.pictures.read-write"] = true,
		},
	},
}
``````

### Windows

Saves screen capture images as PNG files to the user's <nobr>`My Pictures`</nobr> directory under a subdirectory named after the Corona app. For the Corona&nbsp;Simulator, this directory will be <nobr>`My Pictures\Corona Simulator`</nobr>. For <nobr>Corona-built</nobr> desktop apps, this directory will be <nobr>`My Pictures\<AppName>`</nobr>.

### Capture on Launch

If you need to capture a display object on application launch, for example when `main.lua` is executed to initialize the app, you must call `display.captureBounds()` within a [timer.performWithDelay()][api.library.timer.performWithDelay] call. A delay of at least 100 milliseconds is recommended.

`````lua
local function captureWithDelay()
    local screenBounds =
    {
        xMin = 0,
        xMax = 100,
        yMin = 0,
        yMax = 100,
    }
    local capture = display.captureBounds( screenBounds )
end

timer.performWithDelay( 100, captureWithDelay )
`````



## Syntax

	display.captureBounds( screenBounds [, saveToPhotoLibrary] )


##### screenBounds ~^(required)^~
_[Table][api.type.Table]._ Specifies the portion of the screen to capture as a rectangle whose bounds are in content coordinates. This table must contain the following properties or else an error will occur.

`````lua
local screenBounds =
{
    xMin = 0,
    xMax = 100,
    yMin = 0,
    yMax = 100
}
`````

You can also pass in the bounds table returned by an [object.contentBounds][api.type.DisplayObject.contentBounds] property, which will capture that object and everything behind it.

Note that this capture function can only capture what is displayed on screen. If the coordinates in this bounds table exceed the bounds of the screen, then the resulting capture image will be trimmed to the bounds of the screen. If the bounds table is completely outside of the screen, then this function will do nothing and return `nil`.

<a id="options-reference"></a>

##### saveToPhotoLibrary ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, then it adds the image to your device's photo library. For Android and iOS devices, this also necessitates the requirements outlined in [Gotchas](#gotchas).


## Examples

##### Capture Bottom-Right Quadrant

`````lua
-- Set up a bounds table for capturing the bottom-right quadrant of the screen
local screenBounds =
{
	xMin = display.contentWidth / 2,
	xMax = display.contentWidth,
	yMin = display.contentHeight / 2,
	yMax = display.contentHeight
}

-- Capture the bounds of the screen
local myCaptureImage = display.captureBounds( screenBounds )
`````

##### Capture Display Object Bounds

`````lua
-- Display a circle at the center of the screen
local myCircle = display.newCircle( 0, 0, 50 )
myCircle.x = display.contentWidth / 2
myCircle.y = display.contentHeight / 2

-- Capture the above circle object
local myCaptureImage = display.captureBounds( myCircle.contentBounds )
`````

##### Write Capture to Photo Library

`````lua
-- Capture the entire stage, minus the letterbox area
-- To save to the photo library, you must set the second argument to true
local myCaptureImage = display.captureBounds( display.currentStage.contentBounds, true )

-- Remove the returned capture image since we're only interested in saving to the photo library
-- Doing this immediately after the above function call prevents it from being drawn on screen
myCaptureImage:removeSelf()
myCaptureImage = nil
`````
