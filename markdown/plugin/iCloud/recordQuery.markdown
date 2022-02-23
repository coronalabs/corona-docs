# iCloud.recordQuery()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, recordQuery
> __See also__          [iCloud.recordFetch()][plugin.iCloud.recordFetch]
>						[iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves existing records based on a defined query and passes the results to the `onComplete` listener function as [iCloudRecordEvent.recordArray][plugin.iCloud.event.iCloudRecordEvent.recordArray].


## Gotchas

You must pass a predicate to filter records. Predicates are formed according to Apple's [documentation](https://developer.apple.com/library/ios/documentation/CloudKit/Reference/CKQuery_class/).


## Syntax

    iCloud.recordQuery( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `type` &mdash; Required [string][api.type.String] value indicating the type of records to be queried.

* `query` &mdash; Required [string][api.type.String] value indicating the query. Use `"TRUEPREDICATE"` to retrieve all records, or consult Apple's [documentation](https://developer.apple.com/library/ios/documentation/CloudKit/Reference/CKQuery_class/) for more sophisticated query options.

* `onComplete` &mdash; Required [listener][api.type.Listener] function to be invoked with an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent].

* `queryParams` &mdash; Optional [table][api.type.Table] value used to search for certain values and escape them with Apple's predicate mechanism. See Apple's [documentation](https://developer.apple.com/library/ios/documentation/CloudKit/Reference/CKQuery_class/) for more information.

* `database` &mdash; Optional [string][api.type.String] value indicating the database to query.

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container to query. Do not pass this parameter if you have only one iCloud Container associated with your app.


## Example

``````lua
local json = require( "json" )

function queryResults( event )

    if event.recordArray then
        print( "Total records retrieved: ", #event.recordArray )
        if #event.recordArray > 0 then
			for r = 1,#event.recordArray do
				print( "----------" )
				print( json.prettify( event.recordArray[r]:table() ) )
				print( "----------" )
			end
        end
    else
        print( "No records found!" )
    end
end

iCloud.recordQuery(
	{
		type = "people",
		query = "TRUEPREDICATE",
		onComplete = queryResults
	}
)
``````
