# display.capture()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          screenshot, capture screen, save screen
> __See also__          [display.save()][api.library.display.save]
>								[display.captureBounds()][api.library.display.captureBounds]
>								[display.captureScreen()][api.library.display.captureScreen]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function is the same as [display.save()][api.library.display.save], but it returns a display object instead of saving to a file by default. You can optionally save the capture to the device's photo library, but this is not the default action &mdash; you must explicitly tell it to do so when calling the function.

Essentially, `display.capture()` can be thought of as a hybrid between [display.save()][api.library.display.save] and [display.captureScreen()][api.library.display.captureScreen].

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

In addition, if you include the `saveToPhotoLibrary` [option](#options-reference) with a value of `true`, you must set the following permission in the `build.settings` file:

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

On iOS, if you include the `saveToPhotoLibrary` [option](#options-reference) with a value of `true`, you must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

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

If you need to capture a display object on application launch, for example when `main.lua` is executed to initialize the app, you must call `display.capture()` within a [timer.performWithDelay()][api.library.timer.performWithDelay] call. A delay of at least 100 milliseconds is recommended.

`````lua
local myObject1 = display.newRect( 50, 50, 100, 150 )

local function captureWithDelay()
    local capture = display.capture( myObject1 )
end

timer.performWithDelay( 100, captureWithDelay )
`````


## Syntax

	display.capture( displayObject, options )

##### displayObject ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ The variable that references the display object/group to capture.

##### options ~^(optional)^~
_[Table][api.type.Table]._ A table of options for the capture — see the next section for details.


## Options Reference

##### saveToPhotoLibrary ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, then it adds the image to your device's photo album <nobr>(PNG file)</nobr>. For Android and iOS devices, this also necessitates the requirements outlined in [Gotchas](#gotchas).

##### captureOffscreenArea ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the entire object/group is captured, even parts which are not visible on screen. If omitted, the capture will be constrained to the screen bounds. For legacy compatibility purposes, the deprecated `isFullResolution` option name can be used with the same effect.


## Syntax (Legacy)

    display.capture( displayObject [, saveToPhotoLibrary] )

##### displayObject ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ The variable that references the display object/group to capture.


##### saveToPhotoLibrary ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, then it adds the image to your device's photo album <nobr>(PNG file)</nobr>. For Android and iOS devices, this also necessitates the requirements outlined in [Gotchas](#gotchas).


## Example

`````lua
local myObject1 = display.newRect( 50, 50, 100, 150 )  -- Create a rectangle object
local myObject2 = display.newCircle( 100, 300, 50 )    -- Create a circle object
 
local group = display.newGroup()
 
group:insert( myObject1 )
group:insert( myObject2 )

-- Capture the entire group as a new display object
local combined = display.capture( group, { saveToPhotoLibrary=true, captureOffscreenArea=true } )

-- Position the new display object
combined.x, combined.y = 100, 100

-- Remove it
combined:removeSelf()
combined = nil
`````
