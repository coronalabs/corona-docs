# utf8.ncasecmp()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [utf8.*][plugin.utf8]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string, ncasecmp
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Compares strings `a` and `b`, ignoring case. Returns an integer as follows:

<div class="inner-table">

Condition		Returns	  
--------------	----------
`a < b`			 `-1`
`a == b`		 `0`
`a > b`			 `1`
--------------	----------

</div>


## Syntax

	utf8.ncasecmp( a, b )

##### a ~^(required)^~
_[String][api.type.String]._ The first string.

##### b ~^(required)^~
_[String][api.type.String]._ The second string.


## Example

``````lua
local utf8 = require( "plugin.utf8" )

local str1 = "♡ 你好，世界 ♡"
local str2 = str1

print( utf8.ncasecmp( str1, str2 ) )  --> 0 (same string)

str2 = utf8.insert( str1, 3, "UTF-8 " )

print( utf8.ncasecmp( str1, str2 ) )  --> 1 (different strings)
``````
