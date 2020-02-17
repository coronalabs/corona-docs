# object:remove()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [GroupObject][api.type.GroupObject]
> __Library__           [display.*][api.library.display]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          remove, remove child
> __See also__          [object:removeSelf()][api.type.DisplayObject.removeSelf]
>						[display.remove()][api.library.display.remove]
>						[Group Programming][guide.graphics.group] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Remove an object from a group by either an index number or a reference to the object.

## Gotchas

* If an object is being removed (deleted), it is recommended to use [object:removeSelf()][api.type.DisplayObject.removeSelf] or [display.remove()][api.library.display.remove] instead.

* Using this method will delete the specified child object, not simply remove it from the group. If you want to remove an object from a group, insert it into a different group, or insert it into the global [stage][api.type.StageObject] group instead.

* When an object is removed, the <nobr>rendering-related</nobr> resources of the removed object are deleted immediately. What remains of the object is simply a plain Lua table with all <nobr>non-display</nobr> object properties &mdash; the metatable is set to `nil` and all properties relating to display object are removed. Thus, if there are still references to object in Lua, they will simply be references to a normal Lua table.


## Syntax

	object:remove( indexOrChild )

##### indexOrChild ~^(required)^~
_[Number][api.type.Number] or [DisplayObject][api.type.DisplayObject]._ Removes the display object specified from the group, shifting down other elements as needed. The argument is either the index position of the child within group (number) or the child display object itself.


## Example

``````lua
-- Remove the second object from the group
display.getCurrentStage():remove( 2 )  
``````
