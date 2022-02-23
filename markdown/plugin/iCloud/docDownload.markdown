# iCloud.docDownload()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, document, docDownload
> __See also__          [iCloud.docEvict()][plugin.iCloud.docEvict]
>						[iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

iCloud Documents do not necessarily exist on disk and the system may evict them if disk space is needed. To speed up document access, call this function to initiate a download and invoke the `onComplete` listener function with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent].


## Gotchas

The `onComplete` listener function is called when the download is initiated, not when the download completes.


## Syntax

	iCloud.docDownload( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `filename` &mdash; Required; file to be downloaded.

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

iCloud.docDownload(
	{
		filename = "test.txt",
		onComplete = docListener
	}
)
``````
