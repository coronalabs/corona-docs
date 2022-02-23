# iCloud.docList()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, document, docList
> __See also__          [iCloud.docCheck()][plugin.iCloud.docCheck]
>						[iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves list of files in iCloud Documents storage and invokes the `onComplete` listener function with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent] upon completion.


## Syntax

    iCloud.docList( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.

## Parameter Reference

Valid keys for the `params` table include:

* `onComplete` &mdash; Required [listener][api.type.Listener] function to be invoked with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent].

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container to be used for document storage. Do not pass this parameter if you have only one iCloud Container associated with your app.


## Example

``````lua
local function docListener( event )

	if event.files then
		for i = 1,#event.files do
			print( event.files[i] )
		end
	end
end

iCloud.docList( { onComplete=docListener } )
``````
