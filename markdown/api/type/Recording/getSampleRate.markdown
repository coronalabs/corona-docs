# object:getSampleRate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Recording][api.type.Recording]
> __Library__           [media.*][api.library.media]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          getSampleRate
> __See also__          [object:setSampleRate()][api.type.Recording.setSampleRate]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets the current audio recording sample rate.


## Syntax

	recording:getSampleRate()


## Example

``````lua
r:setSampleRate( rate )  -- request a new sampling rate
local actualRate = r:getSampleRate()
``````
