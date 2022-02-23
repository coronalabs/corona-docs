# iCloud.recordAccountStatus()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, recordAccountStatus
> __See also__          [iCloudRecordEvent.status][plugin.iCloud.event.iCloudRecordEvent.status]
>						[iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Passes the user's CloudKit account status to the `onComplete` listener function as [iCloudRecordEvent.status][plugin.iCloud.event.iCloudRecordEvent.status].


## Syntax
 
	iCloud.recordAccountStatus( params )
	
##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing <nobr>method-specific</nobr> parameters &mdash; see the next section for details.


## Parameter Reference

Valid keys for the `params` table include:

* `onComplete` &mdash; Required [listener][api.type.Listener] function to be invoked with an [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent].


## Event Values

The `onComplete` listener function will receive [iCloudRecordEvent.status][plugin.iCloud.event.iCloudRecordEvent.status] as one of following constants:

* `"ok"` &mdash; The user's iCloud account is available and may be used by the app.

* `"restricted"` &mdash; The user's iCloud account is not available. Access was denied due to Parental Controls or Mobile Device Management restrictions.

* `"noAccount"` &mdash; The user's iCloud account is not available because no account information has been provided for the device.

* `"error"` &mdash; An error occurred during an attempt to retrieve the account status.


## Example

``````lua
local function checkCloudKit( event )

	if event.status == "ok" then
		-- CloudKit ready!
	end
end

iCloud.recordAccountStatus(
	{
		onComplete = checkCloudKit
	}
)
``````
