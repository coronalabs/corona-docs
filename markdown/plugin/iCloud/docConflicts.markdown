# iCloud.docConflicts()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, document, docConflicts
> __See also__          [iCloud.docConflictData()][plugin.iCloud.docConflictData]
>                       [iCloud.docResolve()][plugin.iCloud.docResolve]
>						[iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]
>						[event.conflicts][plugin.iCloud.event.iCloudDocEvent.conflicts]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sometimes the same file will be simultaneously modified from several locations and iCloud will not be able to synchronize the changes. In this case a conflict will occur. Call this function to check for conflicts and invoke the `onComplete` listener function with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent] upon completion.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

If there are document conflicts, the [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent] will contain the [event.conflicts][plugin.iCloud.event.iCloudDocEvent.conflicts] table. These conflicts should be resolved.

</div>


## Syntax

	iCloud.docConflicts( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `filename` &mdash; Required; name of the file to check for conflicts.

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
