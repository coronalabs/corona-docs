# object.write()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.snapshots.*][plugin.gpgs2.snapshots]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Write the specified data into the snapshot. The data will be persisted on disk, but is not uploaded to the server until the snapshot is saved.

Returns Boolean - `true` on success.

## Syntax

	object.write(payload)

##### payload ~^(optional)^~
_[String][api.type.String]._ The data replace the snapshot content with.