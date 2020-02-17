
# display.setDefault()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          defaults, set default, color, graphics, vector objects
> __See also__          [display.getDefault()][api.library.display.getDefault]
>						[Shapes &mdash; Paths, Fills, Strokes][guide.graphics.path]
>						[display.newLine()][api.library.display.newLine]
>						[display.newText()][api.library.display.newText]
>						[object.anchorX][api.type.DisplayObject.anchorX]
>						[object.anchorY][api.type.DisplayObject.anchorY]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Set default display values including default colors for display objects, anchor point defaults, texture wrapping settings, etc.

## Syntax

Any of the following are valid:

	display.setDefault( key, value )

	display.setDefault( key, r, g, b, alpha )

	display.setDefault( key, r, g, b )

	display.setDefault( key, gray )

	display.setDefault( key, gray, alpha )

##### key ~^(required)^~
_[String][api.type.String]._ Specifies the key to set the default value for.

##### gray, r, g, b, alpha ~^(optional)^~
_[Numbers][api.type.Number]._ Color values between `0` and `1`.


## Display Object Keys

These keys specify default anchor values and anchor bounds for all display objects.

* `"anchorX"` — The anchor alignment along the __x__ direction. This value is used for the value of the [anchorX][api.type.DisplayObject.anchorX] property in new objects. The default is `0.5` (centered along the __x__ direction).

* `"anchorY"` — The anchor alignment along the __y__ direction. This value is used for the value of the [anchorY][api.type.DisplayObject.anchorY] property in new objects. The default is `0.5` (centered along the __y__ direction).

* `"isAnchorClamped"` — If set to `false`, anchor positions along either the __x__ or __y__ direction are __not__ constrained to values between `0` and `1`. In this case, setting anchor values outside of this range (negative or positive) will position the anchor outside the bounds of the display object. Default is `true`.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Some display objects are not fully compatible with <nobr>non-center</nobr> anchor points, in particular [widgets][api.library.widget], so you should be careful which "scope" you set default anchors for. Typically, changing the default anchor values should be used near the beginning of a process&nbsp;&mdash; for&nbsp;instance, displaying a series of objects which must be anchored a certain way&nbsp;&mdash; and then immediately after they should be __reset__ to default (`0.5`) so that other objects are not affected inadvertently.

</div>
</div>


## Color Keys

A color key specifies which default color value to set.

* `"background"` — Corresponds to the default color for that the screen is cleared with. The default is initially black (`0,0,0`).

* `"fillColor"` — Corresponds to the default fill color for vector objects like [display.newRect()][api.library.display.newRect]. The default is initially white (`1,1,1`).

* `"strokeColor"` — Corresponds to the default stroke color for vector objects like [display.newRect()][api.library.display.newRect]. The default is initially white (`1,1,1`).

* `"lineColor"` — Corresponds to the default color for line objects like [display.newLine()][api.library.display.newLine]. The default is initially white (`1,1,1`).


## Native Keys

* `"isNativeTextBoxFontSizeScaled"` — Sets the default [Boolean][api.type.Boolean] value to be assigned to a native text box's [object.isFontSizeScaled][api.type.TextBox.isFontSizeScaled] property when created via the [native.newTextBox()][api.library.native.newTextBox] function. This is `true` by default. Set to `false` to enable legacy font handling support.

* `"isNativeTextFieldFontSizeScaled"` — Sets the default [Boolean][api.type.Boolean] value to be assigned to a native text field's [object.isFontSizeScaled][api.type.TextField.isFontSizeScaled] property when created via the [native.newTextField()][api.library.native.newTextField] function. This is `true` by default. Set to `false` to enable legacy font handling support.


## Texture Keys

* `"preloadTextures"` — The default behavior for texture loading is to load the texture when the display object is created or when the display object uses it. Setting this value to `false` will delay loading of the texture to when the object appears on screen or to when it becomes visible.

