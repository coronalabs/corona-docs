# object:load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [Video][api.type.Video]
> __Library__           [native.*][api.library.native]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          load, video, video view, video overlay
> __See also__          [native.newVideo()][api.library.native.newVideo]<br/>[media.RemoteSource][api.library.media.RemoteSource]<br/>[system.CachesDirectory][api.library.system.CachesDirectory]<br/>[system.DocumentsDirectory][api.library.system.DocumentsDirectory]<br/>[system.TemporaryDirectory][api.library.system.TemporaryDirectory]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads a specified video. Use this in conjunction with [native.newVideo()][api.library.native.newVideo].


## Syntax

	object:load( path )
	object:load( path, baseSource )

##### path ~^(required)^~
_[String][api.type.String]._ The local filename or remote URL for the video.

##### baseSource ~^(optional)^~
_[Constant][api.type.Constant]._ Controls how `path` is interpreted. It can either be one of the system-defined directory constants, or [media.RemoteSource][api.library.media.RemoteSource] (use this to access video on a remote server).
