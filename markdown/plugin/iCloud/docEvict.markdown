# iCloud.docEvict()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, document, docEvict
> __See also__          [iCloud.docDownload()][plugin.iCloud.docDownload]
>						[iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Signals the system that the file will not be required (for&nbsp;access) immediately. The file will __not__ be deleted from iCloud storage &mdash; it will still be available in iCloud through [iCloud.docRead()][plugin.iCloud.docRead], but access will be much slower.

This method invokes the `onComplete` listener function with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent] when the file is marked for eviction, not when the local file is actually deleted.


## Syntax

	iCloud.docEvict( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `filename` &mdash; Required; file to be evicted.

* `onComplete` &mdash; Required [listener][api.type.Listener] function to be invoked with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent].

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container to be used for document storage. Do not pass this parameter if you have only one iCloud Container associated with your app.


## Example

``````lua
local function docListener( event )

	if event.isError then
		print( event.error )
		print( event.errorCode )
	end
end

iCloud.docEvict(
	{
		filename = "test.txt",
		onComplete = docListener
	}
)
``````
