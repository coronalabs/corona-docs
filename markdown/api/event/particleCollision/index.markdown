
# particleCollision

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          particleCollision, physics, LiquidFun
> __See also__          [physics.newParticleSystem()][api.library.physics.newParticleSystem]
>								[ParticleSystem][api.type.ParticleSystem]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Collisions between rigid bodies and [ParticleSystem][api.type.ParticleSystem] particles are exposed through the Corona event listener model using the `"particleCollision"` event.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

When implementing particle collisions, you must set the `"fixtureContactListener"` flag for each generated [particle][api.type.ParticleSystem.createParticle] or [particle group][api.type.ParticleSystem.createGroup]. If this flag is omitted, you will not receive particle collision responses.

</div>


## Properties

#### [event.name][api.event.particleCollision.name]

#### [event.phase][api.event.particleCollision.phase]

#### [event.object][api.event.particleCollision.object]

#### [event.element][api.event.particleCollision.element]

#### [event.particleSystem][api.event.particleCollision.particleSystem]

#### [event.x][api.event.particleCollision.x]

#### [event.y][api.event.particleCollision.y]

#### [event.normalX][api.event.particleCollision.normalX]

#### [event.normalY][api.event.particleCollision.normalY]

#### [event.r][api.event.particleCollision.r]

#### [event.g][api.event.particleCollision.g]

#### [event.b][api.event.particleCollision.b]

#### [event.a][api.event.particleCollision.a]

