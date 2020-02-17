
# physics.addBody()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [physics.*][api.library.physics]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          bodies, physics, body, shape, outline
> __See also__          [Physics Bodies][guide.physics.physicsBodies] _(guide)_
>						[physics.removeBody()][api.library.physics.removeBody]
>						[graphics.newOutline()][api.library.graphics.newOutline]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function turns almost any Corona display object into a simulated physical object with specific physical properties. It accepts the display object, an optional body type (string), and an optional `params` table containing <nobr>key-value</nobr> pairs that specify the properties for the physics body. Within this `params` table, the following apply:

* If a `radius` value is specified, the body boundaries will be circular, centered at the middle of the display object used to create the physics body.

* If a `shape` table is specified, the body boundaries will follow the polygon provided by the shape. Note that the maximum number of sides per shape is eight (8), and all angles must be __convex__. Specifying a `shape` table will override a `radius` property, if both are specified in the same element. Note that the shape coordinates must be defined in __clockwise__ order, and the first and last vertex must be different.

* A complex body may be constructed by specifying multiple body elements and shapes. For example, if the overall shape of the object is concave or if the shape has more than eight sides, you can use multiple body elements to construct it. See the [Physics Bodies][guide.physics.physicsBodies] guide for more information.

* An optional `box` table allows you to create an offset/angled rectangular body using values for `halfWidth`, `halfHeight`, `x` (offset), `y` (offset), and `angle`.

* Edge shape (chain) bodies can be defined via a `chain` array. See below for details.

* If an `outline` table is specified, the body boundaries will follow the outline provided by [graphics.newOutline()][api.library.graphics.newOutline].


## Gotchas

* When you turn a display object into a physics object, the physics engine "owns" the object and has its own rules about the object. The engine also assumes that the anchor point is at the center of the object.

* When handling collisions with multi-element bodies, the body element index is reported as part of each collision event, so it's possible to detect which specific part of a complex body is involved in a collision. See the [Collision Detection][guide.physics.collisionDetection] guide for more information.

* If you change the [anchorX][api.type.DisplayObject.anchorX] or [anchorY][api.type.DisplayObject.anchorY] property of a display object before adding a physics body, the body will be positioned properly relative to the adjusted anchor. However, you should __not__ change the anchor point after adding the body or the object and body will be misaligned.

* You can [scale][api.type.DisplayObject.scale] the display object up or down, but the physics engine will still consider the object as it was before the applied scale values. Essentially, it will visually reflect the applied scale values, but the collision bounds of the body will remain the same as the original body definition.

* You should not add a physics body to a [line][api.library.display.newLine] object created with [display.newLine()][api.library.display.newLine], unless the body type is `"static"`.

* This call cannot be used in a collision event. However, your collision handler may set a flag or include a time delay via [timer.performWithDelay()][api.library.timer.performWithDelay] so that the action can occur in the next application cycle or later. See the [Collision Detection][guide.physics.collisionDetection] guide for a complete list of which APIs and methods are subject to this rule.

* For further information and limitation notes, see the [Physics Bodies][guide.physics.physicsBodies] guide and [Physics Notes/Limitations][guide.physics.limitations].


## Syntax

	physics.addBody( object, [bodyType,] [params] )

##### object ~^(required)^~
_[DisplayObject][api.type.DisplayObject]._ The display object to add a physics body to.

##### bodyType ~^(optional)^~
_[String][api.type.String]._ The body type may be specified in an optional string parameter before the first body element. The possible types are `"static"`, `"dynamic"` and `"kinematic"`. The default type is `"dynamic"` if no value is specified. See [object.bodyType][api.type.Body.bodyType] for more information.

##### params ~^(optional)^~
_[Table][api.type.Table]._ A table of key-value pairs that specifies the properties of the body — see the next section for details. For <nobr>multi-element</nobr> bodies, multiple distinct `params` tables can be declared in a <nobr>comma-delimited</nobr> series (one&nbsp;for each body element).


## Parameter Reference

The `params` table includes the properties for the physics body.

### Core Parameters

##### density ~^(optional)^~
_[Number][api.type.Number]._ Multiplied by the area of the body’s shape to determine mass. Based on a standard value of `1.0` for water. Lighter materials (such as wood) have a density below `1.0`, and heavier materials (such as stone) have a density greater than `1.0`. Default value is `1.0`.

##### friction ~^(optional)^~
_[Number][api.type.Number]._ May be any non-negative value; a value of `0.0` means no friction and `1.0` means fairly strong friction. The default value is `0.0`.

##### bounce ~^(optional)^~
_[Number][api.type.Number]._ Determines how much of an object's velocity is returned after a collision. The default value is `0.2`.

##### isSensor ~^(optional)^~
_[Boolean][api.type.Boolean]._ Sets the body as a [sensor][api.type.Body.isSensor]. A&nbsp;sensor is a fixture that detects collisions but does not produce a physical response.

##### filter ~^(optional)^~
_[Table][api.type.Table]._ Filter values. See [Collision Detection][guide.physics.collisionDetection] for more information.

* `categoryBits = cb` where `cb` is the category of object (generally only one bit set). Defaults to `0x0001` if not set.
* `maskBits = mb`, where `mb` is the categories that the shape would accept for collision. Defaults to `0xFFFF`.
* `groupIndex = gb`, where `gb` specifies that a certain group of objects will never collide (negative) or always collide (positive). Defaults to `0` (disabled). If `groupIndex` is set to non-zero, it overrides the `maskBits` setting.

