# CloudKitRecord:get()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [CloudKitRecord][plugin.iCloud.type.CloudKitRecord]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, CloudKitRecord, get
> __See also__          [CloudKitRecord][plugin.iCloud.type.CloudKitRecord]
>						[CloudKitRecord:set()][plugin.iCloud.type.CloudKitRecord.set]
>						[CloudKitRecord:table()][plugin.iCloud.type.CloudKitRecord.table]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retreives the value of a specific field in a record. Because Lua data types do not directly match CloudKit data types, CloudKit record values are packaged and returned as a [table][api.type.Table]. This table will contain specific properties depending on the record value's type &mdash; see [Record Values](#values) below for details.


## Syntax

	CloudKitRecord:get( field )

##### field ~^(required)^~
_[String][api.type.String]._ The field name to retreive the value from.


<a id="values"></a>

## Record Values

The returned table has a `type` property and its contents vary depending on this property value. Here is the outline for each represented type:

<div class="inner-table">

Type				Properties												Lua Type
------------------	------------------------------------------------------	------------------------------
`"string"`			`string`												[string][api.type.String]
`"number"`			`number`												[number][api.type.Number]
`"data"`			`data`													[string][api.type.String]
`"location"`		`latitude`, `longitude`									[numbers][api.type.Number]
`"date"`			`time`													[number][api.type.Number]
`"reference"`		`recordName`, `zoneName`, `zoneOwner`, `action`			[strings][api.type.String]
`"asset"`			`path`													[string][api.type.String]
`"array"`			`array`													[table][api.type.Table]
------------------	------------------------------------------------------	------------------------------

</div>


## Examples

##### String

``````lua
local function fetchResults( event )

	if event.record then
		local value = event.record:get( "meeting" )
		if ( value and value.type == "string" ) then
			print( "Meeting:", value.string )
		end
    end
end

iCloud.recordFetch(
	{
		recordName = "Corona Labs 1",
		onComplete = fetchResults
	}
)
``````

##### Date

``````lua
local function fetchResults( event )

	if event.record then
		local value = event.record:get( "when" )
		if ( value and value.type == "date" ) then
			print( "When:", value.time )
		end
    end
end

iCloud.recordFetch(
	{
		recordName = "Corona Labs 1",
		onComplete = fetchResults
	}
)
``````

##### Location

``````lua
local function fetchResults( event )

	if event.record then
		local value = event.record:get( "where" )
		if ( value and value.type == "location" ) then
			print( "Where:", value.latitude .. ", " .. value.longitude )
		end
    end
end

iCloud.recordFetch(
	{
		recordName = "Corona Labs 1",
		onComplete = fetchResults
	}
)
``````
