# Shapes — Paths, Fills, Strokes

[Shape objects][api.type.ShapeObject] are display objects whose geometry encloses an area defined by a boundary.

<div class="guides-toc">

* [Creating Shapes](#creating)
* [Shape Paths](#paths)
* [Fills and Strokes](#fillstroke)

</div>


<a id="creating"></a>

## Creating Shapes

Shapes can be created with the following methods:

<div class="inner-table">

Object					Method
----------------------	------------------
Rectangle				[display.newRect()][api.library.display.newRect]
Rounded Rectangle		[display.newRoundedRect()][api.library.display.newRoundedRect]
Circle					[display.newCircle()][api.library.display.newCircle]
Polygon					[display.newPolygon()][api.library.display.newPolygon]
Line					[display.newLine()][api.library.display.newLine]
Mesh					[display.newMesh()][api.library.display.newMesh]
----------------------	------------------

</div>


<a id="paths"></a>

## Shape Paths

Most shapes have a `object.path` property. This property has limited child properties which let you manipulate specific aspects of the shape. These aspects can either be set explicitly or animated via a [transition][guide.media.transitionLib].

### Rectangle

All [rectangle][api.library.display.newRect] objects have a [RectPath][api.type.RectPath]. The `width` and `height` of this path can be manipulated, and you can achieve [quadrilateral distortion][guide.graphics.3D] by manipulating any of the four corner points of the path.

``````lua
local rect = display.newRect( 160, 240, 150, 50 )
rect.path.x1 = -50

transition.to( rect.path, { time=2000, height=100, x1=0 } )
``````

### Rounded Rectangle

All [rounded rectangle][api.library.display.newRoundedRect] objects have a [RoundedRectPath][api.type.RoundedRectPath]. The width and height of this path can be manipulated, along with the radius of the corners.

``````lua
local roundedRect = display.newRoundedRect( 160, 240, 150, 50, 10 )
roundedRect.path.radius = 20

transition.to( roundedRect.path, { time=2000, width=100, height=100, radius=5 } )
``````

### Circle

All [circle][api.library.display.newCircle] objects have a [CirclePath][api.type.CirclePath] for which the radius can be manipulated.

``````lua
local circle = display.newCircle( 160, 240, 10 )
circle.path.radius = 50

transition.to( circle.path, { time=2000, radius=10 } )
``````

### Mesh

All [mesh][api.library.display.newMesh] objects have a `path` property that exposes methods to manipulate the mesh. See the [display.newMesh()][api.library.display.newMesh] documentation for details.


<a id="fillstroke"></a>

## Fills and Strokes

All shapes have a [fill][api.type.ShapeObject.fill] and a [stroke][api.type.ShapeObject.stroke]. The fill of a shape is the interior area of the geometry, while the stroke of a shape is its boundary.

Corona uses the concept of [paint][api.type.Paint] to specify how fills and strokes are drawn. In general, paints are specified via [tables][api.type.Table] which contain the relevant data.

<div class="inner-table">

Paint											Purpose
----------------------------------------------	------------------
[Paint][api.type.Paint]							Fill/stroke an object with a solid color.
[BitmapPaint][api.type.BitmapPaint]				Fill/stroke an object with an image.
[CompositePaint][api.type.CompositePaint]		Used for multi-texture fills/strokes.
[GradientPaint][api.type.GradientPaint]			Used for linear gradient fills/strokes.
[ImageSheetPaint][api.type.ImageSheetPaint]		Fill/stroke an object with an [image sheet][api.library.graphics.newImageSheet] frame.
----------------------------------------------	------------------

</div>
