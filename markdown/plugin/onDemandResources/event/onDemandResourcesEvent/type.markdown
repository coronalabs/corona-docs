# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [onDemandResourcesEvent][plugin.onDemandResources.event.onDemandResourcesEvent]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          on-demand resources, onDemandResources, onDemandResourcesEvent, type
> __See also__          [onDemandResourcesEvent][plugin.onDemandResources.event.onDemandResourcesEvent]
>						[onDemandResources.*][plugin.onDemandResources]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

If the event is dispatched to a listener function within a [onDemandResources.request()][plugin.onDemandResources.request] call, this value will be `"complete"`, indicating that the resources request attempt is complete. At this time, you may check the [isError][plugin.onDemandResources.event.onDemandResourcesEvent.isError] property to confirm that the request succeeded.

If this is received by the listener specified in [onDemandResources.setEventListener()][plugin.onDemandResources.setEventListener], its value will be `"lowDiskSpace"`, indicating that the system is running low on storage space.
