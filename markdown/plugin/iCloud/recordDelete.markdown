# iCloud.recordDelete()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, recordDelete
> __See also__          [iCloud.recordCreate()][plugin.iCloud.recordCreate]
>						[iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Deletes an existing record. Results will be passed to an optional `onComplete` listener function as an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent].


## Syntax

    iCloud.recordDelete( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `recordName` &mdash; Required [string][api.type.String] value representing the identifier for the record.

* `zoneName` &mdash; Optional [string][api.type.String] value indicating the record's zone name.

* `zoneOwner` &mdash; Optional [string][api.type.String] value indicating the record's zone owner.

* `database` &mdash; Optional [string][api.type.String] value indicating the record's database.

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container in which the record is contained. Do not pass this parameter if you have only one iCloud Container associated with your app.

* `onComplete` &mdash; Optional [listener][api.type.Listener] function to be invoked with an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent].


## Example

``````lua
iCloud.recordDelete(
	{
		recordName = "Corona Labs 1"
	}
)
``````
