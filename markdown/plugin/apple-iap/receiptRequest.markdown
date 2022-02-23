
# store.receiptRequest()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, purchase
> __See also__          [store.init()][plugin.apple-iap.receiptAvailable]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------



## Overview

This will start a request to get a receipt from iTunes store. This call may ask for user login and password.


## Syntax

	store.receiptRequest( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener will be called when receipt request is finished. It will receive `"receiptRequest"` event with `"isError"` boolean field indicating if request was successful.
