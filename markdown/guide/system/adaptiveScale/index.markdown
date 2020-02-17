# Adaptive Scaling (Resolution&nbsp;Independence)

This guide outlines __virtual&nbsp;pixels__ in Corona and explains how they can be made to behave like native iOS/Android virtual pixels using __adaptive__ scaling.

<div class="guides-toc">

* [Simple Content Scaling](#simple)
* [Limitations of Simple Scaling](#limitations)
* [Adaptive Content Scaling](#adaptive)

</div>


<a id="simple"></a>

## Simple Content Scaling

Corona offers its own scheme for virtual pixels known as __content&nbsp;scaling__. This allows developers to specify a common set of screen coordinates while Corona automatically scales text, vector objects, and images to different resolutions depending on the device.

There are actually multiple ways to approach content scaling. The easiest way is to just choose a single <nobr>fixed-size</nobr> virtual screen as follows:

1. Define a content area __width__ and __height__ in virtual pixels <nobr>(Corona content units)</nobr>. This implicitly defines the virtual coordinate system to code around.

2. Specify a __scale__ mode such as `"letterbox"` or `"zoomEven"`&nbsp;&mdash; this determines how Corona fills the screen.

3. If using `"letterbox"` mode, design for the empty letterbox regions which occur when the aspect ratio of the virtual screen and the actual device differs&nbsp;&mdash; these are like the black bars on a TV when the show is letterboxed, except that in Corona, these regions can (and&nbsp;should) have visual content drawn into them. Alternatively, if using `"zoomEven"` mode, understand that some visual content may bleed off the screen when the aspect ratio differs.

In practice, a simple `config.lua` may include values like these:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7]" }
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

In this guide, this approach will be referenced as __simple&nbsp;content&nbsp;scaling__, so named because a <nobr>fixed-sized</nobr> screen simplifies development. The fixed virtual content width and height, represented by [display.contentWidth][api.library.display.contentWidth] and [display.contentHeight][api.library.display.contentHeight], make it easier to code an app because it provides a static content size to design around.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

For more details on content scaling and how to configure it, please see the [Project Configuration][guide.basics.configSettings#contentscaling] guide.

</div>
</div>




<a id="limitations"></a>

## Limitations of Simple Scaling

Although simple content scaling works well in most cases, it's not a panacea. In certain apps, particularly <nobr>UI-centric</nobr> apps, it suffers from various drawbacks including:

* If the app design is locked into a particular aspect ratio, managing the letterbox regions or allowing for bleed isn't ideal. In this instance, it would be better if the entire __virtual__ screen had the same aspect ratio as the __device__ screen.

* Interface elements like buttons and other [widgets][api.library.widget] scale proportionally larger on tablets compared to phones&nbsp;&mdash; in other words, UI elements that look reasonable (size) on phones typically appear abnormally large on tablet screens.




<a id="adaptive"></a>

## Adaptive Content Scaling

Given the various drawbacks of simple content scaling, especially in <nobr>UI-centric</nobr> apps, it would be convenient if interface elements could be approximately the same size across all devices. Fortunately, Corona's __adaptive__ content scaling addresses this while still providing nice pixel scales and eliminating letterbox regions.

To set adaptive content scaling, simply set the `scale` key within `config.lua` to `"adaptive"`:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
application =
{
	content =
	{
		scale = "adaptive",
	}
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Because adaptive scaling calculates the content area size as outlined in the next section, it is __not__ necessary to define `width` and `height` values when using `"adaptive"` scale mode.

</div>

### Core Principles

For adaptive scaling, Corona uses heuristics to determine an appropriate content width and height. There are three primary goals:

1. The aspect ratio of the virtual screen should match the actual device screen, meaning that there are no letterbox regions.

2. The preferred pixel scales should be whole numbers (or&nbsp;simple&nbsp;fractions) whenever possible.

3. The virtual pixel density should be roughly the same across devices.

For iOS, this is achieved by setting the content width and height to match the width and height of the device in iOS points. This works out nicely because iOS points are roughly the same physical size.

For Android, the content width and height is set to match the __dp__ <nobr>(device-independent pixel)</nobr> units, using the approximate PPI of the general screen type <nobr>(`hdpi`, `xhdpi`, etc.)</nobr> and actual screen pixel width/height to calculate the content screen size. This similarly works out because Android __dp__ values are approximately the same physical length.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Whenever the virtual screen size is allowed to change, there's a tradeoff and the complexity increases slightly. Specifically, the code should be aware that the content width and height can change depending on the device. Thus, rather than using static width and height values for certain interface elements, those values should be defined __dynamically__ via `display.contentWidth`, `display.contentHeight`, and various calculations around these properties, for instance <nobr>`display.contentWidth * 0.5`</nobr> to set the width of an object to half the screen width. These properties should also be used for positioning, for example setting an object's __y__ position to `display.contentHeight` to position its vertical center point at the bottom of the screen.

</div>
</div>

### Simple vs. Adaptive

The difference between simple content scaling and adaptive content scaling is essentially this:

* In a simple scaling scenario, the __visual&nbsp;size__ of content is scaled. Thus, on larger screens, objects actually get larger in ruler length (for&nbsp;example inches or&nbsp;centimeters).

* In an adaptive scaling scenario, the visual size of content is approximately equal across different screen sizes, meaning that there's more available screen space on larger devices.

Another way to understand the difference is to inspect what happens to pixel scales. Using simple content scaling, the pixel scales differ across various devices, but they stay the same in adaptive scaling. Consider this comparison:

* In a simple scaling scenario, assume that the content width is set to `320`. On an iPhone&nbsp;7 which has a screen resolution width of 750, the pixel scale is about <nobr>2.3 (`750/320`)</nobr>, meaning ~2.3 actual pixels for a single virtual pixel. On the larger iPhone&nbsp;7&nbsp;Plus with a screen resolution width of 1242, the pixel scale becomes approximately <nobr>3.9 (`1242/320`)</nobr>.

* Using adaptive content scaling, the pixel scale is 2 on both devices because Apple designed the point widths and heights for each device to make the math work: <nobr>a 375 point width</nobr> and 750 pixel width on the iPhone&nbsp;7 compared to a 621 point width and 1242 pixel width on the iPhone&nbsp;7&nbsp;Plus.

### Retina Imaging

Adaptive scaling also affects the choice of scaling thresholds for Retina/HD image selection <nobr>(see [Dynamic Image Selection][guide.basics.configSettings#dynamic-image-selection] for details)</nobr>.

In a simple scaling scenario, it may be necessary to go as high as <nobr>`@4x`-suffixed</nobr> images because the content sometimes needs to be scaled to 400% or higher, particularly on Retina/HD tablets. In an adaptive scaling scenario, however, it's usually sufficient to include `@2x` and <nobr>`@3x`-suffixed</nobr> versions of images.

In terms of choosing actual threshold values for the `imageSuffix` table of `config.lua`, it may seem logical that the scaling thresholds for `@2x` and <nobr>`@3x`-suffixed</nobr> images would be `2.0` and `3.0` respectively, as&nbsp;in:

``````{ brush="lua" gutter="false" first-line="1" highlight="[8,9]" }
application =
{
	content =
	{
		scale = "adaptive",
		imageSuffix =
		{
			["@2x"] = 2.0,
			["@3x"] = 3.0,
		},
	}
}
``````

However, there are two specific reasons why the thresholds should be lowered:

1. On Android, `hdpi` devices have a fractional scale of 1.5&times;. In this case, the `@2x` images should be chosen by lowering the associated threshold to `1.5`.

2. The iPhone&nbsp;7&nbsp;Plus is one device where the pixel scale is a little weird. Here, <nobr>UIKit-based</nobr> apps are made to believe that the scale is 3&times;, but in reality it's actually 2.6&times; after downscaling; for <nobr>OpenGL-based</nobr> and <nobr>Metal-based</nobr> games, it's directly 2.6&times;. In this case, the `@3x` images should probably be used, otherwise the `@2x` images will be chosen and scaled up which might not appear optimal. This can be achieved by lowering the associated threshold to `2.5`.

With these considerations in mind, an __adaptive__ `config.lua` should include threshold values like these:

``````{ brush="lua" gutter="false" first-line="1" highlight="[8,9]" }
application =
{
	content =
	{
		scale = "adaptive",
		imageSuffix =
		{
			["@2x"] = 1.5,
			["@3x"] = 2.5,
		},
	}
}
``````
