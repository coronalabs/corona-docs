
# display.newMesh()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [ShapeObject][api.type.ShapeObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          shape, mesh, vector object
> __See also__          [Shapes &mdash; Paths, Fills, Strokes][guide.graphics.path] _(guide)_
>                       [Display Objects][guide.media.displayObjects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Draws a mesh shape by providing vertices of the shape. The local origin is at the center of the mesh and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.


## Syntax

	display.newMesh( [parent,] [x, y,] options )

	display.newMesh( options )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the mesh.

##### x / y ~^(optional)^~
_[Numbers][api.type.Number]._ The location of the object relative to its parent.

##### options ~^(required)^~
_[Table][api.type.Table]._ Table containing options for the mesh &mdash; see the next section for details.


## Options Reference

The `options` table accepts the following parameters for the mesh:

##### vertices ~^(required)^~
_[Array][api.type.Array]._ An array of __x__ and __y__ coordinates of vertices forming the mesh. Meshes are built with these vertices depending on the `mode` parameter.

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the mesh. If included here, this will override any `parent` definition specified outside of the `options` table.

##### x / y ~^(optional)^~
_[Numbers][api.type.Number]._ The location of the object relative to its parent. If included here, these will override any `x` or `y` definitions specified outside of the `options` table.

##### mode ~^(optional)^~
_[String][api.type.String]._ String indicating how the mesh should be formed with the provided vertices. Default is `"triangles"`. Acceptable values are `"triangles"`, `"strip"`, `"fan"`, or `"indexed"`. See [Mesh Draw Modes](#modes) below for a description of each mode.

##### indices ~^(optional)^~
_[Array][api.type.Array]._ An array of indices required for `mode` type of `"indexed"`. For example, to mimic the behavior of the `"strip"` mode, the value of this parameter could be <nobr>`{ 1,2,3, 2,3,4, 3,4,5 }`</nobr>.

##### zeroBasedIndices ~^(optional)^~
_[Boolean][api.type.Boolean]._ Convenience parameter with default of `false`. If set to `true`, the `indices` array will be treated as a <nobr>zero-based</nobr> array.

##### uvs ~^(optional)^~
_[Array][api.type.Array]._ An array of __u__ and __v__ texture coordinates of vertices forming the mesh. If omitted or invalid, UVs will be automatically assigned based on normalized `vertices` values. Texture coordinates are normalized coordinates where `0,0` is the <nobr>top-left</nobr> corner of the image and `1,1` is the <nobr>bottom-right</nobr> corner of the image.


<a id="modes"></a>

## Mesh Draw Modes

<div style="max-width: 600px;">

![][images.simulator.meshes]

</div>

### triangles/indexed

Meshes with a `mode` of `"triangles"` or `"indexed"` are formed with disjointed groups of three consecutive vertices. An example of a `"triangles"` mode could have vertices with indices `1,2,3`, `4,5,6`, and `7,8,9`. Note, however, that the `"triangles"` mode may result in duplicate vertices shared by several triangles &mdash; to avoid this, you can use the `"indexed"` type and define an `indices` table with indices pointing to the vertices used.

While these methods can be used to encode any mesh, they both have some duplication if a vertex is used by several triangles. In the case of `"triangles"`, this is the vertices themselves. In the case of `"indexed"`, this is the vertex indices. Duplicating indices is much cheaper because they're single integer numbers, not an entire vertex with coordinates and texture coordinates.

In some cases, this duplication can be avoided via the `"strip"` or `"fan"` mode (see&nbsp;below).

### strip

Meshes with a `mode` of `"strip"` are formed with three consecutive vertices. An example could have vertices with indices `1,2,3`, `2,3,4`, and `3,4,5`. For more information on this type, see [here](https://en.wikipedia.org/wiki/Triangle_strip).

### fan

Meshes with a `mode` of `"fan"` are formed with an initial vertex and two ending vertices. An example could have vertices with indices `1,2,3`, `1,3,4`, and `1,4,5`. For more information on this type, see [here](https://en.wikipedia.org/wiki/Triangle_fan).


## Gotchas

* Vertices will be visually shifted so that the center of the mesh will be at the origin of the object. This does not change values when accessing vertices.

* The origin will not be adjusted to the center of the mesh when modifying the mesh.

* When referencing the `index` parameter of any method, you must point to an existing vertex.
 
* If an invalid mesh is requested, this function will return `nil`.

* Setting the stroke for a mesh with `mode` value of `"triangles"` or `"indices"` can impact performance if the mesh has a lot of vertices.

## Methods

_(Inherits properties from [ShapeObject][api.type.ShapeObject])_

Shape objects have a `path` property that exposes methods to manipulate the mesh. Most methods accept the `index` parameter which is the Lua array index of the vertex in question (the&nbsp;first vertex would have an index&nbsp;of&nbsp;`1`). All arguments are [numbers][api.type.Number].

##### object.path:setVertex()
Sets the vertex with index `index` to coordinates `x` and `y`:

	object.path:setVertex( index, x, y )

##### object.path:getVertex()
Returns two [numbers][api.type.Number] corresponding to a vertex's coordinates:

	object.path:getVertex( index )

##### object.path:setUV()
Sets the vertex with index `index` to texture coordinates `u` and `v`:

	object.path:setUV( index, u, v )

##### object.path:getUV()
Returns two [numbers][api.type.Number] corresponding to a vertex's texture coordinates:

	object.path:getUV( index )

##### object.path:getVertexOffset()
Returns two [numbers][api.type.Number] corresponding to the horizontal and vertical offsets applied when moving the origin to the center of the mesh. You can offset the mesh object by these values to compensate for initial shift and get precise vertex positions in world coordinates.

<div style="margin-bottom: -10px;">

	object.path:getVertexOffset()

</div>

Note that a vertex with coordinates `x` and `y` will have world coordinates of <nobr>`mesh.x + x - offsetX`</nobr> and <nobr>`mesh.y + y - offsetY`</nobr> respectively, assuming no scaling is applied. Consider the following command which shifts the object by the offsets and puts a vertex at `0,0` into the previous object origin:

``````lua
mesh:translate( mesh.path:getVertexOffset() )
``````

##### object.path:update()
Updates the mesh’s `vertices`, `uvs` and `indices`:

<div style="margin-bottom: -10px;">

	object.path:update( options )

</div>

The `options` table accepts the `vertices`, `uvs` and `indices` for updating the mesh. These are all optional and can be excluded at will:

``````lua
local options = {
	vertices = {},
	uvs = {},
	indices = {}
}
mesh.path:update( options )
``````


## Examples

##### Triangles Mode

`````lua
local mesh = display.newMesh(
	{
		x = 100,
		y = 100,
		mode = "triangles",
		vertices = {
			0,0, 50,0, 0,100,
			0,100, 50,0, 100,100,
			100,100, 50,0, 100,0
		},
		uvs = {
			0,0, 0.5,0, 0,1,
			0,1, 0.5,0, 1,1,
			1,1, 0.5,0, 1,0
		}
	})
mesh:translate( mesh.path:getVertexOffset() )  -- Translate mesh so that vertices have proper world coordinates

mesh.fill = { type="image", filename="cat.png" }

local vertexX, vertexY = mesh.path:getVertex( 3 )
mesh.path:setVertex( 3, vertexX, vertexY-10 )
`````

##### Indexed Mode

`````lua
local mesh = display.newMesh(
	{
		x = 100,
		y = 100,
		mode = "indexed",
		vertices = {
			0,0, 0,100, 50,0, 100,100, 100,0
		},
		indices = {
			1,2,3,
			2,3,4,
			3,4,5
		}
	})
mesh:translate( mesh.path:getVertexOffset() )  -- Translate mesh so that vertices have proper world coordinates

mesh.fill = { type="image", filename="cat.png" }

local vertexX, vertexY = mesh.path:getVertex( 3 )
mesh.path:setVertex( 3, vertexX, vertexY-10 )
`````

##### Strip Mode

`````lua
local mesh = display.newMesh(
	{
		x = 100,
		y = 100,
		mode = "strip",
		vertices = {
			0,0, 0,100,
			50,0, 100,100,
			100,0
		}
	})
mesh:translate( mesh.path:getVertexOffset() )  -- Translate mesh so that vertices have proper world coordinates

mesh.fill = { type="image", filename="cat.png" }

local vertexX, vertexY = mesh.path:getVertex( 3 )
mesh.path:setVertex( 3, vertexX, vertexY-10 )
`````

##### Fan Mode

`````lua
local mesh = display.newMesh(
	{
		x = 100,
		y = 100,
		mode = "fan",
		vertices = {
			50,0,
			0,0, 0,100, 100,100, 100,0
		}
	})
mesh:translate( mesh.path:getVertexOffset() )  -- Translate mesh so that vertices have proper world coordinates

mesh.fill = { type="image", filename="cat.png" }

local vertexX, vertexY = mesh.path:getVertex( 3 )
mesh.path:setVertex( 3, vertexX, vertexY-10 )
`````
