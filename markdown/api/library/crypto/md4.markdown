# crypto.md4

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Constant][api.type.Constant]
> __Library__           [crypto.*][api.library.crypto]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          crypto, MD4
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Constant used to specify the MD4 algorithm (Message-Digest algorithm 4).

## Syntax

	crypto.md4

## Gotchas

The [crypto.digest()][api.library.crypto.digest] and [crypto.hmac()][api.library.crypto.hmac] functions are supported on a <nobr>per-platform</nobr> basis as follows:

<div class="inner-table">

Platform			  crypto.digest()	  crypto.hmac()
------------------	------------------	------------------
Android
iOS						&#x2713;
macOS					&#x2713;
Windows Desktop			&#x2713;			&#x2713;
------------------	------------------	------------------

</div>

## Example

``````lua
local crypto = require( "crypto" )
local hash = crypto.digest( crypto.md4, "test" )
print( hash )	--> db346d691d7acc4dc2625db19f9e3f52
``````
