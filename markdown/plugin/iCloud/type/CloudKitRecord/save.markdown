# CloudKitRecord:save()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [CloudKitRecord][plugin.iCloud.type.CloudKitRecord]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, CloudKitRecord, save
> __See also__          [CloudKitRecord][plugin.iCloud.type.CloudKitRecord]
>                       [CloudKitRecord:set()][plugin.iCloud.type.CloudKitRecord.set]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Saves contents of the record to the CloudKit database.


## Syntax

	CloudKitRecord:save( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table with <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `database` &mdash; Optional [string][api.type.String] value. If this string is `"public"`, the public database will be used instead of a private database. Records in the public database can be accessed/shared by other users.

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container. Do not pass this parameter if you have only one iCloud Container associated with your app.

* `onComplete` &mdash; Optional [listener][api.type.Listener] function to be invoked with an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent].


## Example

``````lua
local recordData = {
	company = { type="string", string="Corona Labs" },
	when = { type="date", time=-1449201382 },
	where = { type="location", latitude=37.453139, longitude=122.113451 },
	amount = { type="number", number=1 }
}

local record = iCloud.recordCreate(
	{
		type = "company",
		recordName = "Corona Labs 1",
		table = recordData
	}
)

record:save()
``````
