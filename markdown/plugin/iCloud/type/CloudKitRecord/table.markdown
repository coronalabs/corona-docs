# CloudKitRecord:table()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [CloudKitRecord][plugin.iCloud.type.CloudKitRecord]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, CloudKitRecord, table
> __See also__          [CloudKitRecord][plugin.iCloud.type.CloudKitRecord]
>                       [CloudKitRecord:get()][plugin.iCloud.type.CloudKitRecord.get]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves all of the record's values as a table.


## Syntax

	CloudKitRecord:table()


## Example

``````lua
local json = require( "json" )

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
