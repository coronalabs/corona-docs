# Transforms and Anchors

In Corona, every [display object][guide.media.displayObjects] has properties which affect where and how it is rendered on screen. This guide explains how transforms and anchors apply to object rendering.

<div class="guides-toc">

* [Transforms](#transforms)
* [Anchors](#anchors)

</div>


<a id="transforms"></a>

## Transforms

In terms of transforms &mdash; scale, rotation, and position &mdash; the __origin__ is the point around which all transforms occur. The following properties and methods pertain to transforms:

<div class="inner-table" style="margin-bottom: 25px;">

Transform		Methods and Properties
--------------	--------------------------
Scale			[object.xScale][api.type.DisplayObject.xScale], [object.yScale][api.type.DisplayObject.yScale], [object:scale()][api.type.DisplayObject.scale]
Rotation		[object.rotation][api.type.DisplayObject.rotation], [object:rotate()][api.type.DisplayObject.rotate]
Position		[object.x][api.type.DisplayObject.x], [object.y][api.type.DisplayObject.y], [object:translate()][api.type.DisplayObject.translate]
--------------	--------------------------

</div>

When applying transforms in sequence, Corona calculates a transform matrix for the display object and applies the properties in a specific order:

1. Scale
2. Rotation
3. Position

<div class="guide-notebox">
<div class="notebox-title">Note</div>

Transforms are always relative to the parent, so the final transform includes the transforms of the object's parents (and&nbsp;ancestors). See __Group&nbsp;Transforms__ in the [Group Programming][guide.graphics.group] guide for more information.

</div>




<a id="anchors"></a>

## Anchors

The __anchor__ of an object controls how geometry is positioned relative to the object's origin. This is specified via the [object.anchorX][api.type.DisplayObject.anchorX] and [object.anchorY][api.type.DisplayObject.anchorY] properties.

An anchor pair of `(0.5,0.5)` (default) centers the geometry about the origin. An anchor pair of `(0,0)` makes the <nobr>top-left</nobr> of the geometry's bounds the origin, while an anchor pair of `(1,1)` makes it the <nobr>bottom-right</nobr> of the geometry's bounds. By default, anchor values must range from `0.0` to `1.0` and the anchor of new objects is set to `(0.5,0.5)`, however these defaults can be modified via [display.setDefault()][api.library.display.setDefault].

When you change an anchor value, the object's origin does __not__ change. Instead the geometry moves relative to the origin. In the following diagram, the blue square is rotated to illustrate how geometry is transformed around the origin depending on the anchor <nobr>(`object.anchorX`,`object.anchorY`)</nobr>.

![](/images/sdk/graphics/Anchor-Point.gif)

### Group Anchors

Most [display objects][guide.media.displayObjects] have anchors <nobr>pre-enabled</nobr>. However, [group][api.type.GroupObject] objects do not honor anchors by default, so you must set the [anchorChildren][api.type.GroupObject.anchorChildren] property to enable its anchor. See <nobr>__Groups and Anchors__</nobr> in the [Group Programming][guide.graphics.group] guide for more information.
