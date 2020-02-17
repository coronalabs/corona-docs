# table.remove()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [table.*][api.library.table]
> __Return value__      (varies)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          table, array
> __See also__          [table.insert()][api.library.table.insert]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Removes from table the element at position `pos`, shifting down other elements to close the space, if necessary. Returns the value of the removed element. 

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

`table.remove()` may affect performance because it has to shuffle all of the elements in the array (following&nbsp;the one being&nbsp;removed) down by one. Thus, it should not be used in <nobr>time-critical</nobr> sections of code.

</div>
</div>


## Syntax

	table.remove( t )
	table.remove( t, pos )

##### t ~^(required)^~
_[Table][api.type.Table]._ The table from which to remove.

##### pos ~^(optional)^~
_[Number][api.type.Number]._ Position of the element to remove. Its default value is the length of the table, so `table.remove(t)` removes the last element of `t`.


## Examples

``````lua
local exampleTable = { 1,1,2,3,5,8,13 }
print( table.maxn(exampleTable) )      --> 7
print( table.remove(exampleTable,4) )  --> 3
print( table.maxn(exampleTable) )      --> 6
print( table.remove(exampleTable) )    --> 13
``````

##### Empty Entire Table

``````lua
local exampleTable = { 1,1,2,3,5,8,13 }
for i = #exampleTable,1,-1 do
	table.remove(exampleTable,i)
end
``````
