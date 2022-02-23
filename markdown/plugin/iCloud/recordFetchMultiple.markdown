# iCloud.recordFetchMultiple()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, recordFetchMultiple
> __See also__          [iCloud.recordFetch()][plugin.iCloud.recordFetch]
>						[iCloud.recordQuery()][plugin.iCloud.recordQuery]
>						[iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves multiple records. <nobr>Per-record</nobr> results are passed to the `onRecord` listener function and final results are passed to the `onComplete` listener function, both as an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent].


## Syntax

    iCloud.recordFetchMultiple( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `recordNameArray` &mdash; Required [table][api.type.Table] containing either a list of record identifiers to fetch __or__ an array of [tables][api.type.Table] containing record identifiers and zone details. Pass this value as follows:

<div class="code-indent">

If zones are __not__ being used, simply pass this value as a list of record identifiers \([strings][api.type.String]\):

<div style="margin-top:-6px; margin-bottom:-10px;">

``````lua
recordNameArray = { "r1", "r2", "r3" }
``````

</div>

If zones are being used, pass this value as an array of [tables][api.type.Table] containing record identifiers and zone details:

<div style="margin-top:-6px; margin-bottom:-10px;">

``````lua
recordNameArray = {
	{ recordName="r1", zoneName="z1", zoneOwner="o1" },
	{ recordName="r2", zoneName="z2", zoneOwner="o2" }
}
``````

</div>
</div>

* `onComplete` &mdash; Required [listener][api.type.Listener] function to be invoked with an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent] for the overall fetch request.

* `onRecord` &mdash; Optional [listener][api.type.Listener] function to be invoked with an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent] for each record in the fetch request.

* `database` &mdash; Optional [string][api.type.String] value indicating the database.

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container in which the record is contained. Do not pass this parameter if you have only one iCloud Container associated with your app.


## Example

``````lua
-- Listener function to handle per-record events
local function recordFetched( event )

	print( event.record )      -- Specific fetched record
	print( event.isError )     -- Indicates whether an error occurred
	print( event.recordName )  -- If an error occurred, identifies the record involved
	print( event.error )       -- Description of the error which occurred, if any
end

-- Listener function to handle the overall fetch request
local function fetchResults( event )

	print( event.recordArray )  -- Array of successfully retrieved records
	print( event.isError )      -- Indicates whether an error occurred
	print( event.error )        -- Description of the error which occurred, if any
end

iCloud.recordFetchMultiple(
	{
		recordNameArray = { "r1", "r2", "r3" },
		onRecord = recordFetched,
		onComplete = fetchResults
	}
)
``````