* `"isImageSheetSampledInsideFrame"` — Affects how [image sheet][api.type.ImageSheet] frames are sampled. If set to `true`, sampling is intruded by half of the source texture pixel size to avoid border artifacts. Default is `false`.

* `"magTextureFilter"` — The default magnification sampling filter applied whenever an image is loaded by Corona. Once an image is loaded the first time, the same sampling filter will be applied for any subsequent loads of the same file. This is because textures are loaded once per file. Default value is `"linear"`. Alternative value is `"nearest"`.

* `"minTextureFilter"` — The default minification sampling filter applied whenever an image is loaded by Corona. Once an image is loaded the first time, the same sampling filter will be applied for any subsequent loads of the same file. This is because textures are loaded once per file. Default value is `"linear"`. Alternative value is `"nearest"`.

* `"textureWrapX"` — The texture wrap mode along the __x__ direction. Once an image is loaded the first time, the same wrap mode will be applied for any subsequent loads of the same file. This is because textures are loaded once per file. Default value is `"clampToEdge"`. Other values are useful for patterns and include `"repeat"` or `"mirroredRepeat"`.

* `"textureWrapY"` — The texture wrap mode along the __y__ direction. Once an image is loaded the first time, the same wrap mode will be applied for any subsequent loads of the same file. This is because textures are loaded once per file. Default value is `"clampToEdge"`. Other values are useful for patterns and include `"repeat"` or `"mirroredRepeat"`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* For texture wrapping (`"textureWrapX"` and `"textureWrapY"`), `"clampToEdge"` is the only valid mode for [non-power-of-two textures](http://www.opengl.org/wiki/NPOT_Texture). To use `"repeat"` or `"mirroredRepeat"`, make sure the dimensions of your textures are power of two, for example `16`, `32`, `64`, `128`, `256`, etc.

* When using one of the non-default wrap modes (`"repeat"` or `"mirroredRepeat"`), you should revert the wrap mode to default (`"clampToEdge"`) when repeating fills are no longer required. For example, after filling an object with a wrapping texture, revert the wrap mode to default before proceeding with any other [fill][api.type.ShapeObject.fill] operations.

</div>

## Camera Source

* `"cameraSource"` — The default behavior for a camera object fill is to use the back-facing camera. Setting this value to `"front"`, will change the behavior to use the <nobr>front-facing</nobr> camera. Note that this is an <nobr>iOS-only</nobr> feature.


## Examples

##### Default Anchors

``````lua
-- Set default anchor point for objects to bottom-left
display.setDefault( "anchorX", 0 )
display.setDefault( "anchorY", 1 )
``````

##### Non-Clamped Anchors

``````lua
display.setDefault( "isAnchorClamped", false )
--display.setDefault( "isAnchorClamped", true )

local rect = display.newRect( 200, 240, 100, 100 )
rect.anchorX = -1
rect.anchorY = 1.5

transition.to( rect, { rotation=135, delay=500 } )
``````

##### Fill Color and Background

``````lua
-- Set default fill color for vector objects to red
display.setDefault( "fillColor", 1, 0, 0 )

-- Set default screen background color to blue
display.setDefault( "background", 0, 0, 1 )
``````


##### Texture Wrap

``````lua
display.setDefault( "textureWrapX", "repeat" )
display.setDefault( "textureWrapY", "repeat" )

local x,y = display.contentCenterX, display.contentCenterY
local o = display.newRect( x, y, display.contentWidth, display.contentHeight )
o.fill = { type="image", filename="fish.small.red.png" }
o.fill.scaleX = 0.1
o.fill.scaleY = 0.1
``````

##### Camera Source

``````lua
if ( system.getInfo( "environment" ) ~= "simulator" ) then
	display.setDefault( "cameraSource", "front" )   -- Front-facing camera
	--display.setDefault( "cameraSource", "back" )  -- Back-facing camera
end
``````
