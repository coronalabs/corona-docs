# event.status

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [iCloudFileEvent][plugin.iCloud.event.iCloudFileEvent]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, iCloudRecordEvent, status
> __See also__          [iCloudFileEvent][plugin.iCloud.event.iCloudFileEvent]
>						[iCloud.recordFetchFile()][plugin.iCloud.recordFetchFile]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

One of the following constants with be returned in the event 

* `"error"` &mdash; Error in download of the file, see [event.error][plugin.iCloud.event.iCloudFileEvent.error] for more info.

* `"progress"` &mdash; The file is loading and has [event.progress][plugin.iCloud.event.iCloudFileEvent.progress] to be shared.

* `"complete"` &mdash; The file has been successfully downloaded.
