# event.products

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [productList][api.library.store.event.productList]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, productList, products
> __See also__			[productList][api.library.store.event.productList]
>						[store.*][api.library.store]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Lua array ([table][api.type.Table]) where each element is itself a Lua table containing the following product information:

* `productIdentifier` &mdash; A [string][api.type.String] representing the product identifier.

* `title` &mdash; A [string][api.type.String] representing the product title.

* `description` &mdash; A [string][api.type.String] representing the product description.

* `price` &mdash; The product price ([string][api.type.String]).

* `localizedPrice` &mdash; The product price as a localized currency string, for example `$0.99`.

* `priceLocale` &mdash; A [string][api.type.String] representing a locale string in one of the following forms:

	* `<IsoLanguageCode>_<IsoCountryCode>`
	* `<IsoLanguageCode>-<IsoScriptCode>_<IsoCountryCode>`
	