# object.clearColor

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Paint][api.type.Paint]
> __Object__            [SnapshotObject][api.type.SnapshotObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          color
> __See also__          [display.newSnapshot()][api.library.display.newSnapshot]
>                       [snapshot:invalidate()][api.type.SnapshotObject.invalidate]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The clear color controls how the snapshot's texture is cleared when the snapshot is invalidated.

By default, the texture is cleared with `0` for all color channels.

## Syntax

	snapshot.clearColor

## Example

``````lua
-- Clear with red
snapshot.clearColor = { 1, 0, 0 }
``````