
# Extending Anchor Points

In Corona, all display objects have an __anchor&nbsp;point__. Essentially, this can be imagined as a "pin" point within the object's bounds around which all transforms occur&nbsp;&mdash; __x__/__y__ positioning, rotation, scaling, etc. For example, if an object's anchor point is set at the <nobr>top-left</nobr> corner, rotation of the object will cause it to rotate around that point.


## Anchor Overview

<div class="float-right" style="max-width: 244px; margin-bottom: 16px; clear: both;">

![][images.docs.anchor-diagram]

</div>

By default, anchor points are set via the object properties of `anchorX` and `anchorY`. The value of these are typically decimal values between `0.0` and `1.0`, with this basic representation:

* `0.0` represents the __top__ or __left__ edge.
* `0.5` (default) represents the __center__.
* `1.0` represents the __bottom__ or __right__ edge.

Naturally, values between <nobr>(`0.1`, `0.25`, `0.84`, etc.)</nobr> are also valid&nbsp;&mdash; these three representations simply serve as a basic reference and you're not constrained to them.

As an example, to set an anchor point at the <nobr>top-left</nobr> corner of an object, set both anchor points to `0.0` <nobr>(or simply `0`)</nobr>:

``````{ brush="lua" gutter="false" first-line="1" highlight="[4,5]" }
local object = display.newRect( 150, 150, 100, 100 )

-- Set anchor to top-left
object.anchorX = 0
object.anchorY = 0

-- Transition the object to test anchor point
transition.to( object, { time=2000, rotation=45, delay=500 } )
``````

Similarly, to set the anchor at the <nobr>bottom-right</nobr> of an object, set both anchor values to `1.0` <nobr>(or simply `1`)</nobr>:

``````{ brush="lua" gutter="false" first-line="1" highlight="[4,5]" }
local object = display.newRect( 150, 150, 100, 100 )

-- Set anchor to bottom-right
object.anchorX = 1
object.anchorY = 1

-- Transition the object to test anchor point
transition.to( object, { time=2000, rotation=45, delay=500 } )
``````

Anchor points can also be set to some interior point as well, for example 25% from the left edge:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4]" }
local object = display.newRect( 150, 150, 100, 100 )

object.anchorX = 0.25
object.anchorY = 0.25

-- Transition the object to test anchor point
transition.to( object, { time=2000, rotation=45, delay=500 } )
``````


## Extending Anchor Points

The default "clamped" values of `0.0` to `1.0` accomodate the majority of usage cases, from any point along an object's outer edge to any point within&nbsp;it&nbsp;&mdash; but what if we wanted to set the anchor point to some theoretical point __outside__ of the object's bounds?

The first mandatory step in __extending&nbsp;anchor&nbsp;points__ is to disable the `"isAnchorClamped"` setting of [display.setDefault()][api.library.display.setDefault]:

``````lua
display.setDefault( "isAnchorClamped", false )
``````

Now, anchor points set to values __outside__ the <nobr>`0.0`–`1.0`</nobr> range will be honored:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4]" }
local object = display.newRect( 150, 150, 100, 100 )

object.anchorX = -1
object.anchorY = 1.5

-- Transition the object to test anchor point
transition.to( object, { time=2000, rotation=45, delay=500 } )
``````

One specific example where this approach is useful is rotating one object around another object, like a planet orbiting the sun. If the anchor point was clamped to points inside or along the object's edge, it could only rotate in a limited perspective, but with `"isAnchorClamped"` set to `false`, we can easily make the planet orbit the sun:

``````lua
display.setDefault( "isAnchorClamped", false )

local sun = display.newCircle( display.contentCenterX, display.contentCenterY, 24 )
sun:setFillColor( 1.0, 0.78, 0 )

local earth = display.newCircle( display.contentCenterX, display.contentCenterY, 6 )
earth:setFillColor( 0, 0.5, 0.7 )
earth.anchorX = -10.0

transition.to( earth, { time=8000, rotation=-360, iterations=0 } )
``````


## Pixels vs. Range

As illustrated above, setting an anchor point is based on a __range__ relative to the object's bounds: `0` is top/left, `0.5` is center, `1` is bottom/right, etc. Similarly, assuming anchor clamping is disabled, a value of `2.0` extends the anchor 200% right or down from the <nobr>top-left</nobr> corner an object, while `-0.5` extends it 50% above or left of the <nobr>top-left</nobr> corner.

This is logical enough, but what if we needed to set the anchor at a specific __pixel__ point within an object or a specific pixel distance outside its bounds? For example, what if an object was 86&times;90 pixels in size and we wanted to set its anchor at 12 pixels in from the <nobr>top-left</nobr> point?

Doing so is easily accomplished with some basic math. Simply take the pixel inset (12) and divide it by the width of the example object (86), setting that as the object's `anchorX` value. Then do the same for the __y__ anchor, dividing 12 by 90 and setting that value as `anchorY`:

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4]" }
local object = display.newRect( 150, 150, 86, 90 )

object.anchorX = 12 / object.contentWidth   -- 0.13953488372093
object.anchorY = 12 / object.contentHeight  -- 0.133333333333333
``````

Note that if you're extending an anchor point outside of an object's bounds, you may need to factor in half of the object's width. For instance, assuming the orange circle below is 100&times;100 pixels in size, and you want its anchor point to be far to the left (end&nbsp;of the blue&nbsp;line), the proper calculation would be `-400/100` and thus `-4` for `anchorX`.

<div style="max-width: 530px; margin-top: 16px; margin-bottom: 16px;">

![][images.docs.anchor-extend]

</div>

Why `-4` instead of `-4.5`? Because, as you can see in the diagram, the desired anchor point is 400 pixels outside the __left__ edge of the circle, and since `0` represents the circle's left edge, the portion of the blue line that extends into the center of the circle (50&nbsp;pixels) can be disregarded.


## Conclusion

With this optional setting, you have access to virtually any anchor point inside __or__ outside an object's bounds, and with some simple math, you can even pinpoint an anchor point at a pixel location relative to an object's bounds.
