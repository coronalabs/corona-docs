# object.supportsCapture()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, VideoCapabilities, supportsCapture
> __See also__          [VideoCapabilities][plugin.gpgs.videos.type.VideoCapabilities]
>						[gpgs.videos][plugin.gpgs.videos]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Checks if the capture mode and/or quality level are supported given the availability/state of the device's <nobr>front-facing</nobr> camera, microphone, and storage write. Returns `true` if capture is supported.

## Syntax

	object.supportsCapture( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### mode ~^(optional)^~
_[String][api.type.String]._ Checks whether the device supports the given capture mode. Valid options are either `"file"` or `"stream"`.

##### quality ~^(optional)^~
_[String][api.type.String]._ Checks whether the device supports the given quality level. Valid options are `"sd"`, `"hd"`, `"fullhd"`, or `"xhd"`.
