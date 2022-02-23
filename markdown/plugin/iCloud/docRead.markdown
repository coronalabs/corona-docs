# iCloud.docRead()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, document, docRead
> __See also__          [iCloud.docWrite()][plugin.iCloud.docWrite]
>						[iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Reads contents of specified file and invokes the `onComplete` listener function with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent] upon completion.


## Syntax
    
	iCloud.docRead( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `filename` &mdash; Required; name of the file to be read.

* `onComplete` &mdash; Required [listener][api.type.Listener] function to be invoked with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent].

* `containerId` &mdash; Optional [string][api.type.String] value indicating a specific iCloud Container to be used for document storage. Do not pass this parameter if you have only one iCloud Container associated with your app.


## Example

``````lua
local function docListener( event )

	if not event.isError then
		print( event.contents )  -- Contents of document file (retrieved data)
	else
		print( event.error )
		print( event.errorCode )
	end
end

iCloud.docRead(
	{
		filename = "test.txt",
		onComplete = docListener
	}
)
``````
