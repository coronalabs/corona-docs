# Image Effects — Filters, Generators, Composites

In Solar2D, visual effects can be applied to display objects with unprecedented ease. This guide contains a list of all <nobr>built-in</nobr> shader effects. Alternatively, to create your own custom effects, please refer to the [Custom Shader Effects][guide.graphics.customEffects] guide.

<div class="guides-toc">

* [Filter Effects](#filter)
* [Generator Effects](#generator)
* [Composite Effects](#composite)
* [Device-Specific Limitations](#support)

</div>


<style>

.side-by-side {
	margin: 12px 0px 20px 20px;
	font-size: 125%;
	color: #292929;
	vertical-align: middle;
	float: right;
}

.side-by-side table, .side-by-side td {
	padding: 0px;
	margin: 0px;
	border-collapse: collapse;
	border: 0px;
}

.side-by-side img {
	max-width: 160px;
}

.side-by-side td {
	min-width: 32px;
	text-align: center;
}

</style>


<div class="guide-notebox">
<div class="notebox-title">Note</div>

In addition to the built-in shader effects below, you can write/implement custom effects. Please see the [Custom Shader Effects][guide.graphics.customEffects] guide for details.

</div>


<!--- FILTER EFFECTS -->
<a id="filter"></a>

## Filter Effects

Filter effects operate on a single texture/image, specified by the filter name (string) as the `effect` property of `object.fill` or `object.stroke`:

	object.fill.effect = "[filter]"
	object.stroke.effect = "[filter]"

Most filters can be adjusted via optional parameters. These parameters, and the acceptable values, vary for each specific filter as defined below.

Filter parameters can be explicitly set after the filter is applied, or even over the course of a gradual transition. For example:

``````lua
-- Set a "sepia" filter with a non-default intensity
object.fill.effect = "filter.sepia"
object.fill.effect.intensity = 0.2

-- Transition the filter to full intensity over the course of 2 seconds
transition.to( object.fill.effect, { time=2000, intensity=1 } )
``````


<!--- FILTER.BLOOM -->

<a id="bloom"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-bloom]
----------------------------------------	------------------	----------------------------------------

</div>

### filter.bloom

Renders fringes of light which extend from the borders of bright areas in an image, giving the illusion of an extremely bright light overwhelming the view.

* `levels.white` — default = `0.843` ; min = `0` ; max = `1`
* `levels.black` — default = `0.565` ; min = `0` ; max = `1`
* `levels.gamma` — default = `1` ; min = `0` ; max = `1`
* `add.alpha` — default = `1` ; min = `0` ; max = `1`
* `blur.horizontal.blurSize` — default = `8` ; min = `2` ; max = `512`
* `blur.horizontal.sigma` — default = `128` ; min = `2` ; max = `512`
* `blur.vertical.blurSize` — default = `8` ; min = `2` ; max = `512`
* `blur.vertical.sigma` — default = `128` ; min = `2` ; max = `512`

``````lua
object.fill.effect = "filter.bloom"

object.fill.effect.levels.white = 0.8
object.fill.effect.levels.black = 0.4
object.fill.effect.levels.gamma = 1
object.fill.effect.add.alpha = 0.8
object.fill.effect.blur.horizontal.blurSize = 20
object.fill.effect.blur.horizontal.sigma = 140
object.fill.effect.blur.vertical.blurSize = 20
object.fill.effect.blur.vertical.sigma = 240
``````


<!--- FILTER.BLUR -->

<a id="blur"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------
![][images.simulator.fx-base-statue]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-blur]
----------------------------------------	------------------	----------------------------------------

</div>

### filter.blur

``````lua
object.fill.effect = "filter.blur"
``````


<!--- FILTER.BLUR-GAUSSIAN -->

<a id="blurGaussian"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------
![][images.simulator.fx-base-statue]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-blurgaussian]
----------------------------------------	------------------	----------------------------------------

</div>

### filter.blurGaussian

* `horizontal.blurSize` — default = `8` ; min = `2` ; max = `512`
* `horizontal.sigma` — default = `128` ; min = `2` ; max = `512`
* `vertical.blurSize` — default = `8` ; min = `2` ; max = `512`
* `vertical.sigma` — default = `128` ; min = `2` ; max = `512`

``````lua
object.fill.effect = "filter.blurGaussian"

object.fill.effect.horizontal.blurSize = 20
object.fill.effect.horizontal.sigma = 140
object.fill.effect.vertical.blurSize = 20
object.fill.effect.vertical.sigma = 140
``````


<!--- FILTER.BLUR-GAUSSIAN-LINEAR -->

<a id="blurGaussianLinear"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	------------------------------------
![][images.simulator.fx-base-statue]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-blurlinear]
----------------------------------------	------------------	------------------------------------

</div>

### filter.blurGaussianLinear

