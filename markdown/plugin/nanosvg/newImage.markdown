# nanosvg.newImage()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          SVG, nanosvg, newImage
> __See also__          [nanosvg.newTexture()][plugin.nanosvg.newTexture]
>						[nanosvg.*][plugin.nanosvg]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Displays an image on the screen containing the rendered SVG.


## Syntax

	nanosvg.newImage( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing the required parameters for the new object&nbsp;&mdash; see the next section for details.


## Parameter Reference

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

At least __one__ data source&nbsp;&mdash; `filename`, `filePath`, <nobr>or `data` &mdash;</nobr> must be specified to render the SVG.

</div>

##### filename ~^(optional)^~
_[String][api.type.String]._ Indicates the name of the SVG file to load, relative to `baseDir`.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Specifies the base directory where `filename` is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.

##### filePath ~^(optional)^~
_[String][api.type.String]._ Indicates the full file path of the SVG file to load.

##### data ~^(optional)^~
_[String][api.type.String]._ Contains XML data of the SVG to be rasterized.

##### x ~^(optional)^~
_[Number][api.type.Number]._ The __x__ coordinate of the image on screen.

##### y ~^(optional)^~
_[Number][api.type.Number]._ The __y__ coordinate of the image on screen.

##### width ~^(optional)^~
_[Number][api.type.Number]._ The content width of the image, which is the width within the reference screen of the content.

##### height ~^(optional)^~
_[Number][api.type.Number]._ The content height of the image, which is the height within the reference screen of the content.

##### pixelWidth ~^(optional)^~
_[Number][api.type.Number]._ Specifies the horizontal pixel dimensions of the texture that the SVG is rendered to. If this is omitted, the texture width will be deduced from the SVG width/height ratio.

##### pixelHeight ~^(optional)^~
_[Number][api.type.Number]._ Specifies the vertical pixel dimensions of the texture that the SVG is rendered to. If this is omitted, the texture height will be deduced from the SVG width/height ratio.

##### scale ~^(optional)^~
_[String][api.type.String]._ Specifies how the rasterized SVG should fit into the texture. This only applies if both `pixelWidth` and `pixelHeight` are specified. Options&nbsp;include:

* `"letterbox"` &mdash; This option (default) fits the entire rasterized SVG into the texture width/height, leaving letterbox regions transparent.
* `"zoomEven"` &mdash; This option fills the texture width/height with the rasterized SVG so that its smaller dimension fits into the texture.

##### scaleOffset ~^(optional)^~
_[Number][api.type.Number]._ Specifies how a scaled rasterized SVG will be positioned within the texture width/height. A value of `0.5`&nbsp;(default) will position it in the middle of the texture; `0` to the top or left; `1` to the bottom or right.

##### dpi ~^(optional)^~
_[Number][api.type.Number]._ Number for transforming between different SVG units (pixels,&nbsp;points, <nobr>cm, mm, etc.).</nobr> Default value is `96`.


## Examples

##### Create Image From SVG File

``````lua
local nanosvg = require( "plugin.nanosvg" )

local testSvg = nanosvg.newImage(
{
	filename = "test.svg",
	x = display.contentCenterX,
	y = display.contentCenterY,
	width = 100,
	height = 100
})
``````
	
##### Create Image From SVG Data

``````lua
local nanosvg = require( "plugin.nanosvg" )

local circle = nanosvg.newImage(
{
	data = "<svg viewBox='0 0 200 200'><circle cx='100' cy='100' r='100'/></svg>",
	x = display.contentCenterX,
	y = display.contentCenterY,
	width = 100,
	height = 100
})
``````
