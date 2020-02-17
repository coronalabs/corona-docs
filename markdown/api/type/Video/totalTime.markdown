# object.totalTime

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Video][api.type.Video]
> __Library__           [native.*][api.library.native]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          time, video
> __See also__          [native.newVideo()][api.library.native.newVideo]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The read-only length of the currently loaded video, in seconds.

## Gotchas

This should be called __after__ the video is ready to play, otherwise an inaccurate value might be returned. You can detect this via a [video event][api.event.video] where [event.phase][api.event.video.phase] is equal to `"ready"`.