A lightweight approach to Gaussian blur, as described in [this RasterGrid article](https://www.rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/).

* `horizontal.offset1` — default = `1.3846153846` ; min = `0` ; max = `100`
* `horizontal.offset2` — default = `3.2307692308` ; min = `0` ; max = `100`
* `vertical.offset1` — default = `1.3846153846` ; min = `0` ; max = `100`
* `vertical.offset2` — default = `3.2307692308` ; min = `0` ; max = `100`

``````lua
object.fill.effect = "filter.blurGaussianLinear"
``````


<!--- FILTER.BLUR-GAUSSIAN-LINEAR-HORIZONTAL -->

<a id="blurGaussianLinearHorizontal"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-blurlinearhorizontal]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.blurGaussianLinearHorizontal

* `offset1` — default = `1.3846153846` ; min = `0` ; max = `100`
* `offset2` — default = `3.2307692308` ; min = `0` ; max = `100`

``````lua
object.fill.effect = "filter.blurGaussianLinearHorizontal"
``````


<!--- FILTER.BLUR-GAUSSIAN-LINEAR-VERTICAL -->

<a id="blurGaussianLinearVertical"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	--------------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-blurlinearvertical]
----------------------------------------	------------------	--------------------------------------------

</div>

### filter.blurGaussianLinearVertical

* `offset1` — default = `1.3846153846` ; min = `0` ; max = `100`
* `offset2` — default = `3.2307692308` ; min = `0` ; max = `100`

``````lua
object.fill.effect = "filter.blurGaussianLinearVertical"
``````


<!--- FILTER.BLUR-HORIZONTAL -->

<a id="blurHorizontal"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-blurhorizontal]
----------------------------------------	------------------	----------------------------------------

### filter.blurHorizontal

* `blurSize` — default = `8` ; min = `2` ; max = `512`
* `sigma` — default = `128` ; min = `2` ; max = `512`

``````lua
object.fill.effect = "filter.blurHorizontal"

object.fill.effect.blurSize = 20
object.fill.effect.sigma = 140
``````


<!--- FILTER.BLUR-VERTICAL -->

<a id="blurVertical"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-blurvertical]
----------------------------------------	------------------	----------------------------------------

</div>

### filter.blurVertical

* `blurSize` — default = `8` ; min = `2` ; max = `512`
* `sigma` — default = `128` ; min = `2` ; max = `512`

``````lua
object.fill.effect = "filter.blurVertical"

object.fill.effect.blurSize = 20
object.fill.effect.sigma = 140
``````


<!--- FILTER.BRIGHTNESS -->

<a id="brightness"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-brightness]
----------------------------------------	------------------	----------------------------------------

</div>

### filter.brightness

* `intensity` — default = `0` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.brightness"

object.fill.effect.intensity = 0.4
``````


<!--- FILTER.BULGE -->

<a id="bulge"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------
![][images.simulator.fx-base-church]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-bulge]
----------------------------------------	------------------	----------------------------------------

</div>

### filter.bulge

Provides the illusion of lens bulging by altering eye-ray direction. Intensity of less than `1` makes the effect bulge inward (concave). Intensity greater than `1` makes the effect bulge outward (convex).

* `intensity` — default = `1` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "filter.bulge"

object.fill.effect.intensity = 1.8
``````


<!--- FILTER.CHROMA-KEY -->

<a id="chromaKey"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-chromakey]
----------------------------------------	------------------	----------------------------------------

</div>

### filter.chromaKey

* `sensitivity` — default = `0.4` ; min = `0` ; max = `1`
* `smoothing` — default = `0.1` ; min = `0` ; max = `1`
* `color` — default = `{1,1,1,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`

``````lua
object.fill.effect = "filter.chromaKey"

object.fill.effect.sensitivity = 0.1
object.fill.effect.smoothing = 0.3
object.fill.effect.color = { 0.2, 0.2, 0.2, 1 }
``````


<!--- FILTER.COLOR-CHANNEL-OFFSET -->

<a id="colorChannelOffset"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-colorchanneloffset]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.colorChannelOffset

* `xTexels` — default = `8` ; min = `0` ; max = (none)
* `yTexels` — default = `8` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "filter.colorChannelOffset"

object.fill.effect.xTexels = 16
object.fill.effect.yTexels = 16
``````


<!--- FILTER.COLOR-MATRIX -->

<a id="colorMatrix"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-colormatrix]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.colorMatrix

Multiplies a source color and adds an offset (bias) to each color component of an image.

* `coefficients` — a 4&times;4 matrix of RGB+A coefficients.
* `bias` — default = `{0,0,0,0}` ; min = `{-1,-1,-1,-1}` ; max = `{1,1,1,1}`

``````lua
object.fill.effect = "filter.colorMatrix"

object.fill.effect.coefficients =
{
	1, 0, 0, 0,  --red coefficients
	0, 1, 0, 0,  --green coefficients
	0, 0, 1, 0,  --blue coefficients
	0, 0, 0, 1   --alpha coefficients
}
object.fill.effect.bias = { 0.6, 0.1, 0, 0 }
``````


