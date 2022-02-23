# onDemandResources.getPreservationPriority()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, getPreservationPriority
> __See also__          [onDemandResources.request()][plugin.onDemandResources.request]
>                       [onDemandResources.setPreservationPriority()][plugin.onDemandResources.setPreservationPriority]
>                       [onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

You can influence the system's eviction process via preservation priority. The system will evict resources with lower preservation priority first.

This function returns the preservation priority ([number][api.type.Number]) for a specified tag in the range of `0.0` to `1.0` where `1.0` is the highest and the default preservation priority.


## Syntax

	onDemandResources.getPreservationPriority( tag )

##### tag ~^(required)^~
_[String][api.type.String]._ Tag for which to retrieve the preservation priority.
