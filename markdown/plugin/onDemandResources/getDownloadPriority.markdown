# onDemandResources.getDownloadPriority()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, getDownloadPriority
> __See also__          [onDemandResources.request()][plugin.onDemandResources.request]
>                       [onDemandResources.setDownloadPriority()][plugin.onDemandResources.setDownloadPriority]
>                       [onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

If you are downloading several resources (tags) at once, you can use [onDemandResources.setDownloadPriority()][plugin.onDemandResources.setDownloadPriority] to manage which should be downloaded first.

This function returns the download priority ([number][api.type.Number]) for a specified tag in the range of `0.0` to `1.0` where `1.0` is the highest and the default download priority.


## Syntax

	onDemandResources.getDownloadPriority( tag )

##### tag ~^(required)^~
_[String][api.type.String]._ Tag for which to retrieve the download priority.
