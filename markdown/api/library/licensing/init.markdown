# licensing.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [licensing.*][api.library.licensing]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          licensing
> __See also__          [licensing.verify()][api.library.licensing.verify]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initializes the licensing service library by specifying the name of the licensing provider. Currently, only `"google"` is supported.

Returns `true` if successful; otherwise returns `false`.


## Syntax

	licensing.init( providerName )

##### providerName ~^(required)^~
_[String][api.type.String]._ String containing the provider's name.
