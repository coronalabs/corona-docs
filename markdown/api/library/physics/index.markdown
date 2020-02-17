
# physics.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          physics, collision, joint, Box2D
> __See also__			[Physics Setup][guide.physics.physicsSetup] _(guide)_
>						[Physics Bodies][guide.physics.physicsBodies] _(guide)_
>						[Collision Detection][guide.physics.collisionDetection] _(guide)_
>						[Physics Joints][guide.physics.physicsJoints] _(guide)_
>						[Physics Notes/Limitations][guide.physics.limitations] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Physics are commonly used for apps that involve a simulation of objects that move, collide, and interact under various physical forces like gravity. Corona makes it very easy to add physics to your apps, even if you've never worked with a physics engine before. While the underlying engine is built around the popular Box2D, we've taken a different design approach which eliminates a lot of the coding that is traditionally required.

To work with the Corona physics engine, just begin with familiar Corona [display&nbsp;objects][guide.media.displayObjects]. Corona treats physical body properties as an extension of its graphics objects, so any standard display object including images, vector objects, or animated sprites can be "made&nbsp;physical" and they will automatically interact with other objects in the simulation.


## Properties

#### [physics.engineVersion][api.library.physics.engineVersion]


## Functions

#### [physics.addBody()][api.library.physics.addBody]

#### [physics.removeBody()][api.library.physics.removeBody]

#### [physics.start()][api.library.physics.start]

#### [physics.pause()][api.library.physics.pause]

#### [physics.stop()][api.library.physics.stop]

#### [physics.newJoint()][api.library.physics.newJoint]

#### [physics.rayCast()][api.library.physics.rayCast]

#### [physics.reflectRay()][api.library.physics.reflectRay]

#### [physics.newParticleSystem()][api.library.physics.newParticleSystem]

#### [physics.queryRegion()][api.library.physics.queryRegion]

#### [physics.setGravity()][api.library.physics.setGravity]

#### [physics.getGravity()][api.library.physics.getGravity]

#### [physics.setDrawMode()][api.library.physics.setDrawMode]

#### [physics.setScale()][api.library.physics.setScale]

#### [physics.setTimeScale()][api.library.physics.setTimeScale]

#### [physics.getTimeScale()][api.library.physics.getTimeScale]

#### [physics.setTimeStep()][api.library.physics.setTimeStep]

#### [physics.setPositionIterations()][api.library.physics.setPositionIterations]

#### [physics.setVelocityIterations()][api.library.physics.setVelocityIterations]

#### [physics.setContinuous()][api.library.physics.setContinuous]

#### [physics.setAverageCollisionPositions()][api.library.physics.setAverageCollisionPositions]

#### [physics.getAverageCollisionPositions()][api.library.physics.getAverageCollisionPositions]

#### [physics.setReportCollisionsInContentCoordinates()][api.library.physics.setReportCollisionsInContentCoordinates]

#### [physics.getReportCollisionsInContentCoordinates()][api.library.physics.getReportCollisionsInContentCoordinates]

#### [physics.setDebugErrorsEnabled()][api.library.physics.setDebugErrorsEnabled]

#### [physics.getDebugErrorsEnabled()][api.library.physics.getDebugErrorsEnabled]

#### [physics.setMKS()][api.library.physics.setMKS]

#### [physics.getMKS()][api.library.physics.getMKS]

#### [physics.toMKS()][api.library.physics.toMKS]

#### [physics.fromMKS()][api.library.physics.fromMKS]
