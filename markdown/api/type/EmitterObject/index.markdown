
# EmitterObject

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          EmitterObject
> __See also__			[display.newEmitter()][api.library.display.newEmitter]
>						[EmitterObject:start()][api.type.EmitterObject.start]
>						[EmitterObject:stop()][api.type.EmitterObject.stop]
>						[EmitterObject:pause()][api.type.EmitterObject.pause]
> --------------------- ------------------------------------------------------------------------------------------

<!--- Style used only on this page -->
<style type="text/css">
.fix-wid { min-width: 210px; display: block; }
</style>


## Overview

This object is used to display particle effects.

See the [display.newEmitter()][api.library.display.newEmitter] documentation for details about creating a new emitter.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

To modify the appearance of an emitter object, specific parameters can be set/modified directly as properties of the object &mdash; see the [properties](#properties) section below for a list of valid emitter properties.

</div>


## Functions

_(Inherits methods from [DisplayObject][api.type.DisplayObject])_

#### [object:start()][api.type.EmitterObject.start]

#### [object:stop()][api.type.EmitterObject.stop]

#### [object:pause()][api.type.EmitterObject.pause]


<a id="properties"></a>

## Properties

_(Inherits properties from [DisplayObject][api.type.DisplayObject])_

### Emitter &mdash; General

These properties relate to general emitter behavior.

<div class="inner-table">
<span class="fix-wid">Property</span>	Description
--------------------------------------	------------------
`state`									[String][api.type.String] value <nobr>(read-only)</nobr> which indicates the playing state of the emitter. Values include `"playing"`, `"stopped"`, or `"paused"`, based on the result of the emitter functions listed above.
`textureFileName`						[String][api.type.String] indicating the file (image) used for emitted particles. This file can __not__ be changed dynamically following creation of the emitter via [display.newEmitter()][api.library.display.newEmitter].
`maxParticles`							[Number][api.type.Number] which limits the amount of particles that can be emitted at any given time. Excessively high values may impact performance on some devices. This is a read-only property.
`angle`									[Number][api.type.Number] indicating the angle, in degrees, of particle emission. Note that this value __must__ be adjusted by `-90` (degrees) to account for Corona's coordinate system (`0`&nbsp;degrees&nbsp;pointing <nobr>directly up) &mdash;</nobr> for example, if you want the particles to be emitted directly upward, set this to `-90`.
`angleVariance`							[Number][api.type.Number] indicating the __variance__ on the angle of particle emission (`angle`).
`emitterType`							[Number][api.type.Number] indicating the emitter type. Set this to `0` for a point/line/field emitter&nbsp;&mdash; sometimes referred to as a "gravity" type emitter&nbsp;&mdash; or `1` for a radial emitter. For each type, additional unique properties apply as indicated in the following sections.
`absolutePosition`						[Boolean][api.type.Boolean] or [GroupObject][api.type.GroupObject] indicating how the generated particles should behave in relation to the emitter. If `true`, all particles are independent of the emitter. If the emitter orientation/angle changes, all particles will continue their transformations independently. If `false`, particles will move relative to the emitter if its orientation/angle changes. If set to [GroupObject][api.type.GroupObject] particles will transform following the specified parent group. For example, if set to the background group and the whole background is moved, particles will move with the background. The group must be in the parent chain of the emitter. If the emitter is removed from the group, this setting will change to `true`. Group can only be assigned __after__ emitter is created.
`duration`								[Number][api.type.Number] indicating the duration in seconds for which the emitter should emit particles. A value of `-1` indicates endless emission.
--------------------------------------	------------------

</div>

### Emitter &mdash; Point/Line/Field

These properties are intended for emitters where particles should originate from a point, line, or rectangular field relative to the origin. For this emitter type, the `emitterType` property should be set to&nbsp;`0`.

<div class="inner-table">
<span class="fix-wid">Property</span>	Description
--------------------------------------	------------------
`speed`									[Number][api.type.Number] indicating the speed at which the particles should be emitted.
`speedVariance`							[Number][api.type.Number] indicating the __variance__ on the particle emission speed (`speed`).
`sourcePositionVariancex`				[Number][api.type.Number] which extends the horizontal range of particle emission outward from the emitter's origin.
`sourcePositionVariancey`				[Number][api.type.Number] which extends the vertical range of particle emission outward from the emitter's origin.
`gravityx`								[Number][api.type.Number] for the implied particle gravity along the __x__ axis.
`gravityy`								[Number][api.type.Number] for the implied particle gravity along the __y__ axis.
`radialAcceleration`					[Number][api.type.Number] which, when positive, causes particles to accelerate radially outward from the emitter's origin. When negative, produces an inward acceleration toward the origin.
`radialAccelVariance`					[Number][api.type.Number] indicating the __variance__ on radial acceleration (`radialAcceleration`).
`tangentialAcceleration`				[Number][api.type.Number] indicating the tangential acceleration of particles relative to the emitter's origin.
`tangentialAccelVariance`				[Number][api.type.Number] indicating the __variance__ on tangential acceleration (`tangentialAcceleration`).
--------------------------------------	------------------

</div>

### Emitter &mdash; Radial

These properties are intended for emitters where particles should originate in a radial orientation relative to the origin. For this emitter type, the `emitterType` property should be set to&nbsp;`1`.

<div class="inner-table">
<span class="fix-wid">Property</span>	Description
--------------------------------------	------------------
`maxRadius`								[Number][api.type.Number] indicating the maximum radius outward from the emitter's origin at which particles may originate.
`maxRadiusVariance`						[Number][api.type.Number] indicating the __variance__ on the maximum emission radius (`maxRadius`).
`minRadius`								[Number][api.type.Number] indicating the minimum radius outward from the emitter's origin at which particles may originate.
`minRadiusVariance`						[Number][api.type.Number] indicating the __variance__ on the minimum emission radius (`minRadius`).
`rotatePerSecond`						[Number][api.type.Number] indicating the radial rotation of particles in degrees per second.
`rotatePerSecondVariance`				[Number][api.type.Number] indicating the __variance__ on the radial rotation of particles (`rotatePerSecond`).
--------------------------------------	------------------

</div>

### Particles &mdash; General

These properties control general <nobr>per-particle</nobr> behavior.

<div class="inner-table">
<span class="fix-wid">Property</span>	Description
--------------------------------------	------------------
`particleLifespan`						[Number][api.type.Number] indicating the lifespan of an individual particle in seconds. After this duration, the particle will automatically be removed from the screen.
`particleLifespanVariance`				[Number][api.type.Number] indicating the __variance__ on an individual particle's lifespan (`particleLifespan`).
`startParticleSize`						[Number][api.type.Number] indicating the __initial__ size of each particle.
`startParticleSizeVariance`				[Number][api.type.Number] indicating the __variance__ on the __initial__ size of each particle (`startParticleSize`).
`finishParticleSize`					[Number][api.type.Number] indicating the __ending__ size of each particle.
`finishParticleSizeVariance`			[Number][api.type.Number] indicating the __variance__ on the __ending__ size of each particle (`finishParticleSize`).
`rotationStart`							[Number][api.type.Number] indicating the __initial__ rotation of the particle.
`rotationStartVariance`					[Number][api.type.Number] indicating the __variance__ on the __initial__ rotation of the particle (`rotationStart`).
`rotationEnd`							[Number][api.type.Number] indicating the __ending__ rotation of the particle.
`rotationEndVariance`					[Number][api.type.Number] indicating the __variance__ on the __ending__ rotation of the particle (`rotationEnd`).
--------------------------------------	------------------

</div>

### Particles &mdash; Color/Alpha

These properties control the starting and ending color channel values of individual particles.

<div class="inner-table">
<span class="fix-wid">Property</span>	Description
--------------------------------------	------------------
`startColorRed`							[Number][api.type.Number] for each particle's __initial__ red color channel value. Valid range is <nobr>`0` to `1`</nobr>.
`startColorGreen`						[Number][api.type.Number] for each particle's __initial__ green color channel value. Valid range is <nobr>`0` to `1`</nobr>.
`startColorBlue`						[Number][api.type.Number] for each particle's __initial__ blue color channel value. Valid range is <nobr>`0` to `1`</nobr>.
`startColorAlpha`						[Number][api.type.Number] for each particle's __initial__ alpha channel value. Valid range is <nobr>`0` to `1`</nobr>.
`startColorVarianceRed`					[Number][api.type.Number] for the __variance__ on each particle's __initial__ red color channel value (`startColorRed`). Valid range is <nobr>`0` to `1`</nobr>.
`startColorVarianceGreen`				[Number][api.type.Number] for the __variance__ on each particle's __initial__ green color channel value (`startColorGreen`). Valid range is <nobr>`0` to `1`</nobr>.
`startColorVarianceBlue`				[Number][api.type.Number] for the __variance__ on each particle's __initial__ blue color channel value (`startColorBlue`). Valid range is <nobr>`0` to `1`</nobr>.
`startColorVarianceAlpha`				[Number][api.type.Number] for the __variance__ on each particle's __initial__ alpha channel value (`startColorAlpha`). Valid range is <nobr>`0` to `1`</nobr>.
`finishColorRed`						[Number][api.type.Number] for each particle's __ending__ red color channel value. Valid range is <nobr>`0` to `1`</nobr>.
`finishColorGreen`						[Number][api.type.Number] for each particle's __ending__ green color channel value. Valid range is <nobr>`0` to `1`</nobr>.
`finishColorBlue`						[Number][api.type.Number] for each particle's __ending__ blue color channel value. Valid range is <nobr>`0` to `1`</nobr>.
`finishColorAlpha`						[Number][api.type.Number] for each particle's __ending__ alpha channel value. Valid range is <nobr>`0` to `1`</nobr>.
`finishColorVarianceRed`				[Number][api.type.Number] for the __variance__ on each particle's __ending__ red color channel value (`finishColorRed`). Valid range is <nobr>`0` to `1`</nobr>.
`finishColorVarianceGreen`				[Number][api.type.Number] for the __variance__ on each particle's __ending__ green color channel value (`finishColorGreen`). Valid range is <nobr>`0` to `1`</nobr>.
`finishColorVarianceBlue`				[Number][api.type.Number] for the __variance__ on each particle's __ending__ blue color channel value (`finishColorBlue`). Valid range is <nobr>`0` to `1`</nobr>.
`finishColorVarianceAlpha`				[Number][api.type.Number] for the __variance__ on each particle's __ending__ alpha channel value (`finishColorAlpha`). Valid range is <nobr>`0` to `1`</nobr>.
--------------------------------------	------------------

</div>

### Particles &mdash; Blend Modes

These properties allow you to control how the source and destination factors are used in the blending calculation of particles. They follow the blend factors discussed in the [OpenGL-ES 2 specification](http://www.khronos.org/opengles/sdk/docs/man/xhtml/glBlendEquationSeparate.xml).

<div class="inner-table">
<span class="fix-wid">Property</span>	Description
--------------------------------------	------------------
`blendFuncSource`						[Number][api.type.Number] indicating the source color written by the fragment shader. When specifying this property for your emitter, enter the __value__ from the [list](#values) below, not the string name of the blend operation.
`blendFuncDestination`					[Number][api.type.Number] indicating the destination color from the image in the framebuffer. When specifying this property for your emitter, enter the __value__ from the [list](#values) below, not the string name of the blend operation.
--------------------------------------	------------------

</div>

<a id="values"></a>

<div class="inner-table">

Value	Blend Operation
------	------------------
`0`		`GL_ZERO`
`1`		`GL_ONE`
`774`	`GL_DST_COLOR`
`775`	`GL_ONE_MINUS_DST_COLOR`
`770`	`GL_SRC_ALPHA`
`771`	`GL_ONE_MINUS_SRC_ALPHA`
`772`	`GL_DST_ALPHA`
`773`	`GL_ONE_MINUS_DST_ALPHA`
`776`	`GL_SRC_ALPHA_SATURATE`
`768`	`GL_SRC_COLOR`
`769`	`GL_ONE_MINUS_SRC_COLOR`
------	------------------

</div>


<!--- These are unknown or unpredictable in testing
`absolutePosition`
`emissionRateInParticlesPerSeconds`
-->
