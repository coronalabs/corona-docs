# event.products

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [productList][plugin.amazon-iap-v3.event.productList]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases, productList, products
> __See also__			[productList][plugin.amazon-iap-v3.event.productList]
>						[store.*][plugin.amazon-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Lua array ([table][api.type.Table]) where each element is itself a Lua table containing the following product information:

* `productIdentifier` &mdash; A [string][api.type.String] representing the product identifier.

* `title` &mdash; A [string][api.type.String] representing the product title.

* `description` &mdash; A [string][api.type.String] representing the product description.

* `type` &mdash; A [string][api.type.String] representing the type of product. Possible values include `"CONSUMABLE"`, `"ENTITLEMENT"`, or `"SUBSCRIPTION"`.

* `price` &mdash; The product price ([string][api.type.String]).

* `localizedPrice` &mdash; The product price as a localized currency string, for example `$0.99`.

* `smallIconUrl` &mdash; A [string][api.type.String] representing the URL of the product's small icon image.


<!---

## Example

``````lua
local function productListListener( event )

	for i = 1,#event.products do
		print( event.products[i].title )
		print( event.products[i].description )
		print( event.products[i].price )
		print( event.products[i].localizedPrice )
		print( event.products[i].productIdentifier )
	end
end
``````

-->
