# fill.blendMode

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [Paint][api.type.Paint]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          additive blends, blend mode, blending, Porter-Duff
> __See also__          [Paint][api.type.Paint]
>						[object.fill][api.type.ShapeObject]
>                       [object.blendMode][api.type.DisplayObject.blendMode]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Allows you to change the blend mode on a specific object. 

## Standard Blend Modes

Standard blend modes can be specified via one of the following strings:

* `"normal"` &mdash; This is the standard blend mode.
* `"add"` &mdash; Also known as linear dodge. Additive blends are useful for glowing effects.
* `"multiply"` &mdash; Multiply blends are useful for creating shadows. Blending with white results in no change; blending with other colors will darken the composited image.
* `"screen"` &mdash; This is useful for lightening images without lightening the darkest areas.


## Porter-Duff Presets

Porter-Duff blend modes can be specified via one of the strings listed below.

* `"clear"` 
* `"src"` 
* `"dst"` 
* `"srcOver"` 
* `"dstOver"` 
* `"srcIn"` 
* `"dstIn"` 
* `"srcOut"` 
* `"dstOut"` 
* `"srcAtop"` 
* `"dstAtop"` 
* `"xor"` 


## Custom Blend Modes

Custom blend modes allow you to control how the source and destination factors are used in the blending calculation. They follow the blend factors discussed in the [OpenGL-ES 2 specification](http://www.khronos.org/opengles/sdk/docs/man/xhtml/glBlendEquationSeparate.xml).

You can specify custom blend modes via a Lua table that specifies the source and destination factors as <nobr>key-value</nobr> pairs. 

### Keys

##### srcColor ~^(required)^~
_[String][api.type.String]._ See [values](#values) below for a list of valid string values.

##### srcAlpha ~^(optional)^~
_[String][api.type.String]._ By default, same as `srcColor`.

##### dstColor ~^(required)^~
_[String][api.type.String]._ See [values](#values) below for a list of valid string values.

##### dstAlpha ~^(optional)^~
_[String][api.type.String]._ By default, same as `dstColor`.

<a id="values"></a>

### Values

* `"zero"`
* `"one"`
* `"srcColor"`
* `"oneMinusSrcColor"`
* `"dstColor"`
* `"oneMinusDstColor"`
* `"srcAlpha"`
* `"oneMinusSrcAlpha"`
* `"dstAlpha"`
* `"oneMinusDstAlpha"`
* `"srcAlphaSaturate"`


## Limitations

### Premultiplied Alpha

Some Android devices do not consistently load images as premultiplied alpha. We have applied workarounds but they are not foolproof. On those devices, the `"multiply"` and `"screen"` blend modes will not work correctly, and you should see a single warning message in the console about it.

Porter-Duff blend modes will only work with images that have been loaded as premultiplied alpha.


## Examples

##### Additive Blend

``````lua
local laser = display.newImage( "blendmode_laser.png" )
laser.fill.blendMode = "add"
``````

##### Porter-Duff Preset

``````lua
local laser = display.newImage( "blendmode_laser.png" )
laser.fill.blendMode = "srcAtop"
``````

##### Custom Blend

``````lua
local laser = display.newImage( "blendmode_laser.png" )

local customBlend = {
	srcColor = "srcColor",
	srcAlpha = "oneMinusDstColor",
	dstColor = "dstAlpha",
	dstAlpha = "srcAlphaSaturate"
}

laser.fill.blendMode = customBlend
``````