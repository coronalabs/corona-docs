# event.products

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [productList][plugin.samsung-iap.event.productList]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, productList, products
> __See also__			[productList][plugin.samsung-iap.event.productList]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Lua array ([table][api.type.Table]) where each element is itself a Lua table containing the following product information:

* `productIdentifier` &mdash; A [string][api.type.String] representing the product identifier.

* `title` &mdash; A [string][api.type.String] representing the product title.

* `description` &mdash; A [string][api.type.String] representing the product description.

* `localizedPrice` &mdash; The product price as a localized currency string, for example `$0.99`.

* `purchaseType` &mdash; Type ([string][api.type.String]) which is either `"item"` or `"subscription"`.

* `isConsumable` &mdash; A ([boolean][api.type.Boolean]) whether or not the in-app item is consumable.

* `originalJson` &mdash; A JSON-formatted [string][api.type.String] representation of the product details.

* `downloadUrl` &mdash; Url as a [string][api.type.String] to download the purchased item, check out the network.download [string][api.type.String]

* `imageUrl` &mdash; Url as a [string][api.type.String] of the item's image and thumbnail
