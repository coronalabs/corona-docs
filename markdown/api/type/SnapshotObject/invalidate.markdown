# object:invalidate()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [SnapshotObject][api.type.SnapshotObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          invalidate, render to texture
> __See also__          [display.newSnapshot()][api.library.display.newSnapshot]
>                       [snapshot.canvas][api.type.SnapshotObject.canvas]
>                       [snapshot.group][api.type.SnapshotObject.group]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Invalidating snapshots tells Corona to invalidate its texture cache and re-render the children to a texture on the next render pass.

Unlike most other objects in Corona, snapshots will not automatically recognize when children have been modified. This is because there's a cost to rendering to a texture.


## Syntax

	snapshot:invalidate()
	snapshot:invalidate( "canvas" )


## Group vs Canvas

* `snapshot:invalidate()` invalidates the snapshot's [group][api.type.SnapshotObject.group].
* `snapshot:invalidate( "canvas" )` invalidates the snapshot's [canvas][api.type.SnapshotObject.canvas].
