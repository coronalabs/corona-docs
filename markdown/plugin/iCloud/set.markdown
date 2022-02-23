# iCloud.set()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__			iCloud, sync, storage, Key-Value Storage, KVS, set
> __See also__			[iCloud.get()][plugin.iCloud.get]
>						[iCloud.synchronize()][plugin.iCloud.synchronize]
>						[iCloud.*][plugin.iCloud]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Associates a value with a key. This <nobr>key-value</nobr> pair will eventually be synchronized across the user's <nobr>iCloud-enabled</nobr> devices.


## Syntax

	iCloud.set( key, value )

##### key ~^(required)^~
_[String][api.type.String]._ The key name to associate with a value. This name can be used with [iCloud.get()][plugin.iCloud.get] to retrieve the value.

##### value ~^(required)^~
_[String][api.type.String],_ _[Number][api.type.Number],_ or _[Table][api.type.Table]._ The value to be associated with the key. Tables must contain named <nobr>key-value</nobr> pairs and have similar types for their values.


## Gotchas

* Storage space for KVS is strictly limited. You can declare a maximum of 1024 keys and the total size of all values should be less than 1&nbsp;MB. Keys should be less than 64 symbols (bytes).

* Setting arrays is __not__ supported, neither as tables by themselves or as contents of other tables. Technically, Lua arrays are tables with numbered indices, but stored tables must contain named <nobr>key-value</nobr> pairs and have similar types for their values.

<div class="code-indent">

``````lua
local arr = { true, false, 0, 10 }  -- This is analogous to { 1=true, 2=false, 3=0, 4=10 }
iCloud.set( "myArray", arr )        -- This will produce an error and the value will not be stored
``````

</div>


## Examples

``````lua
iCloud.set( "touches", 52 )
iCloud.set( "rose", { kind="flower", color="red", amount=12 } )
iCloud.set( "engine", "Corona" )

local json = require( "json" )
iCloud.set( "data", json.encode( someTable ) )
``````
