# iCloud.docWrite()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, document, docWrite
> __See also__          [iCloud.docRead()][plugin.iCloud.docRead]
>						[iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Writes data to a specified file and invokes the `onComplete` listener function with an [iCloudDocEvent][plugin.iCloud.event.iCloudDocEvent] upon completion.


## Syntax

	iCloud.docWrite( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `filename` &mdash; Required; name of the file to be used to store data.

* `contents` &mdash; Required; data to be stored in the file.

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

iCloud.docWrite(
	{
		filename = "test.txt",
		contents = "Corona",
		onComplete = docListener
	}
)
``````
