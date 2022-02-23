# iCloud.get()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String], [Number][api.type.Number], or [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, Key-Value Storage, KVS, get
> __See also__			[iCloud.set()][plugin.iCloud.set]
>						[iCloud.synchronize()][plugin.iCloud.synchronize]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves the value from a stored key. It will return the same type that the value was stored as \([string][api.type.String], [number][api.type.Number], or [table][api.type.Table]\). If the key is not found in KVS, this function returns `nil`.

Note that values are not instantly synchronized across the user's <nobr>iCloud-enabled</nobr> devices and that it may take some time for updated values to be reflected by this call.


## Syntax

	iCloud.get( key )

##### key ~^(required)^~
_[String][api.type.String]._ The key name from which to retrieve a value.


## Examples

``````lua
local value = iCloud.get( "touches" )

local json = require( "json" )
local someTable = json.decode( iCloud.get( "data" ) )
print( json.prettify( someTable ) )
``````