<!--- FILTER.COLOR-POLYNOMIAL -->

<a id="colorPolynomial"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-colorpolynomial]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.colorPolynomial

Applies a set of cubic polynomials to an image.

* `coefficients` — a 4&times;4 matrix of RGB+A coefficients.

``````lua
object.fill.effect = "filter.colorPolynomial"

object.fill.effect.coefficients =
{
	0, 0, 1, 0,  --red coefficients
	0, 0, 1, 0,  --green coefficients
	0, 1, 0, 0,  --blue coefficients
	0, 0, 0, 1   --alpha coefficients
}
``````


<!--- FILTER.CONTRAST -->

<a id="contrast"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-contrast]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.contrast

* `contrast` — default = `1` ; min = `0` ; max = `4`

``````lua
object.fill.effect = "filter.contrast"

object.fill.effect.contrast = 2
``````


<!--- FILTER.CROSSHATCH -->

<a id="crosshatch"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-crosshatch]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.crosshatch

* `grain` — default = `0` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "filter.crosshatch"

object.fill.effect.grain = 4
``````


<!--- FILTER.CRYSTALLIZE -->

<a id="crystallize"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-statue]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-crystallize]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.crystallize

* `numTiles` — default = `16` ; min = `2` ; max = (none)

``````lua
object.fill.effect = "filter.crystallize"

object.fill.effect.numTiles = 32
``````


<!--- FILTER.DESATURATE -->

<a id="desaturate"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-desaturate]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.desaturate

* `intensity` — default = `0.5` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.desaturate"

object.fill.effect.intensity = 0.5
``````


<!--- FILTER.DISSOLVE -->

<a id="dissolve"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-dissolve]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.dissolve

* `threshold` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.dissolve"

object.fill.effect.threshold = 0.6
``````


<!--- FILTER.DUOTONE -->

<a id="duotone"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-flower-gray]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-duotone]
--------------------------------------------	------------------	----------------------------------------------

</div>

### filter.duotone

Increases the tonal range of a grayscale image by using different colors to reproduce distinct gray levels.

