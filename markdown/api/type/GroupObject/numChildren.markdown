# object.numChildren

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [GroupObject][api.type.GroupObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          group children, child count, group count
> __See also__          [Group Programming][guide.graphics.group] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieve the number of children in a group. You access the children by integer (whole number) index.

## Example

``````lua
local group = display.newGroup()
group:insert( rect1 ) -- assume rect1 is an existing display object
group:insert( rect2 ) -- assume rect2 is an existing display object

for i=1,group.numChildren do
    local child = group[i]
    local description = (child.isVisible and "visible") or "not visible"
    print( "child["..i.."] is " .. description )
end 
``````
