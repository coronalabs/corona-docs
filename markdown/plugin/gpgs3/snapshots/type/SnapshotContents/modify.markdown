# object.modify()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.snapshots.*][plugin.gpgs3.snapshots]
>                       [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Overwrites the specified data into the snapshot with a specified offset. The contents of the snapshot will be replaced with the data provided in content. The data will be persisted on disk, but is not uploaded to the server until the snapshot is saved.

Returns Boolean - `true` on success.

## Syntax

	object.modify(data, offset)

##### data ~^(optional)^~
_[String][api.type.String]._ The data bytes to modify the snapshot content with.

##### offset ~^(optional)^~
_[Integer][api.type.Number]._ The position in content to start writing from.