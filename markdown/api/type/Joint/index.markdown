# Joint

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Userdata][api.type.Userdata]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, joints
> __See also__          [Physics Joints][guide.physics.physicsJoints] _(guide)_
>								[physics.newJoint()][api.library.physics.newJoint]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Joints can be used to assemble complex physical objects from multiple rigid bodies. For example, joints can be used to join the limbs of a ragdoll figure, attach the wheels of a vehicle to its body, create a moving elevator platform, and more. All joints are created using the [physics.newJoint()][api.library.physics.newJoint] constructor.

Please refer to the [Physics Joints][guide.physics.physicsJoints] guide for details on the setup and configuration of each joint type.


## Properties

<div class="small-header">Shared</div>

#### [joint.isActive][api.type.Joint.isActive]

#### [joint.isCollideConnected][api.type.Joint.isCollideConnected]

#### [joint.reactionTorque][api.type.Joint.reactionTorque]

<div class="small-header">Distance Joint</div>

#### [distanceJoint.dampingRatio][api.type.Joint.dampingRatio]

#### [distanceJoint.frequency][api.type.Joint.frequency]

#### [distanceJoint.length][api.type.Joint.length]

<div class="small-header">Friction Joint</div>

#### [frictionJoint.maxForce][api.type.Joint.maxForce]

#### [frictionJoint.maxTorque][api.type.Joint.maxTorque]

<div class="small-header">Gear Joint</div>

#### [gearJoint.joint1][api.type.Joint.joint1]

#### [gearJoint.joint2][api.type.Joint.joint2]

#### [gearJoint.ratio][api.type.Joint.ratio]

<div class="small-header">Piston Joint</div>

#### [pistonJoint.isLimitEnabled][api.type.Joint.isLimitEnabled]

#### [pistonJoint.isMotorEnabled][api.type.Joint.isMotorEnabled]

#### [pistonJoint.jointSpeed][api.type.Joint.jointSpeed]

#### [pistonJoint.jointTranslation][api.type.Joint.jointTranslation]

#### [pistonJoint.maxMotorForce][api.type.Joint.maxMotorForce]

#### [pistonJoint.motorSpeed][api.type.Joint.motorSpeed]

#### [pistonJoint.motorForce][api.type.Joint.motorForce]

#### [pistonJoint.referenceAngle][api.type.Joint.referenceAngle]

<div class="small-header">Pivot Joint</div>

#### [pivotJoint.isLimitEnabled][api.type.Joint.isLimitEnabled]

#### [pivotJoint.isMotorEnabled][api.type.Joint.isMotorEnabled]

#### [pivotJoint.jointAngle][api.type.Joint.jointAngle]

#### [pivotJoint.jointSpeed][api.type.Joint.jointSpeed]

#### [pivotJoint.maxMotorTorque][api.type.Joint.maxMotorTorque]

#### [pivotJoint.motorSpeed][api.type.Joint.motorSpeed]

#### [pivotJoint.motorTorque][api.type.Joint.motorTorque]

#### [pivotJoint.referenceAngle][api.type.Joint.referenceAngle]

<div class="small-header">Pulley Joint</div>

#### [pulleyJoint.length1][api.type.Joint.length1]

#### [pulleyJoint.length2][api.type.Joint.length2]

#### [pulleyJoint.ratio][api.type.Joint.ratio]

<div class="small-header">Touch Joint</div>

#### [touchJoint.dampingRatio][api.type.Joint.dampingRatio]

#### [touchJoint.frequency][api.type.Joint.frequency]

#### [touchJoint.maxForce][api.type.Joint.maxForce]

<div class="small-header">Wheel Joint</div>

#### [wheelJoint.jointSpeed][api.type.Joint.jointSpeed]

#### [wheelJoint.jointTranslation][api.type.Joint.jointTranslation]

#### [wheelJoint.springDampingRatio][api.type.Joint.springDampingRatio]

#### [wheelJoint.springFrequency][api.type.Joint.springFrequency]

<div class="small-header">Weld Joint</div>

#### [weldJoint.dampingRatio][api.type.Joint.dampingRatio]

#### [weldJoint.frequency][api.type.Joint.frequency]

#### [weldJoint.referenceAngle][api.type.Joint.referenceAngle]

<div class="small-header">Rope Joint</div>

#### [ropeJoint.limitState][api.type.Joint.limitState]

#### [ropeJoint.maxLength][api.type.Joint.maxLength]


## Methods

_(Inherits methods from [Userdata][api.type.Userdata])_

<div class="small-header">Shared</div>

#### [joint:getAnchorA()][api.type.Joint.getAnchorA]

#### [joint:getAnchorB()][api.type.Joint.getAnchorB]

#### [joint:getLocalAnchorA()][api.type.Joint.getLocalAnchorA]

#### [joint:getLocalAnchorB()][api.type.Joint.getLocalAnchorB]

#### [joint:getReactionForce()][api.type.Joint.getReactionForce]

#### [joint:removeSelf()][api.type.Joint.removeSelf]

<div class="small-header">Touch Joint</div>

#### [touchJoint:getTarget()][api.type.Joint.getTarget]

#### [touchJoint:setTarget()][api.type.Joint.setTarget]

<div class="small-header">Piston Joint</div>

#### [pistonJoint:getLimits()][api.type.Joint.getLimits]

#### [pistonJoint:getLocalAxisA()][api.type.Joint.getLocalAxisA]

#### [pistonJoint:setLimits()][api.type.Joint.setLimits]

<div class="small-header">Pivot Joint</div>

#### [pivotJoint:getRotationLimits()][api.type.Joint.getRotationLimits]

#### [pivotJoint:setRotationLimits()][api.type.Joint.setRotationLimits]

<div class="small-header">Pulley Joint</div>

#### [pulleyJoint:getGroundAnchorA()][api.type.Joint.getGroundAnchorA]

#### [pulleyJoint:getGroundAnchorB()][api.type.Joint.getGroundAnchorB]

<div class="small-header">Wheel Joint</div>

#### [wheelJoint:getLocalAxisA()][api.type.Joint.getLocalAxisA]
