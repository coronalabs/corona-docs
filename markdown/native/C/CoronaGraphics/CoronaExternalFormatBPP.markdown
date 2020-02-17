# CoronaExternalFormatBPP()

> --------------------- ------------------------------------------------------------------------------------------
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iOS, CORONA_NATIVE_PRODUCT, C, CoronaGraphics.h, CoronaExternalFormatBPP
> __See also__			[CoronaGraphics.h][native.C.CoronaGraphics]
>						[Corona C Functions][native.C]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Helper function which returns the number of <nobr>bytes-per-pixel</nobr> (BPP) that the given bitmap format has. For example, this function will return `4` for a `kExternalBitmapFormat_RGBA` format, `3` for a `kExternalBitmapFormat_RGB` format, and `1` for a `kExternalBitmapFormat_Mask` format.


## Syntax

``````c
int CoronaExternalFormatBPP( CoronaExternalBitmapFormat format )
``````

##### format
The pixel format to be queried for how many <nobr>bytes-per-pixel</nobr> it has.
