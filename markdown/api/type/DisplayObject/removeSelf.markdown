# object:removeSelf()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          removeSelf, removing objects, delete object, removal
> __See also__          [display.remove()][api.library.display.remove]
>						[group:remove()][api.type.GroupObject.remove]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Removes the display object and frees its memory, assuming there are no other references to it. This is equivalent to calling [group:remove()][api.type.GroupObject.remove] on the same display object, but it is syntactically simpler. The `object:removeSelf()` syntax is also supported in other cases, such as removing physics joints in the physics engine.

When you remove a display object, event listeners that are attached to it&nbsp;&mdash; tap and touch listeners, for example&nbsp;&mdash; are also freed from memory. You don't need to explicitly remove event listeners that are isolated to the object. See the [Display&nbsp;Objects][guide.media.displayObjects] guide for further details on object removal.

The `object:removeSelf()` method converts a display object into a normal Lua table that will be garbage collected if there are not other references to the object. You should also set the object to `nil` after removing it.


## Syntax

	object:removeSelf()


## Gotchas

* As a best practice, you should set the associated variable(s) to `nil` __after__ calling `object:removeSelf()`.

* When an object is removed, the <nobr>rendering-related</nobr> resources of the removed object are deleted immediately. What remains of the object is simply a plain Lua table with all <nobr>non-display</nobr> object properties &mdash; the metatable is set to `nil` and all properties relating to display object are removed. Thus, if there are still references to object in Lua, they will simply be references to a normal Lua table.


## Example

`````lua
local obj = display.newImage( "image.png" )
obj:translate( 100, 100 )

-- Remove the object
obj:removeSelf()
obj = nil
`````