* `darkColor` — default = `{0,0,0.5,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `lightColor` — default = `{1,0,0,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`

``````lua
object.fill.effect = "filter.duotone"

object.fill.effect.darkColor = { 0.7, 0.3, 0.3, 1 }
object.fill.effect.lightColor = { 1, 0.6, 0.4, 1 }
``````


<!--- FILTER.EMBOSS -->

<a id="emboss"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-emboss]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.emboss

* `intensity` — default = `1` ; min = `0` ; max = `4`

``````lua
object.fill.effect = "filter.emboss"

object.fill.effect.intensity = 0.2
``````


<!--- FILTER.EXPOSURE -->

<a id="exposure"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-exposure]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.exposure

* `exposure` — default = `0` ; min = `-10` ; max = `10`

``````lua
object.fill.effect = "filter.exposure"

object.fill.effect.exposure = 1.2
``````


<!--- FILTER.FROSTED-GLASS -->

<a id="frostedGlass"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-frostedglass]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.frostedGlass

* `scale` — default = `64` ; min = `1` ; max = (none)

``````lua
object.fill.effect = "filter.frostedGlass"

object.fill.effect.scale = 140
``````


<!--- FILTER.GRAYSCALE -->

<a id="grayscale"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-flower]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-grayscale]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.grayscale

``````lua
object.fill.effect = "filter.grayscale"
``````


<!--- FILTER.HUE -->

<a id="hue"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-hue]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.hue

* `angle` — default = `0` ; min = `0` ; max = `360`

``````lua
object.fill.effect = "filter.hue"

object.fill.effect.angle = 200
``````


<!--- FILTER.INVERT -->

<a id="invert"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-invert]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.invert

``````lua
object.fill.effect = "filter.invert"
``````


<!--- FILTER.IRIS -->

<a id="iris"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-iris]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.iris

* `center` — default = `{0.5,0.5}` ; min = `{0,0}` ; max = `{1,1}`
* `aperture` — default = `0` ; min = `0` (closed) ; max = `1` (open)
* `aspectRatio` — default = `1` ; min = `0` ; max = (none)
* `smoothness` — default = `0` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.iris"

object.fill.effect.center = { 0.5, 0.5 }
object.fill.effect.aperture = 0.5
object.fill.effect.aspectRatio = ( object.width / object.height )
object.fill.effect.smoothness = 0.5
``````


<!--- FILTER.LEVELS -->

<a id="levels"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-statue]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-levels]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.levels

* `white` — default = `0.843` ; min = `0` ; max = `1`
* `black` — default = `0.565` ; min = `0` ; max = `1`
* `gamma` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.levels"

object.fill.effect.white = 0.5
object.fill.effect.black = 0.1
object.fill.effect.gamma = 1
``````


<!--- FILTER.LINEAR-WIPE -->

<a id="linearWipe"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-linearwipe]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.linearWipe

* `direction` — default = `{1,0}` ; min = `{-1,-1}` ; max = `{1,1}`
* `smoothness` — default = `0` ; min = `0` ; max = `1`
* `progress` — default = `0` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.linearWipe"

object.fill.effect.direction = { 1, 1 }
object.fill.effect.smoothness = 1
object.fill.effect.progress = 0.5
``````


<!--- FILTER.MEDIAN -->

<a id="median"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-median]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.median

``````lua
object.fill.effect = "filter.median"
``````


<!--- FILTER.MONOTONE -->

<a id="monotone"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-monotone]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.monotone

* `r` — default = `0` ; min = `0` ; max = `1`
* `g` — default = `0` ; min = `0` ; max = `1`
* `b` — default = `0` ; min = `0` ; max = `1`
* `a` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.monotone"

object.fill.effect.r = 1
object.fill.effect.g = 0.2
object.fill.effect.b = 0.5
object.fill.effect.a = 0.5
``````


<!--- FILTER.OP-TILE -->

<a id="opTile"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-flower]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-optile]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.opTile

* `numPixels` — default = `8` ; min = `0` ; max = (none)
* `angle` — default = `0` ; min = `0` ; max = `360`
* `scale` — default = `2.8` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "filter.opTile"

object.fill.effect.numPixels = 4
object.fill.effect.angle = 0
object.fill.effect.scale = 3
``````


<!--- FILTER.PIXELATE -->

<a id="pixelate"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-statue]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-pixelate]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.pixelate

* `numPixels` — default = `4` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "filter.pixelate"

object.fill.effect.numPixels = 4
``````


<!--- FILTER.POLKA-DOTS -->

<a id="polkaDots"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-polkadots]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.polkaDots

* `numPixels` — default = `4` ; min = `4` ; max = (none)
* `dotRadius` — default = `1` ; min = `0` ; max = `1`
* `aspectRatio` — default = `1` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "filter.polkaDots"

object.fill.effect.numPixels = 16
object.fill.effect.dotRadius = 1
object.fill.effect.aspectRatio = ( object.width / object.height )
``````


<!--- FILTER.POSTERIZE -->

<a id="posterize"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-posterize]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.posterize

* `colorsPerChannel` — default = `4` ; min = `2` ; max = (none)

``````lua
object.fill.effect = "filter.posterize"

object.fill.effect.colorsPerChannel = 6
``````


<!--- FILTER.RADIAL-WIPE -->

<a id="radialWipe"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-radialwipe]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.radialWipe

* `center` — default = `{0.5,0.5}` ; min = `{-1,-1}` ; max = `{1,1}`
* `smoothness` — default = `0` ; min = `0` ; max = `1`
* `axisOrientation` — default = `0` ; min = `0` ; max = `1`
* `progress` — default = `0` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.radialWipe"

object.fill.effect.center = { 0.3, 0.5 }
object.fill.effect.smoothness = 1
object.fill.effect.axisOrientation = 0
object.fill.effect.progress = 0.5
``````


<!--- FILTER.SATURATE -->

<a id="saturate"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-flower]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-saturate]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.saturate

* `intensity` — default = `1` ; min = `0` ; max = `8`

``````lua
object.fill.effect = "filter.saturate"

object.fill.effect.intensity = 4
``````


<!--- FILTER.SCATTER -->

<a id="scatter"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-scatter]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.scatter

* `intensity` — default = `0.5` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "filter.scatter"

object.fill.effect.intensity = 0.5
``````


<!--- FILTER.SEPIA -->

<a id="sepia"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-statue]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-sepia]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.sepia

* `intensity` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.sepia"

object.fill.effect.intensity = 1
``````


<!--- FILTER.SHARPEN-LUMINANCE -->

<a id="sharpenLuminance"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-sharpenluminance]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.sharpenLuminance

* `sharpness` — default = `0` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.sharpenLuminance"

object.fill.effect.sharpness = 1
``````


<!--- FILTER.SOBEL -->

<a id="sobel"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-ocean]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-sobel]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.sobel

``````lua
object.fill.effect = "filter.sobel"
``````


<!--- FILTER.STRAIGHTEN -->

<a id="straighten"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-straighten]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.straighten

* `width` — default = `1` ; min = `1` ; max = (none)
* `height` — default = `1` ; min = `1` ; max = (none)
* `angle` — default = `0` ; min = `0` ; max = `360`

``````lua
object.fill.effect = "filter.straighten"

object.fill.effect.width = 10
object.fill.effect.height = 40
object.fill.effect.angle = 20
``````


<!--- FILTER.SWIRL -->

<a id="swirl"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-statue]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-swirl]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.swirl

* `intensity` — default = `0` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "filter.swirl"

object.fill.effect.intensity = 0.4
``````


<!--- FILTER.VIGNETTE -->

<a id="vignette"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-vignette]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.vignette

* `radius` — default = `0.1` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.vignette"

object.fill.effect.radius = 0.1
``````


<!--- FILTER.VIGNETTE-MASK -->

<a id="vignetteMask"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-vignettemask]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.vignetteMask

* `innerRadius` — default = `0.8` ; min = `0` ; max = `1`
* `outerRadius` — default = `0.25` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.vignetteMask"

object.fill.effect.innerRadius = 0.7
object.fill.effect.outerRadius = 0.1
``````


<!--- FILTER.WOBBLE -->

<a id="wobble"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-flower]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-wobble]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.wobble

* `amplitude` — default = `10` ; min = (none) ; max = (none)

``````lua
object.fill.effect = "filter.wobble"

object.fill.effect.amplitude = 80
``````


<!--- FILTER.WOOD-CUT -->

<a id="woodCut"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-woodcut]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.woodCut

* `intensity` — default = `0.5` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.woodCut"

object.fill.effect.intensity = 0.4
``````


<!--- FILTER.ZOOM-BLUR -->

<a id="zoomBlur"></a>
<div class="newline"></div>

<div class="side-by-side">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-cloth]			&nbsp;&rarr;&nbsp;	![][images.simulator.fx-zoomblur]
----------------------------------------	------------------	----------------------------------------------

</div>

### filter.zoomBlur

* `u` (horizontal origin) — default = `0.5` ; min = `0` ; max = `1`
* `v` (vertical origin) — default = `0.5` ; min = `0` ; max = `1`
* `intensity` — default = `0.5` ; min = `0` ; max = `1`

``````lua
object.fill.effect = "filter.zoomBlur"

object.fill.effect.u = 0.5
object.fill.effect.v = 0.5
object.fill.effect.intensity = 0.3
``````



<!--- GENERATOR EFFECTS -->
<div class="newline"></div>
<a id="generator"></a>

## Generator Effects

Generator effects are procedurally-generated effects which don't operate on any textures/images. Instead, they generate textures in the fragment shader.

Like filters, generators are specified by the effect name (string) as the `effect` property of `object.fill` or `object.stroke`:

	object.fill.effect = "[generator]"
	object.stroke.effect = "[generator]"

Most generators can be adjusted via optional parameters. These parameters, and the acceptable values, vary for each specific generator as defined below.

``````lua
-- Apply a "sunbeams" generator effect
object.fill.effect = "generator.sunbeams"
object.fill.effect.aspectRatio = ( object.width / object.height )
``````


<!--- GENERATOR.CHECKERBOARD -->

<a id="checkerboard"></a>
<div class="newline"></div>

<div class="side-by-side">

---------------------------------------------
![][images.simulator.fx-checkerboard]
---------------------------------------------

</div>

### generator.checkerboard

* `color1` — default = `{1,0,0,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `color2` — default = `{0,0,1,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `xStep` — default = `3` ; min = `1` ; max = (none)
* `yStep` — default = `3` ; min = `1` ; max = (none)

``````lua
object.fill.effect = "generator.checkerboard"

object.fill.effect.color1 = { 0.8, 0, 0.2, 1 }
object.fill.effect.color2 = { 0.2, 0.2, 0.2, 1 }
object.fill.effect.xStep = 8
object.fill.effect.yStep = 8
``````


<!--- GENERATOR.LENTICULAR-HALO -->

<a id="lenticularHalo"></a>
<div class="newline"></div>

<div class="side-by-side">

---------------------------------------------
![][images.simulator.fx-lenticularhalo]
---------------------------------------------

</div>

### generator.lenticularHalo

Renders a lenticular halo effect on an object. Although the sample image indicates otherwise, this effect is generated with a transparent alpha background. The `seed` parameter is used by the random algorithm and is provided as a means to vary the look of the halo.

* `posX` — default = `0.5` ; min = `0` ; max = `1`
* `posY` — default = `0.5` ; min = `0` ; max = `1`
* `aspectRatio` — default = `1` ; min = `0` ; max = (none)
* `seed` — default = `0` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "generator.lenticularHalo"

object.fill.effect.posX = 0.5
object.fill.effect.posY = 0.5
object.fill.effect.aspectRatio = ( object.width / object.height )
object.fill.effect.seed = 1
``````


<!--- GENERATOR.LINEAR-GRADIENT -->

<a id="linearGradient"></a>
<div class="newline"></div>

<div class="side-by-side">

---------------------------------------------
![][images.simulator.fx-lineargradient]
---------------------------------------------

</div>

### generator.linearGradient

* `color1` — default = `{1,0,0,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `position1` — default = `{0,0}` ; min = `{0,0}` ; max = `{1,1}`
* `color2` — default = `{0,0,1,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `position2` — default = `{1,1}` ; min = `{0,0}` ; max = `{1,1}`

``````lua
object.fill.effect = "generator.linearGradient"

object.fill.effect.color1 = { 0.8, 0, 0.2, 1 }
object.fill.effect.position1  = { 0, 0 }
object.fill.effect.color2 = { 0.2, 0.2, 0.2, 1 }
object.fill.effect.position2  = { 1, 1 }
``````


<!--- GENERATOR.MARCHING-ANTS -->

<a id="marchingAnts"></a>
<div class="newline"></div>

<div class="side-by-side">

---------------------------------------------
![][images.simulator.fx-marchingants]
---------------------------------------------

</div>

### generator.marchingAnts

``````lua
object.strokeWidth = 2
object.stroke.effect = "generator.marchingAnts"
``````


<!--- GENERATOR.PERLIN-NOISE -->

<a id="perlinNoise"></a>
<div class="newline"></div>

<div class="side-by-side">

---------------------------------------------
![][images.simulator.fx-perlinnoise]
---------------------------------------------

</div>

### generator.perlinNoise

* `color1` — default = `{1,0,0,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `color2` — default = `{0,0,1,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `scale` — default = `8` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "generator.perlinNoise"

object.fill.effect.color1 = { 0.9, 0.1, 0.3, 1 }
object.fill.effect.color2 = { 0.8, 0.8, 0.8, 1 }
object.fill.effect.scale = 12
``````


<!--- GENERATOR.RADIAL-GRADIENT -->

<a id="radialGradient"></a>
<div class="newline"></div>

<div class="side-by-side">

---------------------------------------------
![][images.simulator.fx-radialgradient]
---------------------------------------------

</div>

### generator.radialGradient

Renders a radial gradient on an object. The `center_and_radiuses` parameter is a table which specifies, in order, the center&nbsp;__x__, center&nbsp;__y__, inner radius, and outer radius.

* `color1` — default = `{1,0,0,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `color2` — default = `{0,0,1,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `center_and_radiuses` — default = `{0.5,0.5,0.125,0.25}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `aspectRatio` — default = `1` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "generator.radialGradient"

object.fill.effect.color1 = { 0.8, 0, 0.2, 1 }
object.fill.effect.color2 = { 0.2, 0.2, 0.2, 1 }
object.fill.effect.center_and_radiuses  =  { 0.5, 0.5, 0.25, 0.75 }
object.fill.effect.aspectRatio  = 1
``````


<!--- GENERATOR.RANDOM -->

<a id="random"></a>
<div class="newline"></div>

<div class="side-by-side">

---------------------------------------------
![][images.simulator.fx-random]
---------------------------------------------

</div>

### generator.random

``````lua
object.fill.effect = "generator.random"
``````


<!--- GENERATOR.STRIPES -->

<a id="stripes"></a>
<div class="newline"></div>

<div class="side-by-side">

---------------------------------------------
![][images.simulator.fx-stripes]
---------------------------------------------

</div>

### generator.stripes

Renders a stripe pattern on an object. The `periods` parameter is a table which specifies, in order, the width of the first stripe, width of the first empty space, width of the second stripe, and width of the second empty space. The `translation` parameter specifies the offset position of the pattern.

* `periods` — default = `{1,1,1,1}` ; min = `{0,0,0,0}`
* `angle` — default = `0` ; min = `0` ; max = `360`
* `translation` — default = `0` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "generator.stripes"

object.fill.effect.periods = { 8, 2, 4, 4 }
object.fill.effect.angle = 45
object.fill.effect.translation  = 0
``````


<!--- GENERATOR.SUNBEAMS -->

<a id="sunbeams"></a>
<div class="newline"></div>

<div class="side-by-side">

---------------------------------------------
![][images.simulator.fx-sunbeams]
---------------------------------------------

</div>

### generator.sunbeams

Renders a sunbeam effect on an object. Although the sample image indicates otherwise, this effect is generated with a transparent alpha background. The `seed` parameter is used by the random algorithm and is provided as a means to vary the look of the sunbeam.

* `posX` — default = `0.5` ; min = `0` ; max = `1`
* `posY` — default = `0.5` ; min = `0` ; max = `1`
* `aspectRatio` — default = `1` ; min = `0` ; max = (none)
* `seed` — default = `0` ; min = `0` ; max = (none)

``````lua
object.fill.effect = "generator.sunbeams"

object.fill.effect.posX = 0.5
object.fill.effect.posY = 0.5
object.fill.effect.aspectRatio = ( object.width / object.height )
object.fill.effect.seed = 0
``````



<!--- COMPOSITE EFFECTS -->
<div class="newline"></div>
<a id="composite"></a>

## Composite Effects

Composite effects operate on __two__ textures/images, combined together as a composite paint. Once defined, this composite paint can be used to [fill/stroke][guide.graphics.path] an object and apply a composite blend effect. A composite paint can consist of two distinct textures/images or the same texture/image upon itself, depending on the effect you want to achieve.

<div class="side-by-side" style="margin-top: 3px;">

----------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church]		&nbsp;+&nbsp;		![][images.simulator.fx-base-texture]
----------------------------------------	------------------	----------------------------------------------

</div>

``````lua
-- Create the object
local object = display.newRect( 100, 100, 160, 160 )

-- Set up the composite paint (distinct images)
local compositePaint = {
	type="composite",
	paint1={ type="image", filename="image01.png" },
	paint2={ type="image", filename="texture.png" }
}

-- Apply the composite paint as the object's fill
object.fill = compositePaint

-- Set a composite blend as the fill effect
object.fill.effect = "composite.add"
``````


<!--- COMPOSITE.ADD -->

<a id="add"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-add]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.add

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.add"

object.fill.alpha = 1
``````


<!--- COMPOSITE.AVERAGE -->

<a id="average"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-average]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.average

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.average"

object.fill.alpha = 1
``````


<!--- COMPOSITE.COLOR-BURN -->

<a id="colorBurn"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-colorburn]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.colorBurn

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.colorBurn"

object.fill.alpha = 1
``````


<!--- COMPOSITE.COLOR-DODGE -->

<a id="colorDodge"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-colordodge]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.colorDodge

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.colorDodge"

