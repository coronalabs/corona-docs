
# display.newSnapshot()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [SnapshotObject][api.type.SnapshotObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          snapshot
> __See also__          [Snapshots][guide.graphics.snapshot] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Snapshot objects let you capture a group of display objects and render them into a flattened image. The image is defined by objects that are added to the snapshot's [group][api.type.SnapshotObject.group] property.

Learn more about snapshots in the [Snapshots][guide.graphics.snapshot] guide.

## Gotchas

### Android

When an app is suspended, the Android OS removes all OpenGL textures from memory. When the app is resumed, Corona must reload all images, but the capture image no longer exists in memory. If you need to restore a snapshot image in Android, one solution is to save the returned capture image to file via the [display.save()][api.library.display.save] function. Note that this should be done immediately, not during the `"applicationSuspend"` or `"applicationExit"` [system][api.event.system.type] events (at&nbsp;those times, there will be no OpenGL textures in memory to&nbsp;save).

## Syntax

	display.newSnapshot( [parent,] w, h )


##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the snapshot.

##### w / h ~^(required)^~
_[Number][api.type.Number]._ Width and height of the snapshot.


## Example

![][images.sdk.graphics.Snapshot-alpha]

`````lua
local snapshot = display.newSnapshot( 200, 200 )

math.randomseed( 0 )

-- Add fish to the screen
for i=1,4 do
    local fish = display.newImage( "fish.small.red.png" )

    -- move to random position in a 200x200 region in the middle of the screen
    fish:translate( math.random( -100, 100 ), math.random( -100, 100 ) )

    -- insert fish into snapshot
    snapshot.group:insert( fish )
end

snapshot:translate( halfW, halfH )  -- Center snapshot
snapshot:invalidate()               -- Invalidate snapshot
snapshot.alpha = 0.5                -- Apply to flattened image
`````

