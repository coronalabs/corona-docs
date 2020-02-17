# Project Configuration

Configuration settings for an app are defined using a `config.lua` file written in Lua syntax. It should be placed in the project's base directory.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Although `config.lua` is a Lua file, its intention is merely to configure the app in advance of its primary functionality starting in `main.lua`. You should __not__ make Lua&nbsp;API calls within the `config.lua` file or perform any actions beyond simply defining the supported tables and <nobr>key-value</nobr> pairs for configuration purposes.

</div>

<div class="guides-toc">

* [Basic Structure](#basicstruct)
* [Content Scaling](#contentscaling)
* [Dynamic Image Selection](#dynamicimages)
* [Content Properties](#contentproperties)
* [Runtime Errors](#debug)
* [Frame Rate (fps)](#fps)
* [App Licensing](#licensing)
* [Shader Precision](#shaderPrecision)

</div>


<a id="basicstruct"></a>

## Basic Structure

The `config.lua` file is set up using a `content` table nested within a `application` table as follows:

``````lua
application =
{
	content =
	{
		-- Parameters
	}
}
``````




<a id="contentscaling"></a>

## Content Scaling

Since most apps are developed for multiple devices and screen resolutions, Corona features several __content&nbsp;scaling__ options. This allows you to use a common set of screen coordinates while Corona automatically scales text, vector objects, and images to different resolutions depending on the device.

Corona can scale both upward or downward depending on your starting resolution. It can also substitute image files of differing resolution when needed, ensuring that your app appears clear and sharp on all devices (see [Dynamic&nbsp;Image&nbsp;Selection](#dynamicimages) below).

<div class="guide-notebox">
<div class="notebox-title">Content Area</div>

A fundamental concept behind content scaling is __content&nbsp;area__. In Corona, your base content area can be whatever you wish, but often it's based around a common screen width/height aspect ratio like 2:3, for example 320&times;480.

The content area represents the overall "stage" on which text, vector objects, and image assets are displayed. Everything will be positioned in relation to this content area, which may or may not match the screen's actual pixel resolution. The content area will be __scaled__ to fit the screen, with subtle differences dictated by the `scale` definition (see __scale__ below).

The internal __coordinate system__ is also dependent on the content area, with coordinates `(0,0)` residing in the top-left corner of the content area, __not__ necessarily the top-left corner of the screen. For more information on the Corona coordinate system, see the [Group&nbsp;Programming&nbsp;Guide][guide.graphics.group].

</div>

### width | height

The content area is defined by the `width` and `height` values in `config.lua`. If you omit or set either of these values to `0`, content scaling will __not__ be used.

``````lua
application =
{
	content =
	{
		width = 320,
		height = 480,
	}
}
``````

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

The content area should always be defined in respect to __portrait__ orientation. If your app is designed for landscape orientation, you should still set the `width` and `height` according to __portrait__ orientation. In the example above, a <nobr>landscape-oriented</nobr> app should still use `width` and `height` parameters of 320 and 480 respectively, __not__ 480 and 320.

To control an app's orientation on actual devices, you must define specific parameters in the `build.settings` file. See [Project&nbsp;Build&nbsp;Settings][guide.distribution.buildSettings] for more information.

</div>

### scale

The __scaling method__ of the content area is determined by the `scale` value. If you omit this (not&nbsp;recommended), the `width` and `height` values will be ignored and the content area will be set to the device's actual pixel width and height.

``````lua
application =
{
	content =
	{
		width = 320,
		height = 480,
		scale = "letterbox",
	}
}
``````

The possible `scale` values include the following:

* `"letterbox"` &mdash; scales the content area to fill the screen while preserving the same aspect ratio. The entire content area will reside on the screen, but this might result in "black&nbsp;bars" on devices with aspect ratios that differ from your content aspect ratio. Note, however, that you can still utilize this "blank" area and fill it with visual elements by positioning them or extending them outside the content area bounds. Essentially, `"letterbox"` is an ideal scale mode if you want to ensure that everything in your content area appears within the screen bounds on all devices.

* `"zoomEven"` &mdash; scales the content area to fill the screen while preserving the same aspect ratio. Some content may "bleed" off the screen edges on devices with aspect ratios that differ from your content aspect ratio. Basically, `"zoomEven"` is a good option to ensure that the entire screen is filled by the content area on all devices (and&nbsp;content clipping near the outer edges is&nbsp;acceptable).

<div class="code-indent" style="max-width: 70%;">
<div class="inner-table">

    letterbox								    zoomEven
------------------------------------------	------------------------------------------
![][images.simulator.content-letterbox]		![][images.simulator.content-zoomeven]
------------------------------------------	------------------------------------------

</div>
</div>

* `"adaptive"` &mdash; instead of a static content area, a dynamic content width and height is chosen based on the device. See the [Adaptive Scaling (Resolution Independence)][guide.system.adaptiveScale] guide for details. Note that `"adaptive"` mode is __not__ supported for macOS desktop apps or Win32 desktop apps.

* `"zoomStretch"` &mdash; scales the content area to fill the entire screen on any device, ignoring the content aspect ratio. This mode should be used with caution since it will stretch/warp images and text if the device's aspect ratio doesn't exactly match the content area's aspect ratio.



### xAlign | yAlign

By default, scaled content is __centered__ on the screen. In `letterbox` scale mode, empty screen area will be evenly divided between both sides. In `zoomEven` mode, the bleed area will be cropped equally on both sides.

If you need to align the content area to a particular edge of the screen, you can use the `xAlign` and `yAlign` values.

* `xAlign` — string value which sets the alignment in the __x__ direction. Possible values are `"left"`, `"center"`, or `"right"`.

* `yAlign` — string value which sets the alignment in the __y__ direction. Possible values are `"top"`, `"center"`, or `"bottom"`.

``````lua
application =
{
	content =
	{
		width = 320,
		height = 480,
		scale = "letterbox",
		xAlign = "left",
		yAlign = "top"
	}
}
``````




<a id="dynamicimages"></a>

## Dynamic Image Selection

In addition to content scaling, Corona supports __dynamic image selection__. If you are developing an app for both normal and Retina/HD devices, you should not rely on Corona to simply scale one set of images across a wide array of screen resolutions. There are several issues related to this:

1. If you design all of your images in low resolution and allow Corona to scale them up for Retina/HD devices, the images will appear blurry or pixelated. Not only will this result in poor visual appearance, but it may cause the app to be rejected before it reaches the marketplace.

2. In contrast, if you design all of your images for Retina/HD and allow Corona to scale them down for lower resolution devices, the larger images will require the same amount of texture memory on those devices. This may adversely affect the performance of your app — or worse, those images will not appear if they exceed the maximum texture size on a device.

The solution is to create __multiple versions__ of every image, tailored for two or three different resolutions, and name them according to the "image&nbsp;set" they belong to. On each device, Corona will automatically select images from the set that most closely matches the content area and scale.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This feature is only supported by images displayed using [display.newImageRect()][api.library.display.newImageRect] or by sprites and images taken from [image&nbsp;sheets][guide.media.imageSheets] that contain the overall sheet size parameters.

</div>

To set up dynamic image selection, you must include an `imageSuffix` table within the `content` table. Inside this table, declare at least one <nobr>key-value</nobr> pair consisting of an __image&nbsp;suffix__ and a __scale&nbsp;factor__.

``````lua
imageSuffix =
{
	["@2x"] = 2.0,
	["@4x"] = 4.0
}
``````

As indicated, each __image suffix__ must be specified within brackets and quotes as in `["@2x"]`. The suffix can be named whatever you want, but it should be short and logical since you must append the same suffix to __all__ image files designed for that image set. When adding a suffix to each image file, do not include the bracket or quotes — just append the suffix itself, for example `myImage@2x.png` or `myImage@4x.png`.

The second part of each declaration is the __scale&nbsp;factor__. This value specifies the scale threshold above which Corona will use images in that suffix set. The following code can help you determine the proper values:

``````lua
print( display.pixelWidth / display.actualContentWidth )
``````

Add this code to your project, access the Corona Simulator, and use __Window&nbsp;&rarr;&nbsp;View&nbsp;As__ to simulate different devices. Note the output in the Corona Simulator Console — this is the scale factor for the device. If the value on a particular device is __greater&nbsp;than__ or __equal&nbsp;to__ the number you specify for the scale factor, Corona will use images from that suffix set.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If you use widgets from the Corona [widget][api.library.widget] library, you must adhere to the standardized `@2x` and `@4x` suffix options, otherwise the proper <nobr>hi-resolution</nobr> assets will not be selected on Retina/HD devices. Note that this rule does not apply for <nobr>visually-customized</nobr> widgets for which you've created custom assets and/or image sheets &mdash; in&nbsp;this case you can use any suffix setup and name the assets accordingly.

</div>

### Example

In the following example, just one suffix is defined (`"@2x"`), but it accommodates several <nobr>high-resolution</nobr> devices. Resolutions below this scale factor will simply use the <nobr>non-suffixed</nobr> image set. A <nobr>non-suffixed</nobr> image set should be included in every project as a basic precaution — this ensures that if a particular device falls outside of the scale factor range(s) you've defined, Corona can use these images instead.

``````lua
application = 
{
	content = 
	{ 
		width = 320,
		height = 480,
		scale = "letterbox",
		xAlign = "center",
		yAlign = "center",
		
		imageSuffix =
		{
			["@2x"] = 1.5
		}
	}
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Although you can define as many image sets as you wish, there are simply too many screen sizes and aspect ratios to achieve a perfect 1:1 ratio on all of them. Thus, you must accept some degree of scaling, even when using dynamic image selection. In most cases, you should set up image suffixes that target devices of similar resolution, then allow Corona to scale the images up or down slightly depending on the device. This minor degree of scaling will generally not be perceived by the end user, since most modern devices have a very high pixel density. As noted at the top of this section, it's better to scale images down versus up and you should attempt to construct a scaling setup that achieves this on the most popular devices.

</div>




<a id="contentproperties"></a>

## Content Properties

Several properties are exposed within Corona to help you work with scaled content, including those mentioned below. Please refer to the [API Reference][api.library.display] for a complete list.

* [display.contentWidth][api.library.display.contentWidth] and [display.contentHeight][api.library.display.contentHeight] — <nobr>read-only</nobr> properties representing the original width and height of the content, in pixels.

* [display.pixelWidth][api.library.display.pixelWidth] and [display.pixelHeight][api.library.display.pixelHeight] — <nobr>read-only</nobr> properties representing the entire screen width and height, in pixels.

* [display.viewableContentWidth][api.library.display.viewableContentWidth] and [display.viewableContentHeight][api.library.display.viewableContentHeight] — <nobr>read-only</nobr> properties representing the __viewable__ width and height. This is useful if you're using `zoomEven` scaling, as it will reveal the viewable (uncropped) measurements, in pixels.

* [display.actualContentWidth][api.library.display.actualContentWidth] and [display.actualContentHeight][api.library.display.actualContentHeight] — <nobr>read-only</nobr> properties representing the width and height in Corona content units of the screen. The result depends on the `scale` setting mentioned above.

* [display.contentCenterX][api.library.display.contentCenterX] and [display.contentCenterY][api.library.display.contentCenterY] — <nobr>read-only</nobr> properties representing the center of the content area, useful for positioning objects along either central axis.




<a id="debug"></a>

## Runtime Errors

In the Corona Simulator, there is a setting under __Preferences__ called __Show&nbsp;Runtime&nbsp;Errors__ which defaults to __on__. This global setting triggers <nobr>pop-up</nobr> error messages while running an app in the Simulator. If you don't like this feature or if it doesn't fit your workflow, you can turn it off.

You can also set this on a per-app basis from `config.lua` to control error messages while running the app on a device. `showRuntimeErrors` accepts a boolean value <nobr>(`true` or `false`)</nobr>. The default depends on whether the app is built for distribution: if an app is built with a developer provisioning profile or the debug keystore then `showRuntimeErrors` will default to `true`, otherwise it will default to `false`.  Obviously, an explicit setting will override the default.

``````lua
application =
{
	showRuntimeErrors = true,
}
``````

<!--If you explicitly set `showRuntimeErrors` to `false`, it will __override__ the preference in the Simulator for that particular app.-->

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* Remember that disabling error messages doesn't mean that errors aren't occurring. The <nobr>pop-up</nobr> alerts simply help you detect these errors.

* Another option is to use the `unhandledError` Runtime listener to trap errors which would otherwise trigger an error <nobr>pop-up</nobr>. This allows you to implement custom error reporting. Note that even if you disable error messages, the listener is still called, but the `return` value doesn't matter since the <nobr>pop-up</nobr> is never displayed.

</div>

``````lua
function myUnhandledErrorListener( event )

    local iHandledTheError = true

    if ( iHandledTheError ) then
        print( "Handling the unhandled error", event.errorMessage )
    else
        print( "Not handling the unhandled error", event.errorMessage )
    end
    
    return iHandledTheError
end

Runtime:addEventListener( "unhandledError", myUnhandledErrorListener )
``````




<a id="fps"></a>

## Frame Rate (fps)

The default frame rate is 30 frames per second, but you can set it to 60 frames per second by adding the `fps` key. Values other than `30` or `60` will be ignored.

``````lua
application =
{
	content =
	{
		fps = 60,
	}
}
``````




<a id="licensing"></a>

## App Licensing

The Corona [licensing][api.library.licensing] library lets you confirm that the app was bought from a store. To implement licensing, the `license` table must be added to the `application` table of `config.lua`:

``````lua
application =
{
	license =
	{
		google =
		{
			key = "YOUR_LICENSE_KEY",
		},
	},
}
``````

Please see the [licensing][api.library.licensing] documentation for full details on how to implement and execute licensing.




<a id="shaderPrecision"></a>

## Shader Precision

This is used to override the default shader precision for all OpenGL&nbsp;ES shaders (on&nbsp;devices).

Acceptable values are `"highp"`, `"mediump"`, and `"lowp"`.

You should __not__ specify this unless you absolutely require higher precision and see no performance impact from setting it.

``````lua
application =
{
	content =
	{
		shaderPrecision = "highp",
	},
}
``````

### Fine Tuning

Assigning a string value as outlined above will change the meaning of all precision qualifier macros. Thus, another option is to set individual precision macros by assigning a table to `shaderPrecision`. This table should contain Corona precision qualifier macros as keys and OpenGL&nbsp;ES precision qualifiers as values, for example:

``````lua
application =
{
	content =
	{
		shaderPrecision =
		{ 
			P_POSITION = "highp",
			P_UV = "mediump",
			P_COLOR = "lowp",
		},
	},
}
``````

Acceptable keys are `P_DEFAULT`, `P_RANDOM`, `P_NORMAL`, `P_POSITION`, `P_UV`, and `P_COLOR`.

Acceptable values for these keys are `"highp"`, `"mediump"`, and `"lowp"`.

For more information, see the __Precision&nbsp;Qualifier&nbsp;Macros__ section of the [Custom Shader Effects][guide.graphics.customEffects] guide.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Assigning a value/table to `shaderPrecision` will change the behavior and performance of all custom shader effects __and__ <nobr>built-in</nobr> [effects][guide.graphics.effects].

</div>


<!---

<a id="antialias"></a>

## Anti-Aliasing

If the target device/hardware supports anti-aliasing of vector objects, you can enable this feature by setting the `antialias` key within the `content` table.

``````lua
application =
{
	content =
	{
		antialias = true,
	}
}
``````

-->