object.fill.alpha = 1
``````


<!--- COMPOSITE.DARKEN -->

<a id="darken"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-darken]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.darken

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.darken"

object.fill.alpha = 1
``````


<!--- COMPOSITE.DIFFERENCE -->

<a id="difference"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-difference]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.difference

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.difference"

object.fill.alpha = 1
``````


<!--- COMPOSITE.EXCLUSION -->

<a id="exclusion"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-exclusion]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.exclusion

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.exclusion"

object.fill.alpha = 0.4
``````


<!--- COMPOSITE.GLOW -->

<a id="glow"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-glow]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.glow

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.glow"

object.fill.alpha = 1
``````


<!--- COMPOSITE.HARD-LIGHT -->

<a id="hardLight"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-hardlight]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.hardLight

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.hardLight"

object.fill.alpha = 1
``````


<!--- COMPOSITE.HARD-MIX -->

<a id="hardMix"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-hardmix]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.hardMix

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.hardMix"

object.fill.alpha = 0.2
``````


<!--- COMPOSITE.LIGHTEN -->

<a id="lighten"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-lighten]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.lighten

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.lighten"

object.fill.alpha = 0.8
``````


<!--- COMPOSITE.LINEAR-LIGHT -->

<a id="linearLight"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-linearlight]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.linearLight

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.linearLight"

