# iCloud.recordFetch()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, recordFetch
> __See also__          [iCloud.recordFetchMultiple()][plugin.iCloud.recordFetchMultiple]
>						[iCloud.recordQuery()][plugin.iCloud.recordQuery]
>						[iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves a single record and passes the results to the `onComplete` listener function as an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent].

To fetch multiple records in the same call, use [iCloud.recordFetchMultiple()][plugin.iCloud.recordFetchMultiple] instead.


## Syntax

    iCloud.recordFetch( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `recordName` &mdash; Required [string][api.type.String] value representing the identifier for the record.

* `onComplete` &mdash; Required [listener][api.type.Listener] function to be invoked with an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent].

* `zoneName` &mdash; Optional [string][api.type.String] value indicating the record's zone name.

* `zoneOwner` &mdash; Optional [string][api.type.String] value indicating the record's zone owner.

* `database` &mdash; Optional [string][api.type.String] value indicating the record's database.

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container in which the record is contained. Do not pass this parameter if you have only one iCloud Container associated with your app.


## Example

``````lua
local json = require( "json" )

-- Listener function to handle the fetch request
local function fetchResults( event )

	if event.record then
		print( "Record is: ", json.prettify( event.record:table() ) )
    else
		print( "Record not fetched!" )
    end
end

iCloud.recordFetch(
	{
		recordName = "Corona Labs 1",
		onComplete = fetchResults
	}
)
``````
