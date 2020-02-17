# crypto.hmac()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [crypto.*][api.library.crypto]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          crypto, hash, hmac
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Computes HMAC (Key-Hashing for Message Authentication Code) of the string and returns it.

## Syntax

	crypto.hmac( algorithm, data, key [, raw] )

##### algorithm ~^(required)^~
_[Constant][api.type.Constant]._ A constant specifying the hashing algorithm (see __Constants__ for [crypto.*][api.library.crypto]).

##### data ~^(required)^~
_[String][api.type.String]._ The input string.

##### key ~^(required)^~
_[String][api.type.String]._ String to use as the seed for the HMAC generation.

##### raw ~^(optional)^~
_[Boolean][api.type.Boolean]._ Indicates whether the output should be a direct binary equivalent of the message digest. If `false` (default), the result is formatted as a hexadecimal string.


## Examples

``````lua
local crypto = require( "crypto" )
local hash = crypto.hmac( crypto.md5, "test", "key" )
print( hash )   --> 1d4a2743c056e467ff3f09c9af31de7e
``````