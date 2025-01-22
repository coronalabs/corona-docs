# iCloud.recordFetchFile()

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


Use this method to fetch and download a single asset from Cloudkit from a single key with progress 

To get a complete single record see [iCloud.recordFetch()][plugin.iCloud.recordFetch].


## Syntax

    iCloud.recordFetchFile( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `recordName` &mdash; Required [string][api.type.String] value representing the identifier for the record.

* `fieldKey` &mdash; Required [string][api.type.String] value representing the field for the asset you want to download.

* `pathForFile` &mdash; Required [string][api.type.String] value representing where you want to save the file via a string absolute path, please use [system.pathForFile()][api.library.system.pathForFile]

* `listener` &mdash; Required [listener][api.type.Listener] function to be invoked with an [iCloudFileEvent][plugin.iCloud.event.iCloudFileEvent].

* `zoneName` &mdash; Optional [string][api.type.String] value indicating the record's zone name.

* `zoneOwner` &mdash; Optional [string][api.type.String] value indicating the record's zone owner.

* `database` &mdash; Optional [string][api.type.String] value indicating the record's database.

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container in which the record is contained. Do not pass this parameter if you have only one iCloud Container associated with your app.


## Example

``````lua
local json = require( "json" )
local iCloud = require "plugin.iCloud"

-- Listener function to handle the fetch request
local function fetchResults( event )

	if event.record then
		print( "Record is: ", json.prettify( event.record:table() ) )
    else
		print( "Record not fetched!" )
    end
end

iCloud.recordFetchFile({
        listener = function( event )
            print("File event")
            if(event.status == "progress")then
                print(event.progress)
            else if(event.status == "complete")then
                local image = display.newImage( "image.png", system.DocumentsDirectory )
            end
        end,
        fieldKey = "assetNameHere",
        database = "public",
        recordName = "testFile123",
        pathForFile = system.pathForFile( "image.png", system.DocumentsDirectory ),
})
``````
