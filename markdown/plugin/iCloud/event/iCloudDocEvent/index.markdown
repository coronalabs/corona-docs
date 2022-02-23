# iCloudDocEvent

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, iCloudDocEvent
> __See also__          [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Most of APIs for iCloud Documents have two ways of being called.

Blocking (synchronous), and asynchronous, or non-blocking. If you want to use non-blocking call, use `onComplete` in parameters table. Setting this value to a listener, instead of waiting for a procedure to be completed, function would return instantly, but it will post task to be done. When task is done, listener would be invoked with message of this type.


## Properties

#### [event.name][plugin.iCloud.event.iCloudDocEvent.name]

#### [event.type][plugin.iCloud.event.iCloudDocEvent.type]

#### [event.contents][plugin.iCloud.event.iCloudDocEvent.contents]

#### [event.files][plugin.iCloud.event.iCloudDocEvent.files]

#### [event.conflicts][plugin.iCloud.event.iCloudDocEvent.conflicts]

#### [event.isError][plugin.iCloud.event.iCloudDocEvent.isError]

#### [event.error][plugin.iCloud.event.iCloudDocEvent.error]

#### [event.errorCode][plugin.iCloud.event.iCloudDocEvent.errorCode]
