# Physics Joints

This guide discusses how to configure the various physical Box2D joints available in Corona.

<div class="guides-toc">

* [Overview](#overview)
* [Creation and Removal](#createremove)
* [Shared Properties/Methods](#common)

</div>
<div class="guides-toc">

* [Pivot Joint](#pivot)
* [Distance Joint](#distance)
* [Piston Joint](#piston)
* [Friction Joint](#friction)
* [Weld Joint](#weld)
* [Wheel Joint](#wheel)
* [Pulley Joint](#pulley)
* [Touch Joint](#touch)
* [Rope Joint](#rope)
* [Gear Joint](#gear)

</div>




<a id="overview"></a>

## Overview

Joints can be used to assemble complex physical objects from multiple rigid bodies. For example, joints can be used to join the limbs of a ragdoll figure, attach the wheels of a vehicle to its body, create a moving elevator platform, and more.




<a id="createremove"></a>

## Creation and Removal

Most joints are used to connect two rigid physical bodies, so you must create these bodies first and then submit them as arguments to the [physics.newJoint()][api.library.physics.newJoint] constructor function, along with other properties that vary depending on the joint type (see&nbsp;details&nbsp;below).

``````
physics.newJoint( jointType, ... )
``````

If a joint is no longer needed, you can destroy it by calling either [object:removeSelf()][api.type.Joint.removeSelf] or [display.remove()][api.library.display.remove]:

``````lua
joint:removeSelf()
``````

``````lua
display.remove( joint )
``````

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If one of the joined bodies is destroyed, the associated joint will be automatically destroyed. However, remember to properly remove and `nil` any references to a joint which has been destroyed.

</div>
</div>




<a id="common"></a>

## Shared Properties/Methods

The following properties and methods apply to all joint types:

* [joint:getAnchorA()][api.type.Joint.getAnchorA], [joint:getAnchorB()][api.type.Joint.getAnchorB] &mdash; These functions return the __x__ and __y__ coordinates of either anchor point in content space, where `A` and `B` are the two joined bodies.

<div class="code-indent">

``````lua
local ax, ay = myJoint:getAnchorA()
local bx, by = myJoint:getAnchorB()
``````

</div>

* [joint:getLocalAnchorA()][api.type.Joint.getLocalAnchorA], [joint:getLocalAnchorB()][api.type.Joint.getLocalAnchorB] &mdash; These functions return the __x__ and __y__ coordinates of either anchor point, relative to object `A` or `B` which are the two joined bodies. Does not apply to [touch](#touch) or [pulley](#pulley) joints.

<div class="code-indent">

``````lua
local ax, ay = myJoint:getLocalAnchorA()
local bx, by = myJoint:getLocalAnchorB()
``````

</div>

* [joint:getReactionForce()][api.type.Joint.getReactionForce] &mdash; This function returns the reaction force in Newtons at the joint anchor in the second body.

<div class="code-indent">

``````lua
local reactionForceX, reactionForceY = myJoint:getReactionForce()
``````

</div>

* [joint.isActive][api.type.Joint.isActive] &mdash; This read-only boolean value indicates whether a joint is active or inactive.

* [joint.isCollideConnected][api.type.Joint.isCollideConnected] &mdash; This read-only boolean value specifies if the joined objects follow the standard collision rules (`true`) or not (`false`).

* [joint.reactionTorque][api.type.Joint.reactionTorque] &mdash; This read-only value indicates the reaction torque in N*m at the joint anchor in the second body.




<a id="pivot"></a>

## Pivot Joint

A pivot joint, known as a __revolute__ joint in Box2D terms, joins two bodies at an overlapping point, like two boards joined by a rotating peg. The initial arguments are bodies `A` and `B` to join, followed by the __x__ and __y__ coordinates for the anchor point, declared in content space coordinates.

``````lua
local pivotJoint = physics.newJoint( "pivot", bodyA, bodyB, anchor_x, anchor_y )
``````

<div class="float-right" style="max-width: 308px; margin-top: 12px;">

![][images.simulator.joint-pivot]

</div>

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If you're building a complex assembly like a ragdoll with pivot joints and you're experiencing instability issues, consider setting [physics.setContinuous()][api.library.physics.setContinuous] to `true`.

</div>
</div>

### Joint Motor

Optionally, object `B` joined with a pivot joint to object `A` can be driven (rotated) with a joint motor. This rotation can be either clockwise or <nobr>counter-clockwise,</nobr> depending on the `motorSpeed` value. Note that joint motors have a fairly weak maximum torque by default, so setting `motorSpeed` may appear to have little visible effect. Therefore, you should generally set `maxMotorTorque` to a high value such as `100000` if you're trying to move any significant mass, such as rotating a wheel to power a car.

* [pivotJoint.isMotorEnabled][api.type.Joint.isMotorEnabled] &mdash; This must be set to `true` to enable any motor action on a pivot joint.

* [pivotJoint.motorSpeed][api.type.Joint.motorSpeed] &mdash; This [number][api.type.Number] value specifies the intended rotational motor speed.

* [pivotJoint.maxMotorTorque][api.type.Joint.maxMotorTorque] &mdash; This [number][api.type.Number] value specifies the maximum allowed torque for the joint motor.

* [pivotJoint.motorTorque][api.type.Joint.motorTorque] &mdash; Read-only [number][api.type.Number] value indicating the current motor torque.

### Rotation Limits

Pivot joints can optionally be constrained in their range of rotation. For example, if constructing a ragdoll figure, the head/neck joint would likely have a limited range of angular motion in either the clockwise or <nobr>counter-clockwise</nobr> direction.

* [pivotJoint.isLimitEnabled][api.type.Joint.isLimitEnabled] &mdash; Set this to `true` to constrain the pivot joint rotation limits.

* [pivotJoint:setRotationLimits()][api.type.Joint.setRotationLimits] &mdash; Function which accepts two values, in degrees, defining the negative and positive limits of rotation. For example, if you want to limit the rotation somewhat tightly in relation to the upward axis (`0`), these values may be `-10` and `10` respectively. Note that these values remain in relation to the rotation of body `A`, meaning that if body `A` rotates after the joint is declared, these rotation limits will remain in rotational synchronization with that body.

<div class="code-indent" style="width: 600px;">

``````lua
pivotJoint.isLimitEnabled = true
pivotJoint:setRotationLimits( -20, 20 )
``````

</div>

* [pivotJoint:getRotationLimits()][api.type.Joint.getRotationLimits] &mdash; Function which returns the current negative and positive rotation limits.

<div class="code-indent" style="width: 600px;">

``````lua
local negLimit, posLimit = pivotJoint:getRotationLimits()
print( negLimit, posLimit )
``````

</div>

### Other

* [pivotJoint.jointAngle][api.type.Joint.jointAngle] &mdash; Read-only [number][api.type.Number] value indicating the current angle of a pivot joint, in degrees.

* [pivotJoint.jointSpeed][api.type.Joint.jointSpeed] &mdash; Read-only [number][api.type.Number] value indicating the current rotation speed of a pivot joint.

* [pivotJoint.referenceAngle][api.type.Joint.referenceAngle] &mdash; Read-only [number][api.type.Number] value indicating the joint angle between the bodies at time of creation.




<a id="distance"></a>

## Distance Joint

A distance joint attaches two bodies at a fixed distance. The initial arguments are bodies `A` and `B` to join, followed by an __x__ and __y__ anchor point coordinate for each body, declared in content space coordinates.


``````lua
local distanceJoint = physics.newJoint( "distance", bodyA, bodyB, anchorA_x, anchorA_y, anchorB_x, anchorB_y )
``````

<div class="float-right" style="max-width: 308px; margin-top: 12px;">

![][images.simulator.joint-distance]

</div>

### Damping/Frequency

Optionally, the distance joint can be made soft, like a <nobr>spring-damper</nobr> connection. Many factors can influence the behavior of a soft distance joint, including the mass of the attached bodies and forces upon them, so you should carefully test the specified values to achieve the desired simulation.

* [distanceJoint.dampingRatio][api.type.Joint.dampingRatio] &mdash; This [number][api.type.Number] value can range from `0` (no&nbsp;damping) to `1` (critical&nbsp;damping). With critical damping, all oscillations should vanish.

* [distanceJoint.frequency][api.type.Joint.frequency] &mdash; This [number][api.type.Number] specifies the <nobr>mass-spring</nobr> damping frequency in Hz. A low value will make the joint extremely soft and cause it to contract with very low force.

* [distanceJoint.length][api.type.Joint.length] &mdash; This [number][api.type.Number] specifies the distance between the anchor points, which should not be zero or very short. If you position the bodies before applying a distance joint to them, this length will automatically be set as the distance between the anchor points, so it's usually not necessary to set this parameter.




<a id="piston"></a>

## Piston Joint

A piston joint, known as a __prismatic__ joint in Box2D terms, joins two bodies along a single, restricted axis of motion, like engine pistons or an elevator platform that is restricted to movement along a vertical axis. The initial arguments are bodies `A` and `B` to join, followed by an __x__ and __y__ coordinate for an anchor point on either body, followed by values which define the axis along which linear motion is allowed.

``````lua
local pistonJoint = physics.newJoint( "piston", bodyA, bodyB, anchor_x, anchor_y, axisX, axisY )
``````

<div class="float-right" style="max-width: 308px; margin-top: 12px;">

![][images.simulator.joint-piston]

</div>

### Motion Axis

As stated, piston joints have a restricted axis of linear motion, defined by `axisX` and `axisY`. This axis can be considered a directional vector indicating which way the object will move when driven by a positive [pistonJoint.motorSpeed][api.type.Joint.motorSpeed] value.

The following chart provides examples of the relationship between `axisX`, `axisY`, and a __positive__ motor speed. However, both `axisX` and `axisY` values can be decimal values ranging between `-1.0` and `1.0`&nbsp;&mdash; you are not restricted to these eight directions.

<div class="inner-table">

axisX		axisY		<nobr>Direction / Angle</nobr>
----------	----------	----------------------------------
`0`			`-1`		up / 0&deg;
`1`			`-1`		right-up / 45&deg;
`1`			`0`			right / 90&deg;
`1`			`1`			right-down / 135&deg;
`0`			`1`			down / 180&deg;
`-1`		`1`			left-down / 225&deg;
`-1`		`0`			left / 270&deg;
`-1`		`-1`		left-up / 315&deg;
----------	----------	----------------------------------

</div>

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* To limit motion distance along the linear axis in either direction, use the [pistonJoint:setLimits()][api.type.Joint.setLimits] function as illustrated below.

* The speed of motion is not controlled by the axis values, but rather by the [pistonJoint.motorSpeed][api.type.Joint.motorSpeed] property as explained in the next section.

* A negative motor speed will drive the object in the opposite direction of its defined axis vector.

</div>

<a id="piston-motor"></a>

### Joint Motor

Optionally, the piston joint can be driven with a joint motor. Unlike the rotational motor of the [pivot](#pivot) joint, this motion will be linear, restricted along the defined axis. For example, a piston joint motor can be used to move an elevator platform up and down along its axis.

* [pistonJoint.isMotorEnabled][api.type.Joint.isMotorEnabled] &mdash; This must be set to `true` to enable any motor action on a piston joint.

* [pistonJoint.motorSpeed][api.type.Joint.motorSpeed] &mdash; This [number][api.type.Number] value specifies the intended linear motor speed. A positive motor speed will drive the object in the direction of its defined axis vector, while a negative motor speed will drive it in the opposite direction.

* [pistonJoint.maxMotorForce][api.type.Joint.maxMotorForce] &mdash; This [number][api.type.Number] value specifies the maximum allowed force for the joint motor.

* [pistonJoint.motorForce][api.type.Joint.motorForce] &mdash; Read-only [number][api.type.Number] value indicating the current motor force.

### Motion Limits

Piston joints can optionally be constrained in their range of linear motion. The limits take the form of a lower and upper limit which define the range of motion (distance) along the axis defined by `axisX` and `axisY`.

* [pistonJoint.isLimitEnabled][api.type.Joint.isLimitEnabled] &mdash; Set this to `true` to limit the piston joint motion range.

* [pistonJoint:setLimits()][api.type.Joint.setLimits] &mdash; This function accepts two values which define the negative and positive range of motion. The second value should always be greater than or equal to the first value, since they define a range of motion (distance) along the axis.

<div class="code-indent" style="width: 600px;">

``````lua
pistonJoint.isLimitEnabled = true
pistonJoint:setLimits( -40, 120 )
``````

</div>

* [pistonJoint:getLimits()][api.type.Joint.getLimits] &mdash; This function returns the current negative and positive motion limits.

<div class="code-indent" style="width:600px;">

``````lua
local negLimit, posLimit = pistonJoint:getLimits()
print( negLimit, posLimit )
``````

</div>

### Other

* [pistonJoint:getLocalAxisA()][api.type.Joint.getLocalAxisA] &mdash; This function returns the current coordinates of the anchor point along the defined axis, in content space.

* [pistonJoint.jointTranslation][api.type.Joint.jointTranslation] &mdash; Read-only [number][api.type.Number] value indicating the current translation of a piston joint, meaning, the distance of movement that has occurred along the axis.

* [pistonJoint.jointSpeed][api.type.Joint.jointSpeed] &mdash; Read-only [number][api.type.Number] value indicating the current linear movement speed of a piston joint.

* [pistonJoint.referenceAngle][api.type.Joint.referenceAngle] &mdash; Read-only [number][api.type.Number] value indicating the joint angle between the bodies at time of creation.




<a id="friction"></a>

## Friction Joint

The friction joint is used to simulate <nobr>top-down</nobr> friction between two objects. This can be useful for simulating both translational (directional) friction and angular (rotational) friction between two joined objects. The initial arguments are bodies `A` and `B` to join, followed by an __x__ and __y__ coordinate for the anchor point.

``````lua
local frictionJoint = physics.newJoint( "friction", bodyA, bodyB, anchor_x, anchor_y )
``````

### Friction Values

When creating a friction joint, simulated friction can be applied via maximum force and torque values:

* [frictionJoint.maxForce][api.type.Joint.maxForce] &mdash; This [number][api.type.Number] specifies the maximum directional friction which may be applied to the joined body. A higher value simulates higher friction.

* [frictionJoint.maxTorque][api.type.Joint.maxTorque] &mdash; This [number][api.type.Number] specifies the maximum rotational friction which may be applied to the joined body. A higher value simulates higher friction.




<a id="weld"></a>

## Weld Joint

The weld joint rigidly attaches two bodies at a specified anchor point in content space coordinates.

``````lua
local weldJoint = physics.newJoint( "weld", bodyA, bodyB, anchor_x, anchor_y )
``````

<div class="float-right" style="max-width: 308px; margin-top: 12px;">

![][images.simulator.joint-weld]

</div>

### Damping/Frequency

Due to mathematical approximation, this joint may appear slightly soft during simulation, even if `dampingRatio` and `frequency` are set to prevent this behavior. If you want to assemble multiple shapes without any risk of flexing, consider creating a <nobr>multi-element</nobr> body as illustrated in the [Physics Bodies][guide.physics.physicsBodies] guide.

* [weldJoint.dampingRatio][api.type.Joint.dampingRatio] &mdash; This [number][api.type.Number] value can range from `0` (no&nbsp;damping) to `1` (critical&nbsp;damping). With critical damping, all oscillations should vanish.

* [weldJoint.frequency][api.type.Joint.frequency] &mdash; This [number][api.type.Number] value specifies the <nobr>mass-spring</nobr> damping frequency in Hz. A low value will make the joint extremely soft and allow for rotation around the anchor point.

### Positioning

Notice in the diagram that the two bodies don't necessarily need to overlap, and the joint anchor doesn't necessarily need to reside within one of the bodies. In fact, the two bodies can be completely separated and the weld joint will still join the bodies together as if a rigid, invisible link exists between them.

### Other

* [weldJoint.referenceAngle][api.type.Joint.referenceAngle] &mdash; Read-only [number][api.type.Number] value indicating the joint angle between the bodies at time of creation.




<a id="wheel"></a>

## Wheel Joint

A wheel joint, known as a __line__ joint in Box2D terms, is similar to a [piston](#piston) joint, except that the attached body can rotate freely like a wheel mounted to the shock absorber of a car. Most of its properties are inherited from the standard piston joint, but you can specify a <nobr>mass-spring</nobr> frequency and damping ratio. The initial arguments are bodies `A` and `B` to join, followed by an __x__ and __y__ coordinate for an anchor point on either body, followed by values which define the axis along which linear motion is allowed.

``````lua
local wheelJoint = physics.newJoint( "wheel", bodyA, bodyB, anchor_x, anchor_y, axisX, axisY )
``````

<div class="float-right" style="max-width: 308px; margin-top: 12px;">

![][images.simulator.joint-wheel]

</div>

### Motion Axis

Like the [piston](#piston) joint, wheel joints have a restricted axis of linear motion, defined by `axisX` and `axisY`. However, unlike piston joints, wheel joints aren't driven by a motor, so you can't send the wheel <nobr>(body `B` in the diagram)</nobr> moving in a specific direction based on the defined axis values. For example, setting these values to either `0,1` or `0,-1` will restrict motion to a vertical axis, but not restrict it to either upward __or__ downward along that axis. Similarly, values of either `1,0` or `-1,0` will restrict linear motion to either left __or__ right along a horizontal axis.

Essentially, the wheel&nbsp;&mdash; or rather the object that represents the wheel&nbsp;&mdash; is prone to whatever forces might be upon it, for instance gravity. The object will attempt to stay upon the defined axis, but other forces may pull/push the wheel off of that axis in unpredictable ways.

### Damping/Frequency

Optionally, the wheel joint can be made soft, like a <nobr>spring-damper</nobr> connection. Many factors can influence the behavior of a soft wheel joint, including the mass of the attached bodies and forces upon them, so you should carefully test the specified values to achieve the desired simulation.

* [wheelJoint.springDampingRatio][api.type.Joint.springDampingRatio] &mdash; This [number][api.type.Number] value can range from `0` (no&nbsp;damping) to `1` (critical&nbsp;damping). With critical damping, all oscillations should vanish.

* [wheelJoint.springFrequency][api.type.Joint.springFrequency] &mdash; This [number][api.type.Number] value specifies the <nobr>mass-spring</nobr> damping frequency in Hz. A low value will decrease simulated suspension. This value must be greater than `0`.

### Other

* [wheelJoint:getLocalAxisA()][api.type.Joint.getLocalAxisA] &mdash; This function returns the current coordinates of the anchor point along the defined axis, in content space.

* [wheelJoint.jointTranslation][api.type.Joint.jointTranslation] &mdash; Read-only [number][api.type.Number] value indicating the current translation of a wheel joint, meaning, the distance of movement that has occurred along the axis.

* [wheelJoint.jointSpeed][api.type.Joint.jointSpeed] &mdash; Read-only [number][api.type.Number] value indicating the current linear movement speed of a wheel joint.




<a id="pulley"></a>

## Pulley Joint

A pulley joint attaches two bodies with an imaginary rope whose length remains constant. If one body is pulled or pushed by some force, the other body will compensate according to the simulated rope. The initial arguments are bodies `A` and `B` to join, followed by two coordinate pairs which represent the stationary anchor points from where each side of the rope hangs. The next four arguments are the __x__ and __y__ anchor point coordinates <nobr>(one for each body),</nobr> followed by the final `ratio` value which can be adjusted to simulate a block and tackle setup.

``````lua
local pulleyJoint = physics.newJoint( "pulley", bodyA, bodyB, statA_x, statA_y, statB_x, statB_y, bodyA_x, bodyA_y, bodyB_x, bodyB_y, 1.0 )
``````

<div class="float-right" style="max-width: 308px; margin-top: 12px;">

![][images.simulator.joint-pulley]

</div>

### Pulley Ratio

The pulley joint features a `ratio` property as the final parameter in the constructor. This ratio can be adjusted to simulate a block and tackle arrangement. In such a scenario, one side of the pulley rope moves faster than the other. The default ratio is `1.0` which simulates a simple pulley.

* [pulleyJoint.ratio][api.type.Joint.ratio] &mdash; Read-only [number][api.type.Number] value indicating the current ratio for the pulley joint.

### Other

* [pulleyJoint:getGroundAnchorA()][api.type.Joint.getGroundAnchorA] &mdash; This function returns the __x__ and __y__ coordinates of the joint's first ground anchor in content coordinates.

* [pulleyJoint:getGroundAnchorB()][api.type.Joint.getGroundAnchorB] &mdash; This function returns the __x__ and __y__ coordinates of the joint's second ground anchor in content coordinates.

* [pulleyJoint.length1][api.type.Joint.length1] &mdash; Read-only [number][api.type.Number] value that, upon instantiation, indicates the distance in pixels between the first joint anchor point and its stationary pulley anchor point.

* [pulleyJoint.length2][api.type.Joint.length2] &mdash; Read-only [number][api.type.Number] value that, upon instantiation, indicates the distance in pixels between the second joint anchor point and its stationary pulley anchor point.




<a id="touch"></a>

## Touch Joint

A touch joint, known as a __mouse__ joint in Box2D, connects a single object to an <nobr>on-screen</nobr> target point. This can be used to move an object to a target point by a theoretical elastic joint with variable strength and elasticity. The initial arguments are the body `A` to connect followed by the __x__ and __y__ anchor point coordinates in content space.

``````lua
local touchJoint = physics.newJoint( "touch", body, anchor_x, anchor_y )
``````

<div class="float-right" style="max-width: 308px; margin-top: 12px;">

![][images.simulator.joint-touch]

</div>

### Anchor Point

For touch joints, the anchor point can be considered the point at which to "connect" the body. For example, to connect a body by its center point, specify `body.x` and `body.y` as the last two arguments. Alternatively, to drag an object by the point it was touched on, use the `event.x` and `event.y` values returned by the [touch][api.event.touch] event. This anchor point is commonly configured as a point within the bounds of the body, although it can reside outside the bounds if desired.

Note that the body connected by the touch joint remains under simulation, so it will interact fully with the other bodies in the world. Also, the body will rotate realistically under gravity when connected by a <nobr>non-center</nobr> anchor point.

### Joint Target

The target-following behavior of a touch joint is set by passing __x__ and __y__ coordinates to the [touchJoint:setTarget()][api.type.Joint.setTarget] function:

* [touchJoint:setTarget()][api.type.Joint.setTarget] &mdash; Sets the current target (follow) point of the touch joint as represented by `targetX` and `targetY` in content space coordinates. This can be any specific content point, the location of the user's touch, the coordinates of some other object to follow, successive points along a path, etc.

<div class="code-indent" style="width:450px;">

``````lua
touchJoint:setTarget( targetX, targetY )
``````

</div>

### Damping/Frequency

* [touchJoint.dampingRatio][api.type.Joint.dampingRatio] &mdash; This [number][api.type.Number] value can range from `0` (no&nbsp;damping) to `1` (critical&nbsp;damping). With critical damping, all oscillations should vanish.

* [touchJoint.frequency][api.type.Joint.frequency] &mdash; This [number][api.type.Number] value specifies the <nobr>mass-spring</nobr> damping frequency in Hz. A low value will result in very low force for target following.

* [touchJoint.maxForce][api.type.Joint.maxForce] &mdash; This [number][api.type.Number] value specifies the maximum allowed force for the touch joint. By default, this attribute is 1000 &times; the mass of the body, allowing for fairly rapid target following.

### Other

* [touchJoint:getTarget()][api.type.Joint.getTarget] &mdash; This function returns the current target coordinates of the touch joint as specified by [touchJoint:setTarget()][api.type.Joint.setTarget].




<a id="rope"></a>

## Rope Joint

A rope joint connects two objects by a theoretical <nobr>non-elastic</nobr> rope. This restricts the maximum distance between the two bodies even if there are other significant forces upon them. The initial arguments are bodies `A` and `B` to join, followed by optional localized offset points which can be used to set <nobr>non-center</nobr> anchor points for each end of the rope.

``````lua
local ropeJoint = physics.newJoint( "rope", bodyA, bodyB, offsetA_x, offsetA_y, offsetB_x, offsetB_y )
``````

<div class="float-right" style="max-width: 308px; margin-top: 12px;">

![][images.simulator.joint-rope]

</div>

### Offset Ends

When configuring a rope joint, the offset values are optional and default to `0` unless set otherwise. Unlike other joints, these __x__ and __y__ values should not be specified in content space. Instead, they should be considered as localized offset values related to either body. For example, if you specify <nobr>`( ..., 0, 0, 0, 0 )`</nobr>, the rope ends will be attached to the center of each body. However, if you specify <nobr>`( ..., -20, -20, 10, 10 )`</nobr>, the rope end attached to body `A` will be offset 20 pixels left and upward of its center point, while the rope end attached to body `B` will be offset 10 pixels right and downward of its center point.

### Maximum Length

The maximum length of the rope can be set via the [ropeJoint.maxLength][api.type.Joint.maxLength] property. Unlike a [distance](#distance) joint which can be used to keep two bodies at a fixed distance apart, the theoretical rope can bend/flex like an actual rope, but the maximum distance will always be constrained to this value.

* [ropeJoint.maxLength][api.type.Joint.maxLength] &mdash; This [number][api.type.Number] specifies the maximum separation length of the two bodies (rope&nbsp;length), in pixels. 

### Other

* [ropeJoint.limitState][api.type.Joint.limitState] &mdash; Read-only [string][api.type.String] value that indicates the current limit state of the rope joint: `"inactive"`, `"lower"`, `"upper"`, or  `"equal"`.




<a id="gear"></a>

## Gear Joint

To simulate sophisticated mechanical contraptions involving gears, consider using gear joints. This joint can link two bodies&nbsp;&mdash; or multiple bodies in sequence&nbsp;&mdash; in a <nobr>gear-like</nobr> setup. Then, one <nobr>motor-driven</nobr> body can realistically power the other bodies just like a real machine.

``````lua
local gearJoint = physics.newJoint( "gear", bodyA, bodyB, joint1, joint2, ratio )
``````


<div class="float-right" style="max-width: 308px; margin-top: 12px;">

![][images.simulator.joint-gear]

</div>

### Setup Requirements

The most important distinction of the gear joint is that it operates directly upon two other joints. These two joints must be created before instantiating the gear joint, and they must be either [pivot](#pivot) or [piston](#piston) joints. Once declared, one of pivot/piston joints can be powered by its motor and impact the other pivot/piston joint attached to the parent gear joint. The same principle applies to successive joints in a more complex chain configuration, assuming they are properly chained together by other gear joints.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Always destroy gear joints __before__ destroying the associated pivot/piston joints or their bodies. Otherwise, Box2D is liable to crash due to the orphaned gear joint pointers.

</div>
</div>

### Gear Ratio

Another important aspect of the gear joint is the `ratio` property. This indicates the ratio at which the <nobr>motor-driven</nobr> joint drives the corresponding joint in the gear configuration. The value can be either positive or negative, depending on the direction required to create an accurate simulation.

* [gearJoint.ratio][api.type.Joint.ratio] &mdash; This [number][api.type.Number] specifies the gear ratio, either positive or negative. It can be either set or read. Note that setting the correct ratio can be challenging when setting up a <nobr>[pivot](#pivot)-joined</nobr> object which drives a <nobr>[piston](#piston)-joined</nobr> object, as shown in the diagram. In this case, the gear joint ratio between wheel `B` and wheel `C` are `1.0` since wheel `B` directly drives `C`. However, you must calculate the ratio for the gear joint which links wheel `C` to the vertical bar (`D`), and because wheel `C` has a larger circumference than wheel `B`, this ratio would not be `1.0`.

### Other

* [gearJoint.joint1][api.type.Joint.joint1] &mdash; Read-only [Userdata][api.type.Userdata] reference to the first [pivot](#pivot) or [piston](#piston) joint associated with the gear joint.

* [gearJoint.joint2][api.type.Joint.joint2] &mdash; Read-only [Userdata][api.type.Userdata] reference to the second [pivot](#pivot) or [piston](#piston) joint associated with the gear joint.
