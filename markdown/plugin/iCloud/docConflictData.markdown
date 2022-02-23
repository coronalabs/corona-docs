# iCloud.docConflictData()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, document, docConflictData
> __See also__          [iCloud.docConflicts()][plugin.iCloud.docConflicts]
>						[iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]
>						[event.conflicts][plugin.iCloud.event.iCloudDocEvent.conflicts]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves contents of a document conflict gathered from [iCloud.docConflicts()][plugin.iCloud.docConflicts] and invokes the `onComplete` listener function with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent] upon completion.


## Syntax

	iCloud.docConflictData( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `conflict` &mdash; Required; the `dataHandle` of a conflict gathered from [iCloud.docConflicts()][plugin.iCloud.docConflicts].

* `onComplete` &mdash; Required [listener][api.type.Listener] function to be invoked with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent].

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container to be used for document storage. Do not pass this parameter if you have only one iCloud Container associated with your app.


## Example

``````lua
local function printConflictData( event )

	print( "Conflict contents: " .. event.contents )
end

local function docListener( event )

	if event.conflicts then
		for i = 1,#event.conflicts do
			print( "Conflict origin: " .. event.conflicts[i].origin )
			print( "Conflict time: " .. event.conflicts[i].time )

			iCloud.docConflictData(
				{
					conflict = event.conflicts[i].dataHandle,
					onComplete = printConflictData
				}
			)
		end
    end
end

iCloud.docConflicts(
	{
		filename = "test.txt",
		onComplete = docListener
	}
)
``````
