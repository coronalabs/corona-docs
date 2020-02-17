# crypto.digest()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [crypto.*][api.library.crypto]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          crypto, hash, digest
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Generates the message digest (the hash) of the input string.

## Syntax

	crypto.digest( algorithm, data [, raw] )

##### algorithm ~^(required)^~
_[Constant][api.type.Constant]._ A constant specifying the hashing algorithm (see __Constants__ for [crypto.*][api.library.crypto]).

##### data ~^(required)^~
_[String][api.type.String]._ The input string.

##### raw ~^(optional)^~
_[Boolean][api.type.Boolean]._ Indicates whether the output should be a direct binary equivalent of the message digest. If `false` (default), the result is formatted as a hexadecimal string.


## Example

``````lua
local crypto = require( "crypto" )
local hash = crypto.digest( crypto.md4, "test" )
print( hash )	--> db346d691d7acc4dc2625db19f9e3f52
``````