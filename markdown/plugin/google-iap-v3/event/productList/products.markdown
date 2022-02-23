# event.products

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [productList][plugin.google-iap-v3.event.productList]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases, productList, products
> __See also__			[productList][plugin.google-iap-v3.event.productList]
>						[store.*][plugin.google-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Lua array ([table][api.type.Table]) where each element is itself a Lua table containing the following product information:

* `productIdentifier` &mdash; A [string][api.type.String] representing the product identifier.

* `title` &mdash; A [string][api.type.String] representing the product title.

* `description` &mdash; A [string][api.type.String] representing the product description.

<!--- * `type` &mdash; "inapp", "subs" -->

* `localizedPrice` &mdash; The product price as a localized currency string, for example `$0.99`.

* `priceAmountMicros` &mdash; Price ([string][api.type.String]) in <nobr>micro-units</nobr>, where 1,000,000 <nobr>micro-units</nobr> equal one unit of the currency.

* `priceCurrencyCode` &mdash; ISO 4217 currency code for the price, for example `"GBP"` if the price is specified in British pounds sterling.

* `originalJson` &mdash; A JSON-formatted [string][api.type.String] representation of the product details.
