# iCloud.synchronize()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, Key-Value Storage, KVS, synchronize
> __See also__          [iCloud.set()][plugin.iCloud.set]
>						[iCloud.get()][plugin.iCloud.get]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a request to write KVS to local storage, effectively initiating synchronization. This will occur automatically at some point, even if the app is not running, so there is normally no reason to call this unless you want devices to synchronize as fast as possible.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Avoid using this API frequently since it may result in faster battery consumption and/or excessive cellular data usage.

</div>


## Syntax

	iCloud.synchronize()
