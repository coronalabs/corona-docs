# iCloud.recordCreateZone()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, recordCreateZone
> __See also__          [iCloud.recordCreate()][plugin.iCloud.recordCreate]
>						[iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

In order to group records by zones, you must first create a zone using this function. Results will be passed to an optional `onComplete` listener function as an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent].


## Syntax

    iCloud.recordCreateZone( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `zoneName` &mdash; Required [string][api.type.String] value indicating the zone name.

* `zoneOwner` &mdash; Optional [string][api.type.String] value indicating the zone's owner.

* `database` &mdash; Optional [string][api.type.String] value. If this string is `"public"`, the public database will be used instead of a private database. Records in the public database can be accessed/shared by other users.

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container. Do not pass this parameter if you have only one iCloud Container associated with your app.

* `onComplete` &mdash; Optional [listener][api.type.Listener] function to be invoked with an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent].
