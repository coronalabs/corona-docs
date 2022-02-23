# iCloud.table()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iCloud, sync, storage, Key-Value Storage, KVS, table
> __See also__          [iCloud.set()][plugin.iCloud.set]
>                       [iCloud.get()][plugin.iCloud.get]
>                       [iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Retrieves all values stored in Key-Value Storage by returning a table of <nobr>key-value</nobr> pairs.


## Syntax

	iCloud.table()


## Example

``````lua
local json = require( "json" )

-- Prints all values currently stored in Key-Value Storage
local KVSvalues = iCloud.table()
print( json.prettify( KVSvalues ) )
``````
