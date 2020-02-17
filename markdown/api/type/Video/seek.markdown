# object:seek()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Video][api.type.Video]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          seek, video, video view, video overlay
> __See also__          [native.newVideo()][api.library.native.newVideo]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Seeks and jumps to the specified time in the currently loaded video. Use this in conjunction with [native.newVideo()][api.library.native.newVideo].

## Syntax

	object:seek( timeInSeconds )

##### timeInSeconds ~^(required)^~
_[Number][api.type.Number]._ Jumps to specified time in currently loaded video. Ensure that this is not greater than the [object.totalTime][api.type.Video.totalTime] property.