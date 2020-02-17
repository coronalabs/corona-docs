# CoronaExternalBitmapFormat

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaGraphics.h, CoronaExternalBitmapFormat
> __See also__			[CoronaGraphics.h][native.C.CoronaGraphics]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Enumerated type describing the pixel format of the bitmap. Bitmap channels are <nobr>(from left to right)</nobr> MSB to LSB. Using RGBA as an example, A is in the <nobr>least-significant</nobr> 8 bits.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

RGBA format uses premultiplied alpha. This means that if the "raw" values of the channels are `r`, `g`, `b`, and `a`, the red channel will be `r*(a/255)`.

</div>


## Constants

This enum provides the following constants:

* `kExternalBitmapFormat_Undefined` &mdash; Defaults to `kExternalBitmapFormat_RGBA`.
* `kExternalBitmapFormat_Mask` &mdash; Alpha; 1 byte per pixel. Textures with bitmaps of this format can be used only as masks.
* `kExternalBitmapFormat_RGB` &mdash; RGB; 3 bytes per pixel.
* `kExternalBitmapFormat_RGBA` &mdash; RGBA; 4 bytes per pixel. RGB channels must be premultiplied with alpha.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* The width of `kExternalBitmapFormat_Mask` and `kExternalBitmapFormat_RGB` bitmaps must be a multiple of&nbsp;4. If the width is not a multiple of 4, the mask will create visual artifacts, and RGB will be treated as RGBA on Windows.

* When using `kExternalBitmapFormat_RGBA`, the red, green, and blue channels must have premultiplied alpha.

</div>
