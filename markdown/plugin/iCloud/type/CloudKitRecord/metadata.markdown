# CloudKitRecord:metadata()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [CloudKitRecord][plugin.iCloud.type.CloudKitRecord]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, CloudKitRecord, metadata
> __See also__          [CloudKitRecord][plugin.iCloud.type.CloudKitRecord]
>                       [CloudKitRecord:table()][plugin.iCloud.type.CloudKitRecord.table]
>						[CloudKitRecord:get()][plugin.iCloud.type.CloudKitRecord.get]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves a record's metadata as a [table][api.type.Table] &mdash; see [Return Values](#values) below for details.


## Syntax

	CloudKitRecord:metadata()


<a id="values"></a>

## Return Values

The returned table contains the following fields (if&nbsp;available):

* `"recordName"` &mdash; [string][api.type.String] indicating the record's unique identifier.

* `"type"` &mdash; [string][api.type.String] indicating the type of the record.

* `"creationTime"` &mdash; [number][api.type.Number] indicating the time that the record was created. Output is similar to [os.time()][api.library.os.time].

* `"modificationTime"` &mdash; [number][api.type.Number] indicating the last time the record was successfully saved to iCloud. Output is similar to [os.time()][api.library.os.time].

* `"zoneName"` &mdash; [string][api.type.String] indicating the zone name.

* `"zoneOwner"` &mdash; [string][api.type.String] indicating the zone owner.

* `"lastModifiedUserRecordID"` &mdash; [table][api.type.Table] containing references to the user who last modified the record.

* `"creatorUserRecordID"` &mdash; [table][api.type.Table] containing references to the user who created the record.


## Example

``````lua
local json = require( "json" )

local function fetchResults( event )

	if event.record then
		print( json.prettify( event.record:metadata() ) )
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
