# Snapshots (Render to Texture)

[Snapshot][api.type.SnapshotObject] objects let you take a snapshot of a group of objects as a single image. You can then modify the objects and update the snapshot image. This provides an extra dimension of flexibility compared to screen capture APIs like [display.capture()][api.library.display.capture] which generates a new static display object containing the captured result.

<div class="guides-toc">

* [Creating Snapshots](#creating)
* [Rectangles vs. Snapshots](#diff1)
* [Groups vs. Snapshots](#diff2)
* [Snapshot Canvas](#canvas)
* [Performance](#performance)

</div>




<a id="creating"></a>

## Creating Snapshots

Snapshot objects are easily created using Corona's [display.newSnapshot()][api.library.display.newSnapshot] method. You can add children objects to snapshots by accessing the snapshot's [group][api.type.SnapshotObject.group]. This property is like a normal [GroupObject][api.type.GroupObject] but it does not directly affect the scene. Instead, these objects are rendered to a texture offscreen, and the texture determines what the snapshot renders.

Snapshot objects operate by capturing the children into a single cached image. When you first create a snapshot object, the object is initialized to update this cached image on the next render pass. Later, however, you may need to explicitly instruct the snapshot to update the cached image. For example, if you make modifications to the children of a snapshot, you must call [snapshot:invalidate()][api.type.SnapshotObject.invalidate] to update the snapshot on the next render pass. 

Here is a basic example which sets up a snapshot and inserts children into its group:

`````lua
local snapshot = display.newSnapshot( 200, 200 )

math.randomseed( 0 )

-- Add 4 fish images to the screen
for i = 1,4 do

	-- Create a fish
	local fish = display.newImage( "fish-small-red.png" )

	-- Move it to a random position relative to the snapshot's origin
	fish:translate( math.random( -100, 100 ), math.random( -100, 100 ) )

	-- Insert the fish into the snapshot
	snapshot.group:insert( fish )
end

snapshot:translate( display.contentCenterX, display.contentCenterY )  -- Center the snapshot on the screen
snapshot:invalidate()                                                 -- Invalidate the snapshot
transition.to( snapshot, { alpha=0, time=2000 } )                     -- Fade the snapshot out
`````




<a id="diff1"></a>

## Rectangles vs. Snapshots

Snapshots inherit all functionality of rectangles. For example, all [2.5D effects][guide.graphics.3D] are available to snapshot objects.




<a id="diff2"></a>

## Groups vs. Snapshots

Snapshots have several major differences compared to [display groups][api.library.display.newGroup]:

### Bounds

A display group's width and height are determined by its children, specifically the union of the children bounds. In contrast, snapshots have a <nobr>pre-defined</nobr> width and height, so children which reside outside those bounds will not render.

### Blending

Display groups render each of the children separately and this affects how the alpha is propagated. In groups, the alpha is propagated to each child and because each child renders separately, blending occurs when they overlap. In contrast, snapshots render as a single object, so the alpha only applies after the children are rendered into the snapshot's image.

![][images.sdk.graphics.Snapshot-vs-Group-alpha]

### Managing Children

Children of snapshots are normally contained in a special [snapshot group][api.type.SnapshotObject.group]. Consequently, you don't add children directly to the snapshot object but rather to its group property.

### Invalidation of Children

Display groups automatically detect when properties of children have changed, for example a child's position. Thus, on the next render pass, the child will <nobr>re-render</nobr>. In contrast, snapshots do __not__ automatically detect when a child's properties have changed. Thus, you must clear the snapshot's cached image when you modify a child by calling [snapshot:invalidate()][api.type.SnapshotObject.invalidate]. This invalidates the snapshot's image so it can be updated on the next render pass.

### Anchors

By default, groups do not respect [anchor points][guide.graphics.transform-anchor] because they do not have a <nobr>pre-defined</nobr> boundary. However, snapshots are [shape objects][api.type.ShapeObject] and they have controllable anchors.




<a id="canvas"></a>

## Snapshot Canvas

Normally, [snapshot:invalidate()][api.type.SnapshotObject.invalidate] causes the texture to be cleared prior to rendering the snapshot group's children to a texture. In contrast, when the snapshot [canvas][api.type.SnapshotObject.canvas] is invalidated, children render to the texture without clearing the texture first. 

The following are the relevant APIs to support <nobr>canvas-style</nobr> operations on the snapshot:

* [snapshot.canvas][api.type.SnapshotObject.canvas] &mdash; This is the group you should add children to for <nobr>canvas-style</nobr> operations.
* [snapshot.canvasMode][api.type.SnapshotObject.canvasMode] &mdash; This controls what happens to the children of the canvas group when the canvas is invalidated.
* [snapshot:invalidate( "canvas" )][api.type.SnapshotObject.invalidate] &mdash; You must invalidate the canvas in order for the children of the canvas group to be rendered to the texture.




<a id="performance"></a>

## Performance

### Overhead

Snapshot objects rely on a feature in OpenGL known as framebuffer objects that allow you to "render to texture." This works by performing an additional render pass which occurs offscreen. In other words, there is an additional render pass that draws into a texture, and these additional render passes are triggered whenever the snapshot is invalidated via [snapshot:invalidate()][api.type.SnapshotObject.invalidate]. Because these additional passes have some performance penalty, you should avoid calling too many invalidations at once.

### Device Dependencies

The performance of frame buffer objects depends on the device, so your mileage may vary. Generally, iOS devices have optimized their OpenGL pipeline for framebuffer objects, so you can expect decent performance.
