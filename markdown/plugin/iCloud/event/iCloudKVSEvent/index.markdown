# iCloudKVSEvent

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, Key-Value Storage, KVS, iCloudKVSEvent
> __See also__          [iCloud.setKVSListener()][plugin.iCloud.setKVSListener]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

When Key-Value Storage is changed externally (on another device) or when an error occurs, this event will be dispatched to the listener function set in [iCloud.setKVSListener()][plugin.iCloud.setKVSListener]. The event will include the properties listed below.


## Properties

#### [event.name][plugin.iCloud.event.iCloudKVSEvent.name]

#### [event.type][plugin.iCloud.event.iCloudKVSEvent.type]

#### [event.isError][plugin.iCloud.event.iCloudKVSEvent.isError]

#### [event.keys][plugin.iCloud.event.iCloudKVSEvent.keys]
