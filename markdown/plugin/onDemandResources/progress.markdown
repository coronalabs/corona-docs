# onDemandResources.progress()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, progress
> __See also__          [onDemandResources.request()][plugin.onDemandResources.request]
>                       [onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the progress of the currently downloading resources (by&nbsp;tag) as a number between `0` (0%) and `1` (100%). Also provides information about the total size and how much is completed, although this data is not necessarily reliable.


## Gotchas

You will only get valid progress data after you've [requested][plugin.onDemandResources.request] an <nobr>on-demand</nobr> resources download.


## Syntax

	onDemandResources.progress( tag )

##### tag ~^(required)^~
_[String][api.type.String]._ Tag for which to fetch the progress values.


## Example

``````lua
local progress, totalSize, amountComplete = onDemandResources.progress( "imgL1" )
``````