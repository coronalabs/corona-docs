# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [iCloudKVSEvent][plugin.iCloud.event.iCloudKVSEvent]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, Key-Value Storage, KVS, iCloudKVSEvent, type
> __See also__          [iCloudKVSEvent][plugin.iCloud.event.iCloudKVSEvent]
>						[iCloudKVSEvent.isError][plugin.iCloud.event.iCloudKVSEvent.isError]
>						[iCloudKVSEvent.keys][plugin.iCloud.event.iCloudKVSEvent.keys]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A [string][api.type.String] value indicating what happened in Key-Value Storage. This will be one of the values listed below.

For a table of specific keys affected, see the [iCloudKVSEvent.keys][plugin.iCloud.event.iCloudKVSEvent.keys] property.


## Values

* `"serverChange"` &mdash; A value changed in iCloud. This occurs when another device, running another instance of your app and attached to the same iCloud account, uploads a new value.

* `"initialSync"` &mdash; Your attempt to write to Key-Value Storage was discarded because an initial download from iCloud did not yet occur. In other words, before you can initially write <nobr>key-value</nobr> data, the system must ensure that your app's local <nobr>on-disk</nobr> cache matches the data in iCloud. Initial downloads occur the first time a device is connected to an iCloud account or when a user switches their primary iCloud account.

* `"quotaViolation"` &mdash; Your app's <nobr>key-value</nobr> storage amount has exceeded its quota on the iCloud server.

* `"accountChange"` &mdash; The user has changed the primary iCloud account. When this occurs, the keys and values in the local Key-Value Storage have been replaced with those from the new account.

* `"unknown"` &mdash; Some other occurrence (this should never happen).
