# crypto.sha1

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Constant][api.type.Constant]
> __Library__           [crypto.*][api.library.crypto]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          crypto, SHA-1
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Constant used to specify the SHA-1 algorithm.

## Syntax

	crypto.sha1

## Gotchas

The [crypto.digest()][api.library.crypto.digest] and [crypto.hmac()][api.library.crypto.hmac] functions are supported on a <nobr>per-platform</nobr> basis as follows:

<div class="inner-table">

Platform			  crypto.digest()	  crypto.hmac()
------------------	------------------	------------------
Android					&#x2713;			&#x2713;
iOS						&#x2713;			&#x2713;
macOS					&#x2713;			&#x2713;
Windows Desktop			&#x2713;			&#x2713;
------------------	------------------	------------------

</div>

## Example

``````lua
local crypto = require( "crypto" )
local hash = crypto.digest( crypto.sha1, "test" )
print( hash )	--> a94a8fe5ccb19ba61c4c0873d391e987982fbbd3
``````
