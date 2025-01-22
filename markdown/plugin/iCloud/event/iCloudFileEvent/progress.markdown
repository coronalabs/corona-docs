# event.progress

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [iCloudFileEvent][plugin.iCloud.event.iCloudFileEvent]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, CloudKit, iCloudFileEvent, recordArray
> __See also__          [iCloudFileEvent][plugin.iCloud.event.iCloudFileEvent]
>						[iCloud.recordFetchFile()][plugin.iCloud.recordFetchFile]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Number containing progress of download between 0 and 100, should return 0 and 100 always but may skip numbers depending on the file size and may return decimal numbers, i.e 97.2