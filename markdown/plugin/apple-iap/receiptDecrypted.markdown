
# store.receiptDecrypted()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, purchase
> __See also__          [store.init()][plugin.apple-iap.init]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------


Returns _[Table][api.type.Table]_ receipt file contents. This function would return `nil` if receipt failed to be verified, does not exists. Also it will return `nil` in case if `"plugin.apple.iap.helper"` and `"plugin.openssl"` are not included to `build.settings`.
