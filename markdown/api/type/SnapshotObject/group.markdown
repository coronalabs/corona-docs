# object.group

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [GroupObject][api.type.GroupObject]
> __Object__            [SnapshotObject][api.type.SnapshotObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          group
> __See also__          [display.newSnapshot()][api.library.display.newSnapshot]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This group is a special offscreen group that determines what is rendered in the snapshot.

## Syntax

	snapshot.group

## Snapshot Groups vs Normal Groups

The snapshot group behaves just like a normal [group][api.type.GroupObject] except:

* This group cannot be inserted into another group.
* This group cannot be removed, for example via `removeSelf()`.
* This group has no parent.
