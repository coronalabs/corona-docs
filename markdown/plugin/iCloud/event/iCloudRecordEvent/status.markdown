# event.status

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, iCloudRecordEvent, status
> __See also__          [iCloudRecordEvent][plugin.iCloud.event.iCloudRecordEvent]
>						[iCloud.recordAccountStatus()][plugin.iCloud.recordAccountStatus]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

One of the following constants as a result of calling [iCloud.recordAccountStatus()][plugin.iCloud.recordAccountStatus]:

* `"ok"` &mdash; The user's iCloud account is available and may be used by the app.

* `"restricted"` &mdash; The user's iCloud account is not available. Access was denied due to Parental Controls or Mobile Device Management restrictions.

* `"noAccount"` &mdash; The user's iCloud account is not available because no account information has been provided for the device.

* `"error"` &mdash; An error occurred during an attempt to retrieve the account status.
