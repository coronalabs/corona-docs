# iCloud.setKVSListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Function][api.type.Function]
> __Return value__		none
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			iCloud, sync, storage, Key-Value Storage, KVS, setKVSListener
> __See also__			[iCloudKVSEvent][plugin.iCloud.event.iCloudKVSEvent]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the listener function which will be invoked when an [iCloudKVSEvent][plugin.iCloud.event.iCloudKVSEvent] is produced.


## Syntax

    iCloud.setKVSListener( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive an [iCloudKVSEvent][plugin.iCloud.event.iCloudKVSEvent].
