# crypto.md5

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Constant][api.type.Constant]
> __Library__           [crypto.*][api.library.crypto]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          crypto, MD5
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Constant used to specify the MD5 algorithm (Message-Digest algorithm 5).

## Syntax

	crypto.md5

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
local hash = crypto.digest( crypto.md5, "test" )
print( hash )	--> 098f6bcd4621d373cade4e832627b4f6
``````