### Circular Body

##### radius
_[Number][api.type.Number]._ Radius of the bounding circle.

### Polygonal Body

##### shape
_[Array][api.type.Array]._ Shape array containing the shape's vertices: `{ x1,y1, x2,y2, ..., xn,yn }`. For example `pentagonShape = { 0,-37, 37,-10, 23,34, -23,34, -37,-10 }`. The coordinates must be defined in __clockwise__ order, and the resulting shape must be __convex__ at all angle points. The physics engine assumes that the `0,0` point is the center of the object. A negative __x__ will be to the left of object's center and a negative __y__ will be top of object's center.

### Offset/Angled Rectangular Body

##### box
_[Table][api.type.Table]._ A table of <nobr>key-value</nobr> pairs including:

* `halfWidth` &mdash; Half of the body width. This property is required.
* `halfHeight` &mdash; Half of the body height. This property is required.
* `x` &mdash; The __x__ offset (&plusmn;) from the display object's center. If you offset the body along the __x__ axis, you must also specify the __y__ offset, even if no offset should occur along that axis <nobr>(simply specify `y=0`)</nobr>.
* `y` &mdash; The __y__ offset (&plusmn;) from the display object's center. If you offset the body along the __y__ axis, you must also specify the __x__ offset, even if no offset should occur along that axis <nobr>(simply specify `x=0`)</nobr>.
* `angle` &mdash; The angle (rotation) of the body. This property is optional and defaults to `0`.

### Edge Shape (Chain) Body

##### chain
_[Array][api.type.Array]._ An array of vertices to define the edge shape. Edge shapes are not restricted to convex angles like polygonal bodies.

##### connectFirstAndLastChainVertex ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the first and last vertices will be joined by a straight line. If set to `false` (default), the edge shape will have disconnected ends.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

You should not construct an edge shape body with <nobr>self-intersecting</nobr> segments&nbsp;&mdash; in other words, your definition of vertices should not result in any segments of the chain intersecting with other segments. Doing so many break the expected collision detection of the shape.

</div>

### Outline Body

##### outline
_[Array][api.type.Array]._ An outline array generated by [graphics.newOutline()][api.library.graphics.newOutline]. `outline` has fewer restrictions than `shape`, for example, an outline can be either convex or concave.


## Examples

##### Rectangular Body

`````lua
local sky = display.newImage( "bkg_clouds.png" )
sky.x = 160; sky.y = 195
 
local ground = display.newImage( "ground.png" )
ground.x = 160; ground.y = 445
 
physics.addBody( ground, "static", { friction=0.5, bounce=0.3 } )
 
local crate = display.newImage( "crate.png" )
crate.x = 180; crate.y = -50; crate.rotation = 5
 
physics.addBody( crate, { density=3.0, friction=0.5, bounce=0.3 } )
`````

##### Circular Body

`````lua
local ball = display.newImage( "ball.png" )
 
physics.addBody( ball, { density=1.0, friction=0.3, bounce=0.2, radius=25 } )
`````

##### Polygonal Body

`````lua
local pentagon = display.newImage("pentagon.png")
 
local pentagonShape = { 0,-37, 37,-10, 23,34, -23,34, -37,-10 }
 
physics.addBody( pentagon, { density=3.0, friction=0.8, bounce=0.3, shape=pentagonShape } )
`````

##### Multi-Element Body

``````lua
local nebula = display.newImage( "nebula.png" )
nebula.x, nebula.y = display.contentCenterX, display.contentCenterY

local podT = {1,-89, 14,-83, 20,-70, 14,-57, 1,-51, -12,-57, -18,-70, -12,-83}
local podR = {69,-20, 82,-14, 88,-1, 82,12, 69,18, 56,12, 50,-1, 56,-14}
local podB = {1,49, 14,55, 20,68, 14,81, 1,87, -12,81, -18,68, -12,55}
local podL = {-70,-20, -57,-14, -51,-1, -57,12, -70,18, -83,12, -89,-1, -83,-14}

physics.addBody( nebula, "dynamic",
	{ friction=0.2, bounce=0.4, shape=podT },
	{ friction=0.8, bounce=0.0, shape=podR },
	{ friction=0.8, bounce=0.0, shape=podB },
	{ friction=0.2, bounce=0.4, shape=podL }
)
``````

##### Offset/Angled Rectangular Body

`````lua
local body = display.newRect( 100, 200, 40, 40 )

local offsetRectParams = { halfWidth=5, halfHeight=10, x=10, y=0, angle=60 }

physics.addBody( body, "dynamic", { box=offsetRectParams } )
`````

##### Edge Shape (Chain) Body

`````lua
local body = display.newRect( 150, 200, 40, 40 )

physics.addBody( body, "static",
	{
		chain={ -120,-140, -100,-90, -80,-60, -40,-20, 0,0, 40,0, 70,-10, 110,-20, 140,-20, 180,-10 },
		connectFirstAndLastChainVertex = true
	}
)
`````

##### Outline Body

`````lua
local image_name = "star.png"

local image_outline = graphics.newOutline( 2, image_name )

local image_star = display.newImageRect( image_name, 32, 32 )

physics.addBody( image_star, { outline=image_outline } )
`````
