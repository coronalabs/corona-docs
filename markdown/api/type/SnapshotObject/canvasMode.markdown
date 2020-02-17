# object.canvasMode

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [SnapshotObject][api.type.SnapshotObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          canvas, canvasMode
> __See also__          [display.newSnapshot()][api.library.display.newSnapshot]
>                       [snapshot.canvas][api.type.SnapshotObject.canvas]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The canvas mode controls what happens to the children of the snapshot's [canvas][api.type.SnapshotObject.canvas]. 

This mode comes into play when the canvas is invalidated (i.e. calling `snapshot:invalidate("canvas")`). On the next render pass, the children will be removed from the canvas. The mode controls where those children go:

* `"append"` &mdash; This is the default. The children will be appended to the snapshot's [group][api.type.SnapshotObject.group] on the next render pass.
* `"discard"` &mdash; The children will be discarded on the next render pass.

## Syntax

	snapshot.canvasMode
