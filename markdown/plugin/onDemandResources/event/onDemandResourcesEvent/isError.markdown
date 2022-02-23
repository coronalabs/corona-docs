# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [onDemandResourcesEvent][plugin.onDemandResources.event.onDemandResourcesEvent]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, onDemandResourcesEvent, isError
> __See also__          [onDemandResourcesEvent][plugin.onDemandResources.event.onDemandResourcesEvent]
>						[onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Boolean][api.type.Boolean] value indicating whether an error occurred. If this field is `true`, the resources associated with [tag][plugin.onDemandResources.event.onDemandResourcesEvent.tag] are not available.

If this is received by the listener specified in [onDemandResources.setEventListener()][plugin.onDemandResources.setEventListener], its value will be `true` and the event [type][plugin.onDemandResources.event.onDemandResourcesEvent.type] will be `"lowDiskSpace"`.
