# iCloud.recordCreate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [CloudKitRecord][plugin.iCloud.type.CloudKitRecord]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, recordCreate
> __See also__          [iCloud.recordCreateZone()][plugin.iCloud.recordCreateZone]
>						[iCloud.recordDelete()][plugin.iCloud.recordDelete]
>						[CloudKitRecord][plugin.iCloud.type.CloudKitRecord]
>						[CloudKitRecord:save()][plugin.iCloud.type.CloudKitRecord.save]
>						[CloudKitRecord:set()][plugin.iCloud.type.CloudKitRecord.set]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates and returns a new [CloudKitRecord][plugin.iCloud.type.CloudKitRecord] object.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

The created object is __not__ stored in the CloudKit database. Use [CloudKitRecord:save()][plugin.iCloud.type.CloudKitRecord.save] to send it to the database.

</div>


## Syntax

	iCloud.recordCreate( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `type` &mdash; Required [string][api.type.String] value representing the record type in the CloudKit database. Records of the same type have the same properties, similar to a table in a relational database.

* `recordName` &mdash; Optional [string][api.type.String] value representing a specific identifier for the record. If not set, a unique identifier will be generated.

* `zoneName` &mdash; Optional [string][api.type.String] value indicating the record's zone name. You can use zones to group records, assuming the zone was created via [iCloud.recordCreateZone()][plugin.iCloud.recordCreateZone]. If not specified, the default zone is used.

* `zoneOwner` &mdash; Optional [string][api.type.String] value indicating the record's zone owner. If not specified, the default owner (current&nbsp;user) is used.

* `table` &mdash; Optional [table][api.type.Table] containing field names and values to initialize the record with. The value associated with each field is typically passed as a [table][api.type.Table] containing the required `type` key, along with associated keys outlined in the [CloudKitRecord:set()][plugin.iCloud.type.CloudKitRecord.set] documentation. However, [strings][api.type.String] and [numbers][api.type.Number] can be passed directly as a convenience method.


## Example

``````lua
local recordData = {
	-- String and number values can be passed directly (convenience method)
	company = "Corona Labs",
	amount = 1,
	-- Other value types must be passed as a table
	where = { type="location", latitude=37.453139, longitude=122.113451 }
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
