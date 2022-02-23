# CoronaSplashControl.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				(special)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Splash Screen Control, splash screen
> __Platforms__         Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This special plugin, enables control of the default CORONA_CORE_PRODUCT branded splash screen that is displayed when apps start up on a device. Rather than adding capabilities to Lua code, this plugin enables the ability to control the splash screen from within `build.settings`.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

* On iOS, the iOS launch screen will appear before the splash screen, assuming the splash screen is not disabled. If the splash screen is disabled, the launch screen will appear until the app is fully loaded, then your first screen/scene will appear.

</div>


## Integration

### Splash Screen Removal

To remove splash screen, add the `splashScreen` table to the project's `build.settings` with the `enable` key set to `false`:

``````lua
settings =
{
	splashScreen = 
	{
		enable = false
	},
}
``````

Alternatively, you can remove the splash screen on a <nobr>per-platform</nobr> basis as follows:

``````lua
settings =
{
	splashScreen =
	{
		ios = {
			enable = false
		},
		android = {
			enable = true
		}
	},
}
``````

### Custom Splash Screen

If you'd like to display your own custom splash screen, include the `splashScreen` table within `build.settings` as above, but set the `enable` key to `true` and add an `image` key defining the image name. For&nbsp;instance:

``````lua
settings =
{
	splashScreen = 
	{
		enable = true,
		image = "mySplashScreen.png"
	},
}
``````

Alternatively, you can customize the splash screen on a <nobr>per-platform</nobr> basis as follows:

``````lua
settings =
{
	splashScreen =
	{
		ios = {
			enable = true,
			image = "mySplashScreen_iOS.png"
		},
		android = {
			enable = true,
			image = "mySplashScreen_Android.png"
		}
	},
}
``````

For customized implementation, `image` indicates the path to any image file in the project. The image will be displayed on a black background and it will match the default orientation of the app, scaled to fit the screen of the current device. You may need to experiment to arrive at the ideal image for your splash screen, but if it's large enough for the largest device your app is intended to run on, you only need one image.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Because `build.settings` does not apply to app builds performed via CORONA_NATIVE_PRODUCT, special handling is required to customize the splash screen in these instances. Please see the [CORONA_NATIVE_PRODUCT](#native) section below for details.

</div>


<a id="native"></a>

## CORONA_NATIVE_PRODUCT

Because `build.settings` does not apply to app builds performed via CORONA_NATIVE_PRODUCT, special handling is required to customize the splash screen in these instances:

* For iOS, place an image named `_CoronaSplashScreen.png` in the root of your app bundle, specifying it as a "resource" in Xcode.

* For Android, place an image named `_corona_splash_screen.png` within `res/drawable/` using whatever mechanism is appropriate in Android&nbsp;Studio or otherwise.
