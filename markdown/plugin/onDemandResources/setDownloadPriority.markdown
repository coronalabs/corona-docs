# onDemandResources.setDownloadPriority()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, setDownloadPriority
> __See also__          [onDemandResources.request()][plugin.onDemandResources.request]
>                       [onDemandResources.getDownloadPriority()][plugin.onDemandResources.getDownloadPriority]
>                       [onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

If you want to download several resources (tags) at once, you can use this function to set the priority for which should be downloaded first.


## Syntax

	onDemandResources.setDownloadPriority( tag, priority )

##### tag ~^(required)^~
_[String][api.type.String]._ Tag for which to set the download priority.

##### priority ~^(required)^~
_[Number][api.type.Number] or [String][api.type.String]._ If passing a number, use a value in the range of `0.0` to `1.0` where `1.0` is the highest download priority <nobr>(following `"urgent"`)</nobr>. Passing the string `"urgent"` indicates the maximum download priority.


## Gotchas

Using a priority of `"urgent"` may cause a drop in frame rate. Generally, you should not set an urgent download priority during <nobr>time-critical</nobr> points.
