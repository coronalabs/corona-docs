# object.supportsCapture()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.videos.*][plugin.gpgs2.videos]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Checks if the capture mode and quality level are support, and camera, mic, and storage write. Or just checks if only the capture mode or the quality level is supported on their own if only one paramater is supplied.

Returns Boolean - `true` if supported.

## Syntax

	object.supportsCapture(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### mode ~^(optional)^~
_[String][api.type.String]._ Checks whether the device supports the given capture mode.

##### quality ~^(optional)^~
_[String][api.type.String]._ Checks whether the device supports the given quality level.