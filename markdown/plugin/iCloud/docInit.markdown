# iCloud.docInit()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, document, docInit
> __See also__          [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initializes document (file) storage/sharing for the app and invokes the `onComplete` listener function with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent].


<!---

## Gotchas

This method can take some time when called the first time and usually it's not necessary to even call it. Generally, use this method to determine if document storage is available.

-->


## Syntax

	iCloud.docInit( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `onComplete` &mdash; Required [listener][api.type.Listener] function to be invoked with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent].

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container to be used for document storage. Do not pass this parameter if you have only one iCloud Container associated with your app.


## Example

``````lua
local function docListener( event )

	if event.isError then
		print( "iCloud file storage is not available!" )
	end
end

iCloud.docInit( { onComplete=docListener } )
``````
