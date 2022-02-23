# nanosvg.newTexture()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [TextureResourceExternal][api.type.TextureResourceExternal]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          SVG, nanosvg, newTexture
> __See also__          [nanosvg.newImage()][plugin.nanosvg.newImage]
>						[nanosvg.*][plugin.nanosvg]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Creates a texture instance \([TextureResourceExternal][api.type.TextureResourceExternal]\) containing the rasterized SVG.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Created textures are subject to manual texture memory management. See the [Texture Loading/Management][guide.graphics.textureManagement] guide for more information.

</div>
</div>


## Syntax

    nanosvg.newTexture( params )

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


## Example

##### Create Texture and Image From SVG File

``````lua
local nanosvg = require( "plugin.nanosvg" )

local tex = nanosvg.newTexture(
{
	filename = "test.svg",
})

if tex then
	local testSvg = display.newImage( tex.filename, tex.baseDir, display.contentCenterX, display.contentCenterY )
	tex:releaseSelf()
else
	print( "Error rendering SVG" )
end
``````
