# object:insert()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [GroupObject][api.type.GroupObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          insert, group insert
> __See also__          [Group Programming][guide.graphics.group] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Inserts an object into a group.

## Gotchas

Inserting display objects into a group also removes the object from it current group (objects cannot be in multiple groups). All display objects are part of [stage][api.type.StageObject] object when first created. At this time, Corona only has one stage, which is the entire screen area.


## Syntax

	group:insert( [index,] child, [, resetTransform] )

##### index ~^(optional)^~
_[Number][api.type.Number]._ Inserts child at `index` into group, shifting up other elements as necessary. The default value index is `n+1` where `n` is the number of children in the group.

An easy way to move an object above all its siblings (top) is to re-insert it: `object.parent:insert( object )`.

If a group has 3 display objects:

* `group[1]` is at the bottom of the group.
* `group[2]` is in the middle of the group.
* `group[3]` is at the top of the group.

Objects at the higher index numbers will be displayed on top of objects with lower index numbers (if the objects overlap).

##### child ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ Object to be inserted into the group.

##### resetTransform ~^(optional)^~
_[Boolean][api.type.Boolean]._ Determines what happens to child’s transform. When `false`, child’s local position, rotation, and scale properties are preserved, except the local origin is now relative to the new parent group, not its former parent; When `true`, child’s transform is reset (i.e. the `x`, `y`, `rotation`, `xScale`, and `yScale` properties of child are reset to `0`, `0`, `0`, `1`, and `1`, respectively). The default value for `resetTransform` is `false`.

## Example

``````lua
local txt = display.newText( "Hello", 0, 0 )
local g1 = display.newGroup()
local g2 = display.newGroup()
              
-- Insert text object into g1
g1:insert( txt )               
-- Insert same text object into g2
g2:insert( txt )
 
print( "g1[1]: " .. tostring(g1[1]) )  -- prints nil
print( "g2[1]: " .. tostring(g2[1]) )  -- prints textObject
print( "number of children in g1 and g2: " .. g1.numChildren, g2.numChildren ) 
``````
