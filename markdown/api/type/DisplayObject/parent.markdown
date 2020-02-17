# object.parent

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [GroupObject][api.type.GroupObject]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          group, parent group
> __See also__          [display.newGroup()][api.library.display.newGroup]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A read-only property that returns the object's parent.

## Example

``````lua
local group = display.newGroup()
 
local rect = display.newRect( 100, 100, 50, 50 )
rect:setFillColor( 0.7 )
group:insert( rect )
 
rect.parent:remove( rect )  --removes rect from group
``````