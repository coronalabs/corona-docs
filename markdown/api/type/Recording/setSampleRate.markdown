# object:setSampleRate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Recording][api.type.Recording]
> __Library__           [media.*][api.library.media]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setSampleRate
> __See also__          [object:getSampleRate()][api.type.Recording.getSampleRate]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Request an audio recording sample rate.

The recording sample rate defaults to `44100`. Not all platforms may support all rates. Valid rates are `8000`, `11025`, `16000`, `22050`, `44100`.

## Syntax

	Recording:setSampleRate( r )

##### r ~^(required)^~
_[Number][api.type.Number]._ Requested sampling rate. Different platforms support different rates; use [object:getSampleRate()][api.type.Recording.getSampleRate] to find out the actual sampling rate.

## Example

``````lua
r:setSampleRate( rate )  -- Request a new sampling rate
local actualRate = r:getSampleRate()
``````