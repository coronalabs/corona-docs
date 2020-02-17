# object:play()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Video][api.type.Video]
> __Library__           [native.*][api.library.native]
> __Return value__      None
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          play, video, video view, video overlay
> __See also__          [native.newVideo()][api.library.native.newVideo]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Plays the currently loaded video. Use this in conjunction with [native.newVideo()][api.library.native.newVideo].

## Gotchas

You can detect when a video is ready to play via a [video event][api.event.video] where [event.phase][api.event.video.phase] is equal to `"ready"`.

## Syntax

	object:play()