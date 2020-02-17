# object.canvas

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [GroupObject][api.type.GroupObject]
> __Object__            [SnapshotObject][api.type.SnapshotObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          canvas
> __See also__          [display.newSnapshot()][api.library.display.newSnapshot]
>                       [snapshot:invalidate()][api.type.SnapshotObject.invalidate]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This group is a special offscreen group that enables you to draw on the snapshot's texture without redrawing the objects in [snapshot.group][api.type.SnapshotObject.group].


## Syntax

	snapshot.canvas


## Canvas-style Invalidation

Normally, snapshot invalidates causes the texture to be cleared prior to rendering the snapshot group's children to a texture.

In contrast, when the canvas is invalidated, they render to the texture without clearing the texture first. 

To invalidate the canvas, simply pass the `"canvas"` parameter to [snapshot:invalidate()][api.type.SnapshotObject.invalidate] as shown in the example below.

### Children

By default, when a canvas is invalidated, the children of the canvas are _appended_ to the [snapshot's group][api.type.SnapshotObject.group] upon the next render pass. At this point, the canvas will be empty.

You can change this so that the children of the canvas are _discarded_ by setting the [canvasMode][api.type.SnapshotObject.canvasMode] to `"discard"`.


## Canvas Properties

Properties of the canvas will be ignored and will not effect on the rendered result.

Instead, for rendering purposes, the properties of [snapshot.group][api.type.SnapshotObject.group] will be used instead. 

For example, properties like position (or rotation, scale, alpha, etc) will be taken from the snapshot's group property, instead of from the canvas property.

In addition, changes to the `snapshot.canvas` will be reset to the corresponding value of [snapshot.group][api.type.SnapshotObject.group] just prior to when the canvas objects are drawn.


## Canvas Groups vs Normal Groups

The canvas group behaves just like a normal [group][api.type.GroupObject] except:

* This group cannot be inserted into another group.
* This group cannot be removed, for example via `removeSelf()`.
* This group has no parent.


## Example

``````lua
local w,h = display.contentWidth,display.contentHeight 
local snapshot = display.newSnapshot( w, h )

local brush = display.newImage( "brush.png" )
snapshot.canvas:insert( brush )

snapshot:invalidate( "canvas" )
``````