object.fill.alpha = 0.4
``````


<!--- COMPOSITE.MULTIPLY -->

<a id="multiply"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-multiply]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.multiply

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.multiply"

object.fill.alpha = 1
``````


<!--- COMPOSITE.NEGATION -->

<a id="negation"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-negation]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.negation

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.negation"

object.fill.alpha = 0.3
``````


<!--- COMPOSITE.NORMAL-MAP-WITH-1-DIR-LIGHT -->

<a id="normalMapWith1DirLight"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-mapdirlight]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.normalMapWith1DirLight

This composite effect renders a directional light upon a surface. In this effect, `dirLightDirection` is a table containing the light direction in texture space. The origin and the growth direction of each axis is the same as described for `pointLightPos` in [composite.normalMapWith1PointLight](#normalMapWith1PointLight). This direction vector indicates where the light is coming from, not the direction in which it's going. There's no need to normalize this vector as it's already done internally.

The `dirLightColor` parameter is a table containing RGB+A values, and `ambientLightIntensity` specifies the intensity.

* `dirLightDirection` — default = `{1,0,0}` ; min = `{0,0,0}` ; max = `{1,1,1}`
* `dirLightColor` — default = `{1,1,1,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `ambientLightIntensity` — default = `0` ; min = `0` ; max = (none)

``````lua
object.fill = compositePaint
object.fill.effect = "composite.normalMapWith1DirLight"

object.fill.effect.dirLightDirection = { 1, 0, 0 }
object.fill.effect.dirLightColor = { 0.3, 0.4, 1, 0.8 }
object.fill.effect.ambientLightIntensity = 1
``````


<!--- COMPOSITE.NORMAL-MAP-WITH-1-POINT-LIGHT -->

<a id="normalMapWith1PointLight"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-mappointlight]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.normalMapWith1PointLight

This composite effect renders a point light upon a surface. In this effect, `pointLightPos` is a table containing the light position in texture space. This `{x,y,z}` origin is the upper left corner `{0,0,0}`. Positive __x__ moves to the right, positive __y__ moves towards the bottom, and positive __z__ moves "out&nbsp;of&nbsp;the&nbsp;screen" towards the viewer, representing the distance from the surface. There's no maximum value for __z__, but typically this value will be between `0` and `1`.

The `pointLightColor` parameter is a table containing RGB+A values, and `ambientLightIntensity` specifies the intensity from `0` (dark) to `1` (full&nbsp;brightness).

The `attenuationFactors` parameter is a table containing the diffuse light's distance attenuation factors. In this case, `{x,y,z}` are the constant, linear, and quadratic attenuation factors. Note that distance attenuation does __not__ affect ambient light intensity. For a better understanding of attenuation factors, read about [Falloff](https://developer.valvesoftware.com/wiki/Constant-Linear-Quadratic_Falloff) and [Attenuation&nbsp;of&nbsp;Light](http://www.felixgers.de/teaching/jogl/lightAttenuation.html).

* `pointLightPos` — default = `{1,0,0}` ; min = `{0,0,0}` ; max = `{1,1,1}`
* `pointLightColor` — default = `{1,1,1,1}` ; min = `{0,0,0,0}` ; max = `{1,1,1,1}`
* `ambientLightIntensity` — default = `0` ; min = `0` ; max = (none)
* `attenuationFactors` — default = `{0.4,3,20}` ; min = `{0,0,0}`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.normalMapWith1PointLight"

object.fill.effect.pointLightPos = { 0, 1, 1 }
object.fill.effect.pointLightColor = { 1, 0.4, 0.5, 1 }
object.fill.effect.ambientLightIntensity = 1.2
object.fill.effect.attenuationFactors = { 0.4, 3, 0 }
``````


<!--- COMPOSITE.OVERLAY -->

<a id="overlay"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-overlay]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.overlay

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.overlay"

object.fill.alpha = 1
``````


<!--- COMPOSITE.PHOENIX -->

<a id="phoenix"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-phoenix]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.phoenix

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.phoenix"

object.fill.alpha = 0.5
``````


<!--- COMPOSITE.PIN-LIGHT -->

<a id="pinLight"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-pinlight]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.pinLight

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.pinLight"

object.fill.alpha = 1
``````


<!--- COMPOSITE.REFLECT -->

<a id="reflect"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-reflect]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.reflect

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.reflect"

object.fill.alpha = 1
``````


<!--- COMPOSITE.SCREEN -->

<a id="screen"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-screen]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.screen

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.screen"

object.fill.alpha = 1
``````


<!--- COMPOSITE.SOFT-LIGHT -->

<a id="softLight"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-softlight]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.softLight

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.softLight"

object.fill.alpha = 1
``````


<!--- COMPOSITE.SUBTRACT -->

<a id="subtract"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-subtract]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.subtract

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.subtract"

object.fill.alpha = 0.8
``````


<!--- COMPOSITE.VIVID-LIGHT -->

<a id="vividLight"></a>
<div class="newline"></div>

<div class="side-by-side">

--------------------------------------------	------------------	----------------------------------------------
![][images.simulator.fx-base-church-comp]		&nbsp;&rarr;&nbsp;	![][images.simulator.fx-vividlight]
--------------------------------------------	------------------	----------------------------------------------

</div>

### composite.vividLight

* `alpha` — default = `1` ; min = `0` ; max = `1`

``````lua
object.fill = compositePaint
object.fill.effect = "composite.vividLight"

object.fill.alpha = 1
``````


<div class="newline"></div><br />

<a id="support"></a>

## Device-Specific Limitations

### Hardware Support

The following visual effects require modern GPUs (Graphics&nbsp;Processing&nbsp;Units) and they may not function properly on all devices.

<span style="float: left; margin-right: 25px; margin-top: 0px;">

* [filter.crystallize](#crystallize)
* [filter.dissolve](#dissolve)
* [filter.frostedGlass](#frostedGlass)
* [filter.hue](#hue)
* [filter.scatter](#scatter)

</span>
<span style="float: left; margin-top: 0px; margin-bottom: 20px;">

* [generator.lenticularHalo](#lenticularHalo)
* [generator.perlinNoise](#perlinNoise)
* [generator.random](#random)
* [generator.sunbeams](#sunbeams)

</span>
<div style="clear: both;"></div>

To check the GPU capabilities of a device, test it via `system.getInfo( "gpuSupportsHighPrecisionFragmentShaders" )`:

``````lua
if ( system.getInfo( "gpuSupportsHighPrecisionFragmentShaders" ) ) then
	-- This device should support all effects
else
	-- This device may have problems with certain effects
end
``````

If the device supports <nobr>high-precision</nobr> fragment shaders, you can override the default shader precision for all OpenGL&nbsp;ES shaders as outlined [here][REFLINK 1].

<!--- REFERENCE LINK -->

[REFLINK 1]: ../../guide/basics/configSettings/index.html#shaderPrecision

### Rendering Execution

Certain parameters have a direct influence on the execution time of an effect. This applies to both the initial rendering __and__ any <nobr>re-execution</nobr> events. For example, if an object is moved/transitioned, the effects applied to it are <nobr>re-executed</nobr>. Thus, you should be careful when setting the parameters of an effect, especially those like `"filter.blurGaussian"`. If possible, we recommend that you test applicable projects on actual devices.