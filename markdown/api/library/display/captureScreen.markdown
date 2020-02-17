# display.captureScreen()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          screenshot, capture screen, save screen
> __See also__          [display.save()][api.library.display.save]
>						[display.capture()][api.library.display.capture]
>						[display.captureBounds()][api.library.display.captureBounds]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Captures the contents of the screen and returns it as a new [display object][api.type.DisplayObject]. You can optionally save the capture as a file to the device's photo library.

Calling this method places the captured image on the screen on top of all other display objects. Use [object:removeSelf()][api.type.DisplayObject.removeSelf] to remove this object from the screen.

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

If you need to capture a display object on application launch, for example when `main.lua` is executed to initialize the app, you must call `display.captureScreen()` within a [timer.performWithDelay()][api.library.timer.performWithDelay] call. A delay of at least 100 milliseconds is recommended.

`````lua
local function captureWithDelay()
    local capture = display.captureScreen()
end

timer.performWithDelay( 100, captureWithDelay )
`````


## Syntax

	display.captureScreen( [saveToPhotoLibrary] )

<a id="options-reference"></a>

##### saveToPhotoLibrary ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, then it adds the image to your device's photo library. For Android and iOS devices, this also necessitates the requirements outlined in [Gotchas](#gotchas).


## Example

`````lua
-- Fill the screen with a green rectangle
local rect = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
rect:setFillColor( 0, 1, 0.2 )

-- Draw a circle on the screen
local circle = display.newCircle( 155, 100, 36 )
circle:setFillColor( 1, 1, 1, 0.6 )

local function captureOnEvent()

    -- Capture the screen
    local screenCap = display.captureScreen( true )

    -- Remove the objects from the screen
    rect:removeSelf()
    circle:removeSelf()

    -- Scale the screen capture, now on the screen, to half its size
    screenCap:scale( 0.5, 0.5 )
    screenCap.x = display.contentCenterX
    screenCap.y = display.contentCenterY
 
    -- Alert the user to look in the library (device) or on the desktop (Simulator) for the screen capture
    local alert = native.showAlert( "Success", "Screen Capture Saved to Library", { "OK" } )
end

timer.performWithDelay( 500, captureOnEvent )
`````
