# onDemandResources.setPreservationPriority()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, setPreservationPriority
> __See also__          [onDemandResources.request()][plugin.onDemandResources.request]
>                       [onDemandResources.getPreservationPriority()][plugin.onDemandResources.getPreservationPriority]
>                       [onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

You can influence the system's eviction process via preservation priority. The system will evict resources with lower preservation priority first.

This function allows you to set the preservation priority for a specified tag.


## Syntax

    onDemandResources.setPreservationPriority( tag, priority )

##### tag ~^(required)^~
_[String][api.type.String]._ Tag for which to set the preservation priority.

##### priority ~^(required)^~
_[Number][api.type.Number]._ Number in the range of `0.0` to `1.0` where `1.0` is the highest preservation priority.
